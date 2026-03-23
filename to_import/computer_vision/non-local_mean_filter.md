---
title: NON-LOCAL_MEAN_FILTER
aliases: []
tags: []
book_order: 20
draft: true
show_toc: true
show_title: true
show_right_column: true
show_image: true
---

# Non-local mean filter

Non linear filter which exploits similarities between different patches of the image

![](assets/computer_vision/Pasted_image_20240302112646.png)

$$
O(p) = \sum_{p\in S}w(p,q)I_{q} \space where
$$
$$
w(p,q) = \frac{1}{Z(p)}e^{-\frac{\Vert N_p -N_q\Vert_2^2}{h^2}}
$$
$$
Z(p)= \sum_{q \in I} e^{\frac{\Vert N_p -N_q\Vert_2^2}{h^2}}
$$
![](assets/computer_vision/Pasted_image_20240302112706.png)

[<](pages/computer_vision/image_filtering/bilateral_filter.md)[>](pages/computer_vision/image_segmentation_blob_analysis/computer_vision_industrial_workflow.md)
