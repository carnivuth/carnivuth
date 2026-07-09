SHELL=/bin/bash

CONTENT_DIR = content
filename = $(shell date '+%s')

ifdef igdb_id
igdb_data := $(shell curl -s 'https://api.igdb.com/v4/games' -d "fields *; where id=$(igdb_id);" -H "Client-ID: $(IGDB_CLIENT_ID)" -H "Authorization: Bearer $(IGDB_ACCESS_TOKEN)" -H 'Accept: application/json')
time_to_beat := $(shell curl -s 'https://api.igdb.com/v4/game_time_to_beats' -d "fields *; where game_id=$(igdb_id);" -H "Client-ID: $(IGDB_CLIENT_ID)" -H "Authorization: Bearer $(IGDB_ACCESS_TOKEN)" -H 'Accept: application/json' )
image_id := $(shell curl -s 'https://api.igdb.com/v4/covers' -d "fields *; where game=$(igdb_id);" -H "Client-ID: $(IGDB_CLIENT_ID)" -H "Authorization: Bearer $(IGDB_ACCESS_TOKEN)" -H 'Accept: application/json' | jq -r '.[0].image_id')
genre_ids := $(shell echo '$(igdb_data)' | jq '.[0].genres[]' -r )
genres_data := $(shell curl -s 'https://api.igdb.com/v4/genres' -d "fields *; where id=\($$(echo $(genre_ids) | tr ' ' ',')\);" -H "Client-ID: $(IGDB_CLIENT_ID)" -H "Authorization: Bearer $(IGDB_ACCESS_TOKEN)" -H 'Accept: application/json')

game_name = $(shell echo '$(igdb_data)'| jq -r '.[0].name' )
game_url = $(shell echo '$(igdb_data)'| jq -r '.[0].url' )
ttb_normally="$(shell echo '$(time_to_beat)' | jq -r '.[0].normally | select(. !=null)')"
ttb_hastily="$(shell echo '$(time_to_beat)' | jq -r '.[0].hastily | select(. !=null)')"
ttb_completely="$(shell echo '$(time_to_beat)' | jq -r '.[0].completely | select(. !=null)')"
genres = $(shell echo '$(genres_data)'| jq '.|[.[].name]')
endif

.PHONY: page game missing_description missing_title lint post drafts

missing_description:
	find $(CONTENT_DIR) -type f -name '*.md' | parallel 'yq --front-matter=query "select(.description == null or .description == \"\" ) | filename " {}'

missing_title:
	find $(CONTENT_DIR) -type f -name '*.md' | parallel 'yq --front-matter=query "select(.title == null or .title == \"\" ) | filename" {}'

drafts:
	find $(CONTENT_DIR) -type f -name '*.md' | parallel 'yq --front-matter=query "select(.draft == true ) | filename" {}'

lint:
	find $(CONTENT_DIR) -type f -name '*.md' | parallel 'yq --front-matter=process -i "sort_keys(.)" {}'

.git/hooks/pre-commit:
	echo -e "/bin/bash\nmake lint" > $@
	chmod +x $@

content/%.md:
	hugo new $@

page: $(CONTENT_DIR)/$(filename).md

post: $(CONTENT_DIR)/posts/$(filename).md

game: $(CONTENT_DIR)/games/$(filename).md
ifdef igdb_id
	yq --front-matter=process -i '.igdb_id=$(igdb_id)' $<
	yq --front-matter=process ".title = \"$(game_name)\"" -i $<
	yq --front-matter=process ".description = \"$(game_name) journal\"" -i $<
	yq --front-matter=process ".references = [{\"title\": \"$(game_name) igdb page\",\"url\": \"$(game_url)\"}]" -i $<
	yq --front-matter=process ".time_to_beat.completely = \"$(ttb_completely)\"" -i $<
	yq --front-matter=process ".time_to_beat.hastily = \"$(ttb_hastily)\"" -i $<
	yq --front-matter=process ".time_to_beat.normally = \"$(ttb_normally)\"" -i $<
	yq --front-matter=process ".image = \"https://images.igdb.com/igdb/image/upload/t_1080p/$(image_id).jpg\"" -i $<
	yq --front-matter=process '.genres = $(genres)' -i $<
endif
