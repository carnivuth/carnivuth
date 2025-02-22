---
title: 'Make and makefile'
date: '2025-02-09'
draft: true
description:
tags: ["snippets","make","makefile","make best practices"]
---

Make is a powerful build system with the simple concept of transforming files in other files based on a recipe

{{< mermaid >}}
flowchart LR
A[source files]
B(( recipe ))
C[output files]
A --> B --> C
{{</ mermaid >}}

## special chars

- `%`
- `@`
- `<`
- `^`

## PHONY targets

```make
.PHONY: build clean
```

## Make files for specific types of files

```make
BUILDDIR = ./build

%.png: %.mmd
	mkdir -p $(BUILDDIR)
	mmdc -i $< -o $(BUILDDIR)/$@

clean:
	rm -rf $(BUILDDIR)

build: $(patsubst %.mmd,%.png,$(wildcard *.mmd))
```
