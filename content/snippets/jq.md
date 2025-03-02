---
title: 'jq'
date: '2025-02-17'
draft: false
description: "Personal jq expression language reference"
tags: ["snippets","jq","bash scripting"]
---

Personal `jq` expression language reference

- create custom output with string interpolation from array of objects

```bash
.[] | "\(.var1) \(.var2)"
```

- count number of elements in array

```bash
.[] | length
```

- loop an array and run command for each element

```bash
jq -c '.[]' input.json | while read i; do
done
```
