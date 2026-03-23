---
title: NON-LOCAL_MEAN_FILTER
aliases: []
tags: []
book_order: 20
draft: true
show_image: true
show_right_column: true
show_title: true
show_toc: true
categories:
  - computer vision
book: computer vision
---

# NON-LOCAL MEAN FILTER

Non linear filter which exploits similarities between different patches of the image

![](Pasted_image_20240302112646.png)

$$
O(p) = \sum_{p\in S}w(p,q)I_{q} \space where
$$
$$
w(p,q) = \frac{1}{Z(p)}e^{-\frac{\Vert N_p -N_q\Vert_2^2}{h^2}}
$$
$$
Z(p)= \sum_{q \in I} e^{\frac{\Vert N_p -N_q\Vert_2^2}{h^2}}
$$
![](Pasted_image_20240302112706.png)

