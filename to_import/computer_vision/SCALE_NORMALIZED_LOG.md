---
title: SCALE_NORMALIZED_LOG
aliases: []
tags: []
book_order: 35
draft: true
show_image: true
show_right_column: true
show_title: true
show_toc: true
categories:
  - computer vision
book: computer vision
date: "2024-04-04"
---

# SCALE NORMALIZED LOG

One of the proposals for the research of features in a [Gaussian scale space](SCALE_INVARIANCE.md#SCALE%20SPACE) it's to find extremes of the $2^{nd}$ derivative of the normalized Gaussian function

$$
F(x,y,\sigma) = \sigma^2\nabla^2L(x,y,\sigma) = \sigma^2(\nabla^2G(x,y,\sigma)\ast I(x,y))
$$

![](Pasted_image_20240314101650.png)

