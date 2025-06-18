---
title: "Navidrome"
description: "Notes on my personal music streaming service"
date: 2025-05-28
series: ["Technologies notes"]
draft: false
series_order: 17
date: 2025-05-28
---

 [navidrome](https://www.navidrome.org/) is a subsonic compatible musing streaming service that relies on metadata to catalog a music library

## Manage metadata

In order to work properly navidrome needs that tracks have metadata populated, to compile them there are a pletora of software, one of them being [picard](https://picard.musicbrainz.org/)

### Collection file structure

To keep things ordered and clean files inside the collection folder are organized as follows

```txt
collection/
├── artist 1
│   └── album 1
│       └── track 1
│   └── album 2
│       ├── track 1
│       ├── track 2
│       └── .....
├── artist 2
│   └── album 1
│       ├── track 1
│       └── .....
├── playlists
│   ├── ....nsp
│   ├── ....nsp
│   └── ....nsp
.....
```

In order to divide tracks in album folder run the following oneliners
>[!TIP] [picard](https://picard.musicbrainz.org/) can move files based on metadata values inside folders so this 2 snippets aren't needed

> this will create folder based on ALBUM metadata
```bash
find . -type f | parallel 'ffmpeg -i {} -f ffmetadata' 2>&1 | grep 'ALBUM ' |awk -F':' '{$1=""; print $0}' | while read dir; do
    if [[ -d "$dir" ]]; then
        echo "$dir already exists"
    else
        mkdir -p "$dir";
    fi
done
```

> this will move tracks in ALBUM folder according to metadata
```bash
find . -type f | while read f; do ALBUM="$(ffmpeg -i "$f" -f ffmetadata 2>&1 | grep 'ALBUM ' | awk -F':' '{$1="";print $0}' | awk '{$1=$1;print}')";
if [[ -f "$ALBUM/$f" ]]; then
    echo "$ALBUM/$f already exists";
else
    mv "$f" "$ALBUM/";
fi
done
```

## Creating smart playlists

Smart playlists are ways of grouping tracks together based on metadata values, they are defined inside `json` files with the `.nsp` extension

>file `last_played.nsp`
```json
{
  "name": "Recently Played",
  "comment": "Recently played tracks",
  "all": [
    {"inTheLast": {"lastPlayed": 30}}
  ],
  "sort": "lastPlayed",
  "order": "desc",
  "limit": 100
}
```

This `json` files are composed by a sequence of statements in the form

```json
    {"operator": {"field": "value"}}
```

The tracks with metadata that matches the statement are included inside the smart playlist, here a complete list of [fields and operators](https://www.navidrome.org/docs/usage/smartplaylists/#additional-resources)

## Backup physical collection

To backup the physical collection the process requires to acquire the audio tracks of a cd in a file format (*typically `wav`*) and then [edit metadata](#Manage-metadata), under archlinux the utility `cdda2wav` can do the job

> from the arch wiki
```bash
cdda2wav -vall cddb=-1 speed=4 -paranoia paraopts=proof -B -D /dev/sr0
```
> [!WARNING]
> Notes that paranoia parameters make the process slower, for cd that are in good conditions they can be omitted

An handy alias to avoid memorizing parameters

```bash
alias ripCD='mkdir temp && cd temp && cdda2wav -vall cddb=-1 speed=4 -paranoia paraopts=proof -B -D /dev/sr0'
```
