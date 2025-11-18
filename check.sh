#!/bin/bash

CONTENT_DIR=content
IMAGE_DIR=static

function list_drafts(){
  grep -l -e '^draft: true$' $CONTENT_DIR/*
}

function count_drafts(){
  echo there are $( list_drafts | wc -l) notes in draft
}

function list_broken_links(){
  grep -or -E '\[[^]]+\]\([^)]*\)' $CONTENT_DIR | awk -F':' '{print $1,$2 ":" $3}' |  while read file link; do
  dest="$(echo "$link" |  awk -F '(' '{print $2}' | awk -F ')' '{print $1}' | awk -F'#' '{print $1}' )"
  if [[ "$dest" == https://* ]];then
    curl -Ls $dest > /dev/null 2>&1 || "$file:$dest"
  elif [[ ! -z $dest ]]; then
    test -f "$CONTENT_DIR/$dest" || test -f "$IMAGE_DIR/$dest" || echo "$file:$dest";
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
  list_missing_title)
    list_missing_title
    ;;
  list_broken_slug)
    list_broken_slug
    ;;
  all)
    echo broken slugs:
    list_broken_slug
    echo drafts:
    list_drafts
    echo broken links:
    list_broken_links
    echo missing description:
    list_missing_description
    ;;
esac
