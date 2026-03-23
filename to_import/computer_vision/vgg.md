---
title: VGG
aliases: []
tags: []
book_order: 52
draft: true
show_toc: true
show_title: true
show_right_column: true
show_image: true
---

# Vgg

[CNN](pages/computer_vision/machine_learning_cv/convolutional_neural_networks.md) that won the second place of [ILSVRC 2014](https://www.image-net.org/challenges/LSVRC/2014/), it explores the benefits of deep and regular architectures based on a few simple design choices:

- $3\times 3$ conv layers with $S=1, P=1$

- $2\times 2$ max-pooling, $S=2, P=0$

- channels (*and filters*) double after every pool

The architecture is designed as a **repetition of stages** where a single stage is a chain of layers that process activations at the **same spatial resolution** (*conv-conv-pool, conv-conv-conv-pool and conv-conv-conv-conv-pool*).

A stage has the same receptive field as a single larger convolution but, given the same number of input/output channels, introduces more non-linearities and requires less parameters and less computation. A stage requires more memory to store the activations, though.

## Training phase

| HYPERPARAMETER                                      | VALUE                                                                                                                                                                                                                                                                                                                     |
| --------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Optimizer,Learning rate,weight decay, normalization | same as [ALEXNET](pages/computer_vision/machine_learning_cv/alexnet.md) but with $B=128$                                                                                                                                                                                                                                                                            |
| Epochs                                              | $74$                                                                                                                                                                                                                                                                                                                      |
| Data Augmentation                                   | Same as [ALEXNET](pages/computer_vision/machine_learning_cv/alexnet.md) plus Scale Jittering (randomly rescale the input image to $S\times S$, with $S$ in $[256, 512]$                                                                                                                                                                                             |
| Initialization                                      | Deep nets are hard to train with randomly initialized weights due to instability of gradients. They train a VGG-11 with Weights $~N(0,0.01), Biases=0$. Then train VGG-16 and VGG-19 by initializing the first 4 conv layers and the last 3 FC layers with the pre-trained weights of the corresponding layers of VGG-11. |

[<](pages/computer_vision/machine_learning_cv/alexnet.md)[>](pages/computer_vision/machine_learning_cv/resnet.md)
