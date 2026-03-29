#!/bin/bash

test -z $CONTENT_DIR && CONTENT_DIR=content
test -z $IMAGE_DIR && IMAGE_DIR=static


function get_fm_param(){
  find $CONTENT_DIR -type f -name '*.md' -exec yq --front-matter=extract "$1" -r {} \;
}

function set_aliases(){
  find $CONTENT_DIR -type f -name '*.md' | while read file; do
    slug="$(basename $file .md)"
    title=$(yq --front-matter=extract '.title' "$file" -r | tr ' ' '-')
    category=$(yq --front-matter=extract '.categories[0]' "$file" -r | tr ' ' '-')
    test ! -z $DEBUG && echo "setting $slug $category $title for $file"
    yq --front-matter=process '.aliases = ["/'"$title"'","/'"$slug"'","/'"$category"'/'"$slug"'","/'"$category"'/'"$title"'"]' -i "$file"
  done
}

# list book_order frontmatter values filtered by book vbalues
function list_book_order(){
  get_fm_param "select(.book == \"$BOOK\" ) | \"\(.book_order):\(.title)\"" | sort -n

}

function list_drafts(){
  grep -l -e '^draft: true$' $(find "$CONTENT_DIR" -type f -name '*.md')
}

function count_drafts(){
  echo there are $( list_drafts | wc -l) notes in draft
}

function lint_fm(){
  test -z $DEBUG || echo "Linting front matter for all markdown files in $CONTENT_DIR"
  find $CONTENT_DIR -type f -name '*.md' -exec yq --front-matter=process -i 'sort_keys(.)' {} \;
}

function list_broken_links(){
  grep -or -E '\[[^]]*\]\([^)]*\)' $CONTENT_DIR | awk -F':' '{print $1,$2 ":" $3}' |  while read file link; do
  dest="$(echo "$link" |  awk -F '(' '{print $2}' | awk -F ')' '{print $1}' | awk -F'#' '{print $1}' )"
  if [[ ! -z $dest ]]; then
    if ! test -f "$CONTENT_DIR/$dest" &&  ! test -f "$IMAGE_DIR/$dest"; then
      curl -ILs $dest > /dev/null 2>&1 || echo "$file:$dest";
    fi
  fi
done
}

function list_missing_description(){
  grep -l -e '^description:$' $CONTENT_DIR/*
  grep -L -e '^description: .*' $CONTENT_DIR/*
}

function list_missing_title(){
  grep -l -e '^title:$' $CONTENT_DIR/*
  grep -L -e '^title: .*' $CONTENT_DIR/*
}

function list_broken_slug(){
  find $CONTENT_DIR -type f -name '*.md' | while read file; do
  grep -q "slug: $(basename $file)" "$file" || echo "$file"
done
}

function pre_commit(){
  DEBUG=true set_aliases
  DEBUG=true lint_fm
}

function setup_repo_hooks(){
  mkdir -p .git/hooks
  echo "Setting up git hooks"
  echo -e '#!/bin/bash\n./check.sh pre_commit' > .git/hooks/pre-commit
  chmod +x .git/hooks/pre-commit
}

function list_tags(){
  get_fm_param '.tags[]' | sort -u
}

function list_broken(){
    list_broken_slug
    list_drafts
    list_broken_links
    list_missing_description
}


function help(){
  echo "usage: $(basename "$0") COMMAND [$FLAGS_STRING]"
  echo "list of commands:"
  for command in "${!COMMANDS[@]}"; do
    echo "       $command -> ${COMMANDS[$command]}"
  done
  echo "list of flags:"
  for flag in "${!FLAGS_DESCRIPTIONS[@]}"; do
    echo "       -$flag -> ${FLAGS_DESCRIPTIONS[$flag]}"
  done
}

declare -A FLAGS
declare -A FLAGS_DESCRIPTIONS
declare -A COMMANDS

FLAGS[b]='BOOK=${OPTARG}'
FLAGS_DESCRIPTIONS[b]='set book to filter book_order values, example -b "my_book"'

FLAGS_STRING='b:'

COMMANDS[help]="show this help command"
COMMANDS["set_aliases"]="set aliases in markdown files $CONTENT_DIR"
COMMANDS["list_drafts"]="list notes with draft:true in frontmatter"
COMMANDS["count_drafts"]="count draft notes under $CONTENT_DIR"
COMMANDS["lint_fm"]="lint markdown front matter in $CONTENT_DIR by sorting keys"
COMMANDS["list_broken_links"]="list broken links in files under $CONTENT_DIR"
COMMANDS["list_missing_description"]="list notes without description"
COMMANDS["list_missing_title"]="list notes without title"
COMMANDS["list_broken_slug"]="list notes with slug not matching 'basename file'"
COMMANDS["pre_commit"]="run pre-commit actions"
COMMANDS["setup_repo_hooks"]="setup git hooks"
COMMANDS["list_broken"]="list broken content"
COMMANDS["list_tags"]="list tag values"
COMMANDS["list_book_order"]="list book_order values filtered by book value"


COMMAND="$1"
shift
if [[ $COMMAND  == '' ]] || [[ $COMMAND  == -* ]]; then echo "first parameter must be a command"; help; exit 1; fi

if [[ ! -z $FLAGS_STRING ]];then
  while getopts $FLAGS_STRING flag; do
    [ "${FLAGS[$flag]}" ] && eval ${FLAGS[$flag]}
  done
fi

if [ "${COMMANDS[$COMMAND]}" ]; then
  "$COMMAND"
else
  echo "$COMMAND not exists"
  help
  exit 1
fi
