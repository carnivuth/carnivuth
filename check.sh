#!/bin/bash

test -z $CONTENT_DIR && CONTENT_DIR=content
test -z $IMAGE_DIR && IMAGE_DIR=static


function get_fm_param(){
  find $CONTENT_DIR -type f -name '*.md' -exec yq --front-matter=extract "$1" -r {} \; | grep -v null
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

function list_drafts(){
  grep -l -e '^draft: true$' $(find "$CONTENT_DIR" -type f -name '*.md')
}

function count_drafts(){
  echo there are $( list_drafts | wc -l) notes in draft
}
function lint_fm(){
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

function list_escaped_title(){
  grep -l -e '^title: ".*"' $CONTENT_DIR/*
}

function list_broken_slug(){
  find $CONTENT_DIR -type f -name '*.md' | while read file; do
  grep -q "slug: $(basename $file)" "$file" || echo "$file"
done
}

case "$1" in
  count_drafts)
    count_drafts
    ;;
  list_drafts)
    list_drafts
    ;;
  list_broken_links)
    list_broken_links
    ;;
  list_missing_description)
    list_missing_description
    ;;
  list_escaped_title)
    list_escaped_title
    ;;
  list_missing_title)
    list_missing_title
    ;;
  list_broken_slug)
    list_broken_slug
    ;;
  list_tags)
    get_fm_param '.tags[]' | sort -u
    ;;
  set_aliases)
    set_aliases
    ;;
  lint_fm)
    lint_fm
    ;;
  list_broken)
    list_broken_slug
    list_drafts
    list_broken_links
    list_missing_description
    ;;
esac
