---
title: '{{ replace .File.ContentBaseName "-|_" " " | title }}'
slug: '{{ .File.ContentBaseName  }}.md'
date: '{{ time.Now | time.Format "2006-01-02" }}'
draft: true
description:
tags: []
categories: []
references: []
---
