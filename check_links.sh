#!/bin/bash
grep -or -E '\[[^]]+\]\([^)]*\)' content/ | awk -F':' '{print $1,$2 ":" $3}' |  while read file link; do
dest="$(echo "$link" |  awk -F '(' '{print $2}' | awk -F ')' '{print $1}' | awk -F'#' '{print $1}' )"
 if [[ "$dest" == https://* ]];then
  curl -Ls $dest > /dev/null 2>&1 || "$file:$dest"
elif [[ ! -z $dest ]]; then
  test -f "content/$dest" || echo "$file:$dest";
fi
done
