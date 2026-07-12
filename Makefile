SHELL=/bin/bash

CONTENT_DIR = content
filename = $(shell date '+%s')

.PHONY: page game missing_description missing_title lint post drafts

aliases:
	find $(CONTENT_DIR) -type f -name '*.md' | parallel yq --front-matter=process -i '.aliases = [ "/" + .title | sub(" ","-"), "/" + (.slug | sub(".md", "" )), "/" + (.book | sub(" ","-")) + "/" + (.slug | sub(".md","")), "/" + (.book | sub(" ","-")) + "/" + (.title | sub(" ","-")) ]' {}

missing_slug:
	find $(CONTENT_DIR) -type f -name '*.md' | parallel 'grep -q "slug: {/}" {} || echo {}'

missing_description:
	grep $(CONTENT_DIR) -Lr -e '^description: .*'

missing_title:
	grep $(CONTENT_DIR) -Lr -e '^title: .*'

drafts:
	find $(CONTENT_DIR) -type f -name '*.md' | parallel 'yq --front-matter=query "select(.draft == true ) | filename" {}'

lint:
	find $(CONTENT_DIR) -type f -name '*.md' | parallel 'yq --front-matter=process -i "sort_keys(.)" {}'

.git/hooks/pre-commit:
	echo -e "/bin/bash\nmake lint" > $@
	chmod +x $@


page: $(CONTENT_DIR)/$(filename).md

post: $(CONTENT_DIR)/posts/$(filename).md

game: $(CONTENT_DIR)/games/$(filename).md

content/%.md:
	test -f $@ || IGDB_ID=$(igdb_id) hugo new $@
