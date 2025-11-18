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
esac
