---
title: "proxmox"
description: "proxmox notes and personal reference"
date: 2024-09-29
series:
  - "Technologies notes"
draft: false
series_order: 14
tags:
  - virtualization
  - machine lifecicle
  - hooks
  - disk management
  - lvm
  - lxc
  - container
  - api
  - terraform
  - proxmox
  - cloud init
  - provisioning
  - infrastructure as code
---

# Proxmox

Proxmox is an open source solution for management of server resources with a focus on virtualization, it's based on a set of open source tecnologies like:

- kvm
- qemu
- lxc
- lvm

## Hooks

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

## Cloud init

In order to use `terraform` as a [IaC](https://it.wikipedia.org/wiki/Infrastructure_as_Code) tool in a `proxmox` cluster [cloud init templates](https://pve.proxmox.com/wiki/Cloud-Init_Support) are needed to generate vms from, in order to generate a cloud init template:

- download cloud init image template (*ubuntu 24.04 in this example*)

> on the proxmox host
```bash
cd /tmp/
wget https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img
virt-customize -a noble-server-cloudimg-amd64.img --install qemu-guest-agent
```

- create a virtual machine that will become the template and import the disk with the image

```bash
qm create 9000 --name "ubuntu-2404-cloudinit-template" --memory 2048 --cores 2 --net0 virtio,bridge=vmbr0
qm importdisk 9000 noble-server-cloudimg-amd64.img local-lvm
```

- set scsi device emulation and other parameters

```bash
qm set 9000 --scsihw virtio-scsi-pci --scsi0 local-lvm:vm-9000-disk-0
qm set 9000 --boot c --bootdisk scsi0
qm set 9000 --ide2 local-lvm:cloudinit
qm set 9000 --serial0 socket --vga serial0
qm set 9000 --agent enabled=1
```

- convert vm to template

```bash
qm template 9000
```

[<](pages/technologies/pass.md)[>](pages/technologies/terraform.md)
