---
title: DOG_DETECTOR
aliases: []
tags: []
book_order: 36
draft: true
show_toc: true
show_title: true
show_right_column: true
show_image: true
---
# Dog detector

This detector relies on difference of Gaussian (DOG) in order to find keypoints

$$
DoG(x,y,\sigma) = (G(x,y,k\sigma) - G(x,y,\sigma))\ast I(x,y) = L(x,y,k\sigma) -L(x,y,\sigma)
$$

This approach is more computational efficient of computing [LOG](pages/computer_vision/local_features/scale_normalized_log.md), and it's a good approximation of the results

![](assets/computer_vision/Pasted_image_20240314102352.png)

## Dog computing

Computation of dog is done by down-sampling and [gaussian smoothing](pages/computer_vision/image_filtering/gaussian_filter.md) the input image in order to obtain the scale space and then by computing differences between adjacent scale levels

![](assets/computer_vision/Pasted_image_20240314103452.png)

The next scale level is computed by taking half of the columns and rows and computing the same filter (performance optimization)

a point is detected as a feature if it's DoG is an extreme of its 26 neighbors

![](assets/computer_vision/Pasted_image_20240314103712.png)

## Dog improvements with filters

In order to localize keypoints in an accurate way and remove unstable point [filter procedures](pages/computer_vision/image_filtering/image_filters.md) are needed

[<](pages/computer_vision/local_features/scale_normalized_log.md)[>](pages/computer_vision/local_features/canonical_orientation.md)
