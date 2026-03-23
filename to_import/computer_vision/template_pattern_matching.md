---
title: TEMPLATE_PATTERN_MATCHING
aliases: []
tags: []
book_order: 41
draft: true
show_toc: true
show_title: true
show_right_column: true
show_image: true
---

# Template pattern matching

The model image is slid across the target image till a dissimilarity or similarity function is minimized/maximized

![](assets/computer_vision/Pasted_image_20240423114915.png)

## Similarity and dissimilarity functions

### Sum of square differences

Sum of square differences can be deployed as dissimilarity function

$$
SSD(i,j) = \sum_{m=0}^{M-1}{\sum_{m=0}^{M-1}(I(i+m,j+n)-T(m,n))^2}
$$

### Sum of absolute differences

$$
SAD(i,j) = \sum_{m=0}^{M-1}{\sum_{m=0}^{M-1}\vert I(i+m,j+n)-T(m,n)\vert^2}
$$
### Normalized cross correlation

This measure is invariant to intensity light changes

$$
NCC(i,j) = \frac{\sum_{m=0}^{M-1}{\sum_{m=0}^{M-1} I(i+m,j+n)\ast T(m,n)}}{
\sqrt{\sum_{m=0}^{M-1}{\sum_{m=0}^{M-1} I(i+m,j+n)^2}}
\ast
\sqrt{\sum_{m=0}^{M-1}{\sum_{m=0}^{M-1} T(m,n)^2}}
} \Rightarrow
$$
$$
NCC(i,j) = \frac{\overset{\sim}I(i,j)\ast T}{\Vert \overset{\sim}I(i,j)\Vert \ast \Vert T\Vert} \Rightarrow
$$
$$
NCC(i,j) = \frac{\Vert \overset{\sim}I(i,j)\Vert \ast \Vert T\Vert cos(\theta)}{\Vert \overset{\sim}I(i,j)\Vert \ast \Vert T\Vert} =
$$
$$
cos(\theta)
$$

The NCC represents the cosine between the vectors $\Vert \overset{\sim}I(i,j)\Vert$ and $\Vert T \Vert$ (*max when the vectors are aligned*)

### Zero mean normalized cross correlation

This is a variant of the [NCC](#Normalized_cross_correlation) that takes in to account the mean value of the intensity

$$
NCC(i,j) = \frac{\sum_{m=0}^{M-1}{\sum_{m=0}^{M-1} (I(i+m,j+n)-\mu(\overset \sim I))\ast (T(m,n)- \mu(T))}}{
\sqrt{\sum_{m=0}^{M-1}{\sum_{m=0}^{M-1} (I(i+m,j+n)- \mu(\overset \sim I))^2}}
\ast
\sqrt{\sum_{m=0}^{M-1}{\sum_{m=0}^{M-1} (I(m,n)- \mu(T))^2}}
}
$$

## Sad vs sdd vs ncc vs zncc

[ZNCC](#Zero%20mean%20normalized%20cross%20correlation) and [NCC](#Normalized%20cross%20correlation) are more robust to intensity changes

![](assets/computer_vision/Pasted_image_20240423153625.png)

## Performance

Template matching computation is too much slow for an industrial environment, in order to speed up computation an image pyramid is deployed

In order for this approximation to work levels need to be chosen empirically

[<](pages/computer_vision/object_detection/instance_level_object_detection.md)[>](pages/computer_vision/object_detection/shape_based_matching.md)
