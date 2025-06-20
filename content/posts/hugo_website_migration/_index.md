---
title: How i came up with this blog
aliases:
  - /posts/hugo_website_migration/_index.md
  - /posts/hugo_website_migration
permalink: /posts/hugo_website_migration/_index.md
date: '2025-01-26'
description: Migrating from obsidian note system to a hugo blog
draft: false
tags:
  - obsidian
  - hugo
  - blog
  - website
---

It all started when i was asked to do SNMP v3 queries from command line and i soon realized i wasn't going to memorize something like this

> i still struggle to memorize common OID numbers 🫠, forget about this
```
snmpwalk -v3 -u [user] -l authNoPriv -a md5 -A [community] [node] [oid]
```

So i decided to take a step into manage the knowledge i gain day by day in some form of structured documents, at that time i started using obsidian for my personal notes and i developed a system to host them as a website, that was perfect for the purpose and i created a vault and start to write down common bash loops or oneliners.

With time passing by i started to document my homelab adventures and pages started to look more and more like blog posts and so i decided to take a step forward and use it like an excuse to learn some new technology, i started to look into [hugo](https://gohugo.io/), since i was familiar with go projects and markdown formatting and to avoid complex rewriting of my obsidian vault

## The migration process

So i started to watch at my already existing notes and reason about how to migrate from obsidian to this format, i first create an archetype for common blog properties:

```yaml
title: '{{ replace .File.ContentBaseName `_` ` ` | title }}'
date: '{{ time.Now | time.Format "2006-01-02" }}'
draft: true
description:
tags:
```

Then i started to look for a template to avoid customizing manually CSS files and organize the look of the website from scratch, after some time i found [this theme](https://jpanther.github.io/congo/) that was complete, simple and customizable, perfect for blog posts but allow also to directly manage CSS properties and custom layouts for non posts pages

### Converting old notes

One of the main problems with handling the migration was retrieving metadata for the old notes like creation date, luckily the repo was git managed and i could ask to git to get metadata for me 😉

```bash
# looping trough old notes
for file in **/*.md; do

  # getting first commit date for the given file
  d="$(git log --follow --format=%ad --date=iso  $file | tail -1 | awk '{print $1}')";

  # changing date property accordingly
  sed -i "s/date:.*/date: $d/g" "$HOME/projects/hugo_test/content/blog/$(basename $file)";
done
```

### Migrate my portfolio

Then after some time i decided to make this my personal website and migrate here my portfolio that at the time was an [angular](https://angular.dev) application a little too over engineered for a simple static webpage.

The angular components where acting as a view for data written in a SON file and applying some custom CSS to improve visual effect,JSON was used to decouple data from view logic to prevent situations like this where i want to recreate the view but keep the data as they where before

### Automate!!!!

The last thing to do was to automate deployment on Github pages with a simple [action](https://github.com/carnivuth/carnivuth/blob/main/.github/workflows/deploy.yml) to build the website and make deployment operations

## Conclusions

I'm still experimenting with this blog as a way to relax and review my tech projects and reason about the technical decisions, the site has evolved from the idea of a place to write down oneliners and day by day things into a digital history log of my technical skills and opinions
