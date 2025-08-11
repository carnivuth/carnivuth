---
title: 'From nordpass to password store'
aliases:
  - /posts/from_nordpass_to_pass/_index.md
  - /posts/from_nordpass_to_pass
permalink: /posts/from_nordpass_to_pass/
date: '2025-06-03'
draft: false
description: "My personal journey from nordpass service to password store based system for managing passwords"
tags:
  - homelab
  - self hosting
  - password store
  - pass
  - nordpass
  - scripting
  - migration
---

In my personal journey of self hosting my one day to day services there was one thing that i keep procrastinating about, **passwords**.

To manage secrets for my personal IT infrastructure and my day to day life i used [nordpass](https://nordpass.com) services, it was quick, easy and convenient, but one of the major drawbacks for me was the linux client, it's not scriptable and i cannot integrate it with my personal menu utility which sucks.

So i started my journey to find something that will fit my needs that are:

- **simplicity**: i do not want to lose time managing complex docker services.
- **integration with browsers** in the form of extensions
- **distributed architecture**, I need to access passwords from different machines
- **independent clients**, I need to access passwords even if i can't reach the server

So after some time i decided to try the [standard unix password manager](https://www.passwordstore.org/) which is an elegant and simple solution to store passwords and all kinds of secrets that applies the unix philosophy *do one thing and do it well*

Pass is basically a tool to manage a folder structure with `pgp` encrypted files that can also leverage git to synchronize between different client, the encrypted files are basically text file that can be have a lot of formats, i opted for the following structure which take advantage of the nordpass format:

```text
[PASSWORD]
url: [URL TO THE WEBSITE]
username:
additional_urls:
note:
cardholdername:
cardnumber:
cvc:
pin:
expirydate:
zipcode:
folder:
full_name:
phone_number:
email:
address1:
address2:
city:
country:
state:
type:
custom_fields:
```

This way my i can also integrate my password store with the [ffpass](https://github.com/passff/passff) firefox integration for auto fill password fields in websites

## Migrating the password manager

After downloading a dump from nordpass i wrote a simple script to convert the `csv` file into a folder structure named after the website address

```bash
#!/bin/bash
cat "$1" |  while IFS=, read name url additional_urls username password note cardholdrrname cardnumber cvc pin expirydate zipcode folder full_name phone_number email address1 address2 city country state type custom_fields; do

if [[ -n $url ]]; then
  folder="$(echo "$url" | awk -F[/:] '{print $4}')"
  if dig "$folder" > /dev/null 2>&1; then
    echo "$folder is pingable"
  else
    echo "$folder NOT PINGABLE"
  fi
  mkdir -p "converted/$folder"
  filename="$folder/$name"
else
  filename="$name"
fi

echo "$password
url: ${url#"https://"}
username: $username
additional_urls: $additional_urls
note: $note
cardholdername: $cardholdername
cardnumber: $cardnumber
cvc: $cvc
pin: $pin
expirydate: $expirydate
zipcode: $zipcode
folder: $folder
full_name: $full_name
phone_number: $phone_number
email: $email
address1: $address1
address2: $address2
city: $city
country: $country
state: $state
type: $type
custom_fields: $custom_fields" > "converted/$filename"
gpg --output "converted/$filename.gpg" --recipient matti200042@gmail.com --encrypt "converted/$filename"
rm "converted/$filename"
done
```

## Android setup

Sadly, the android client for pass was discontinued 🥲 and i found this not so convenient but working solution using [termux](https://termux.dev/):

- Install from the store [termux](https://f-droid.org/packages/com.termux/) and [termux-api](https://f-droid.org/packages/com.termux.api/) applications

- inside termux install this packages

```bash
pkg update && \
pkg upgrade && \
pkg install bash-completion git gnupg openssh pass termux-api tree
```

Then clone the repository using git

```bash
git clone server:/passwordstore
```

Import `pgp` keys

```bash
gpg --import backupkeys.pgp
```

This way you can use passwords from termux application by coping in the android clipboard 👍

## Final considerations

Pass is still a good solution for storing encrypted files and shows the power of the unix philosophy: *do one thing and do it well*
