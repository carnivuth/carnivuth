SHELL=/bin/bash

CONTENT_DIR = content
filename = $(shell date '+%s')

.PHONY: page game missing_description missing_title lint post

missing_description:
	find $(CONTENT_DIR) -type f -name '*.md' | parallel 'yq --front-matter=query "select(.description == null or .description == \"\" ).slug" {}'

missing_title:
	find $(CONTENT_DIR) -type f -name '*.md' | parallel 'yq --front-matter=query "select(.title == null or .title == \"\" ).slug" {}'

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
endif
