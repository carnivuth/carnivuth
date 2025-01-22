---
date: 2024-10-25
title: Automate systems with git hooks
aliases: []
tags: []
draft: false
---

Git hooks are a special git feature that allow for script execution when some particular event is fired, they can be useful to automate some development operation needed to start the actual work (*update dev environment, setup packages,ecc...*) or as a very simple update system for software deployed directly as a git repo (*see my [personal dotfiles](https://github.com/carnivuth/scripts) for reference*).

To create a git hook create a script with the name of the event that should fired the script inside the `.git/hooks` directory, script are executed **from the root dir of the git repository**, some examples are already put there by git.

```bash
ls .git/hooks/
post-commit
```

## How to check if a file has changed

In order to run hooks only when specific files are modified git CLI can be used, here and example with the `post-commit` hook

```bash
#!/bin/bash
# Redirect output to stderr.
exec 1>&2
# check if last commit contains something that has notes in the name
INCLUDED=notes
if git diff --name-only HEAD HEAD~1 | grep "$INCLUDED"; then
# do something
else
  echo "no $INCLUDED modified, nothing to do"
fi
```

## Manage updates by triggering actions on pull

The best hook for triggering actions on pull is the `post-merge` hook, this can be useful when deploying git repos to production and the update procedure need to track run some commands, this solution is **suitable only for small projects**, in large environments this method is likely to cause more problems that avoid extra work.

For example my [personal dotfiles repo](https://github.com/carnivuth/scripts), update is managed trough a git hook created at installation time that runs the installation script at when a `git merge` event is fired

> installation script
```bash
# ......
function configure_hook(){
  # create default monitor configuration file if does not exists
  if [[ ! -e ".git/hooks/post-merge" ]]; then
    echo 'create post-merge hook'
    echo  -e "#!/bin/bash\n./scripts.sh" > ".git/hooks/post-merge"
  fi
  chmod +x ".git/hooks/post-merge"
}
# ......
```

> git post merge hook that is created
```bash
#!/bin/bash
./scripts.sh
```


