---
title: ALEXNET
aliases: []
tags: []
book_order: 51
draft: true
show_toc: true
show_title: true
show_right_column: true
show_image: true
---

# Alexnet

[CNN](pages/computer_vision/machine_learning_cv/convolutional_neural_networks.md) that won the [ILSVRC](https://www.image-net.org/challenges/LSVRC/2012/)2012, powerfull network trained on 2 gpus

![](assets/computer_vision/Pasted%20image%2020241001102840.png)

## Stride parameter

first conv layer has a [stride](pages/computer_vision/machine_learning_cv/convolutional_neural_networks.md#strided%20convolution) of 4 to reduce the spatial dimension of input e reduce the computational costs, other layers as a stride of 1

## [POOLING LAYERS](pages/computer_vision/machine_learning_cv/convolutional_neural_networks.md#pooling%20layers)

the first 2 layers of the network are intervaled from a max pooling layer

## Implementation of non linearity

All layers (*Conv and FC*) deploy [ReLU](pages/computer_vision/machine_learning_cv/deep_learning_and_neural_networks.md#activation%20function), non-linearities which yield faster training compared to saturating non-linearities

## [FULLY CONNECTED LAYERS](pages/computer_vision/machine_learning_cv/deep_learning_and_neural_networks.md#fully%20connected%20layers) SETUP

Last FC layer has 1000 units (as many as the [ILSVRC](https://www.image-net.org/challenges/LSVRC/2012/) classes), the penultimate FC layer is the feature/representation layer and has a cardinality of $4096$.

## Characteristics

**Local Response Normalization** (*after conv1 and conv2*): **activations are normalized** by the sum of those at the same spatial position in a few ($n=5$) adjacent channels (mimics lateral inhibition in real neurons).


in the FC6 FC7 layers **Dropout** is performed which means that  at training time the output of each unit is set to zero with probability 0.5. This forces units to learn more
robust features since none of them can rely on the presence of particular other ones.

## Training phase

Training was performed using random-cropping of $224\times 224$ patches (*and their* *horizontal reflections*) from the $256\times 256$ RGB input images and colour jittering (*massive [data augmentation](pages/computer_vision/machine_learning_cv/machine_learning_in_computer_vision.md#data%20augmentation)*).

At test time, averaging predictions (*i.e. softmax*) across 10 patches (*central + 4 corner alongside their horizontal reflections*).

| HYPERPARAMETER        | VALUE                                                                           |
| --------------------- | ------------------------------------------------------------------------------- |
| Optimizer             | SGD with $B=128$                                                                |
| Epochs                | $90$                                                                            |
| Learning Rate         | $0.01$, divided 3 times by 10 when the validation error stopped to improve      |
| Weight Decay          | $0.0005$                                                                        |
| Momentum              | $0.9$                                                                           |
| Data Augmentation     | Colour Jittering, Random Crop,Horizontal Flip                                   |
| InitializationWeights | $~N(0,0.01)$, Biases: 1 (*conv2,conv4,conv5, fc6,fc7,fc8*) or 0 (*conv1,conv3*) |
| Normalization         | Centering (Subtraction of the Mean RGB colour in the training set)              |

[<](pages/computer_vision/machine_learning_cv/lenet.md)[>](pages/computer_vision/machine_learning_cv/vgg.md)
