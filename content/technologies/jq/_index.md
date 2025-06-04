---
title: "jq"
description: "manipulate json content"
date: 2025-02-18
tags:
  - snippets
  - jq
  - bash scripting
series:
  - "Technologies notes"
draft: false
series_order: 7
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

- filter an array of object based on a parameter

```bash
jq '.[] | select(.param_name) | "\(.param_to_print)"'
```

[<](pages/technologies/jenkins.md)[>](pages/technologies/kubernetes.md)
