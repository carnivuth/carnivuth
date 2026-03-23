---
id: BINARY_MORPHOLOGY
aliases: []
tags: []
book_order: 24
draft: true
---

# Binary morphology

The binary morphology operators take as input a [binarized](pages/computer_vision/image_segmentation_blob_analysis/binarization.md) image and make improvement before the labeling phase

The idea is to slide a small kernel called structuring element

## Dilation

The output image is obtained by sliding the kernel on each black element

![](assets/computer_vision/Pasted_image_20240303171944.png)
## Erosion

The output image is obtained by sliding the kernel on the all image leaving only the black points that contain the kernel

![](assets/computer_vision/Pasted_image_20240303172045.png)

## Opening and closing

Erosion followed by dilation is called opening

$$
A \circ B = (A \ominus B) \oplus B
$$
Dilation followed by erosion is called closing

$$
A \bullet B = (A \oplus B) \ominus B
$$

[<](pages/computer_vision/image_segmentation_blob_analysis/color_based_segmentation.md)[>](pages/computer_vision/image_segmentation_blob_analysis/components_labeling.md)
