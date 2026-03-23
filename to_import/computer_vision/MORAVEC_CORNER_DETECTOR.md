---
title: MORAVEC_CORNER_DETECTOR
aliases: []
tags: []
book_order: 31
draft: true
show_image: true
show_right_column: true
show_title: true
show_toc: true
categories:
  - computer vision
book: computer vision
---

# MORAVEC CORNER DETECTOR

In this detector the measure of cornerness is given by

$$
C(p) = \min_{q \in n_8(p)}{\Vert N(p)-N(q)\Vert^2}
$$

Where $N$ is the neighborhood around the point and its neighbors

The output is the lowest difference computed between the neighborhood of $p$ and the neighborhoods of the neighbor points $q$

![](Pasted_image_20240310153802.png)

