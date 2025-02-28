---
date: 2024-09-16
title: Proxmox hooks
aliases: []
tags: []
draft: false
---

Proxmox hooks are a feature that allows to run custom scripts when a Proxmox managed virtual machine or container generate some events.
Scripts are executed in multiple moments of the ct/vm life-cycle, they can be of different types (*e.g. bash perl python*) they run inside the proxmox host.

They are called as `scriptname <vmid> <phase>` where

- `vmid` is the id of the container/vm
- `phase` is a string that refers the lifecicle hook, can have 4 values: `pre-start post-start pre-stop post-stop`

They must reside under `/var/lib/vz/snippets/` and be executable, shbang is also needed to run with the correct interpreter, a template for a bash hook looks like this:

```bash
#!/bin/bash

DEPS=""
LOG_FILE="/var/log/filename.log"

vmid=$1
phase=$2

if [[ "$phase" == 'pre-start' ]]; then
fi

if [[ "$phase" == 'post-start' ]]; then
fi

if [[ "$phase" == 'pre-stop' ]]; then
fi

if [[ "$phase" == 'post-start' ]]; then
fi
```

Then the hook script can be added to a ct or a vm like this

```bash
# for containers
pct set 100 --hookscript local:snippets/script.sh
# for vms
qm set 100 --hookscript local:snippets/script.sh
```
