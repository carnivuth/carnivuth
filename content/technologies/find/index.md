---
title: "find"
layout: simple
aliases:
  - /technologies/find/index.md
  - /technologies/find
permalink: /technologies/find/index.md
date: 2025-01-20
tags:
  - oneliners
description: "how to find"
series: ["Technologies notes"]
draft: false
series_order: 3
---

The `find` command is handy tool to manage files inside the file system, the command structure is:

```bash
find dir criteria [action]
```

Where:

- `dir` is the starting dir
- `criteria` is a filter for the element that have to match
- `action` is the action to perform on the elements that matches the `criteria`

## Limit file search

In order to limit the depth level of the search the ` -maxdepth` option can be used

```bash
find dir -maxdepth <VALUE> criteria [action]
```

## Oneliners

- remove files only in current dir with confirmation

```bash
find . -maxdepth 1 -type f  -exec rm -i {} \;
```

- exclude elements by regex

```bash
find . -not -regex 'REGEX'
```

- filter by element name

```bash
find . -name 'REGEX'
```
