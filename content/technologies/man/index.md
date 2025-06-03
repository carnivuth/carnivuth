---
title: "man"
description: "man setup"
date: 2024-09-29
tags:
  - man
  - vim
  - nvim
  - tealdeer
  - arch wiki
  - wikiman
series:
  - "Technologies notes"
draft: false
series_order: 10
---

Linux ships with a lot of documentation in the form of man pages, that are too complex and time consuming to read for quick access to oneliners, too many times i have encountered myself with the problem of finding a pipe command to do a specific task and the man is not helpful in this cases, here my personal configuration to make man pages and command more pleasant to use:

- install the following packages

```bash
# on archlinux
pacman -S man vim nvim tealdeer wikiman arch-wiki-docs

# on debian
apt install -y man vim tealdeer
```

- update `tealdeer` database

```bash
tldr --update
```

- configure `vim` or `neovim` as manpager

>inside `.bashrc`
```bash
# for nvim
export MANPAGER="nvim +Man!"

# for vim
export MANPAGER="vim -M +MANPAGER - "
```

Quick script to set manpager based on distro

```bash
source /etc/os-release
if [[ "$ID"="archlinux" ]]; then
	export MANPAGER="nvim +Man!"
else
	export MANPAGER="vim -M +MANPAGER - "
fi
```

Now man can be browsed with vim keybindings and for quick oneliners the `tldr` command can be used

[<](pages/technologies/make.md)[>](pages/technologies/mathjax.md)
