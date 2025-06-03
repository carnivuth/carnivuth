---
title: 'From nordpass to password store'
date: '2025-06-03'
draft: true
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

```bash
#!/bin/bash
rm -r converted
mkdir -p converted
cat "$1" |  while IFS=, read name url additional_urls username password note cardholdername cardnumber cvc pin expirydate zipcode folder full_name phone_number email address1 address2 city country state type custom_fields; do
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
