---
title: LENET
aliases: []
tags: []
book_order: 50
draft: true
show_image: true
show_right_column: true
show_title: true
show_toc: true
categories:
  - computer vision
book: computer vision
date: "2024-10-01"
---

# LENET-5

[CNN](CONVOLUTIONAL_NEURAL_NETWORKS.md) to recongnize handwritten digits.

![](Pasted-image-20241001101124.png)

Principal features are:

- $5\times 5$ kernels
- decrease of spatial dimension and an increase of layers dimension alongside the layers
- no padding, [average pooling](CONVOLUTIONAL_NEURAL_NETWORKS.md#POOLING%20LAYERS)
- 2 [fully connected layers](DEEP_LEARNING_AND_NEURAL_NETWORKS.md#FULLY%20CONNECTED%20LAYERS) where each unit compute the distance between the input and the parameter vector

