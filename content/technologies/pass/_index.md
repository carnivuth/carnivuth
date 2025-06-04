---
title: "Password store"
description: "password store configuration and setup"
date: 2025-01-20
series:
  - "Technologies notes"
draft: false
series_order: 13
tags:
  - password storage
  - git
  - gpg
---

`pass` is a handy program to manage passwords locally to a specific environment, it basically manage a local directory of text files encrypted with `gpg`

In order to initialize pass a `gpg` key is needed

```bash
gpg --full-gen-key
```

Then `pass` can be initialized with the id of the key generated

```bash
  pass init "[gpg_id]"
```

Key can be added like this

```bash
pass edit [path/to/file]
```

The command creates a subdirectory under the `.password_store` folder and opens vim to edit the password content, to generate a random password using `/dev/random`:

```bash
pass generate -c path/to/data num
```

Folder structure can be showed with the `pass list` command

## Git configuration

`pass` can be configured to store history of the folder with `git` so to maintain the password history

```bash
 pass git init
```

### Pushing to remote git repository

The git repository can be synced with a remote server as shown with github here as an example

```bash
cd ~/.password-store
gh repo create --source=. --private [repo-name]
git push --set-upstream origin main
```

## Backup gpg key

To backup keys in a text based format run

```bash
gpg --output backupkeys.pgp --armor --export-secret-keys --export-options export-backup [gpg_id]
```
