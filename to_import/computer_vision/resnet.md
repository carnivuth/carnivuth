---
title: RESNET
aliases: []
tags: []
book_order: 53
draft: true
show_toc: true
show_title: true
show_right_column: true
show_image: true
---

# Resnet

[CNN](pages/computer_vision/machine_learning_cv/convolutional_neural_networks.md) Inspired by [VGG](pages/computer_vision/machine_learning_cv/vgg.md) based on the concept of [residual blocks](pages/computer_vision/machine_learning_cv/convolutional_neural_networks.md#residual%20learning%20as%20a%20solution), each stage of a resnet consists in a combination of residual blocks

![](assets/computer_vision/Pasted%20image%2020241001122748.png)

## Residual block structure

each residual block (*RB*) contains 2 stages of $3 \times 3$ convolution and [ReLU](pages/computer_vision/machine_learning_cv/deep_learning_and_neural_networks.md#activation%20function) non-linearity, the input of a RB block is summed to the output

The first RB in most stages halves the spatial resolution (*$S=2$ conv + $2\times 2$ max
pool*) and doubles the number of channels.

## Summing input and output

Input layer and output of a RB block are tensors of different shapes and cannot be added together

![](assets/computer_vision/Pasted%20image%2020241001123433.png)

In order to address this situation a stage is added in the shortcut branch to increase the number of layers of the input

```mermaid
flowchart TD
START:::hidden --> A
A[1 x 1 convolution with S=2 and 2C]
B[BN]
C((+))
A --> B --> C
classDef hidden display: none;
```

## Increasing depth with bottleneck residual blocks

In order to increase even further the depth of a [CNN](pages/computer_vision/machine_learning_cv/convolutional_neural_networks.md) without increasing the computational cost bottleneck residual blocks are used which uses a pair of convolutional block to compress and decompress layers, this can cause information loss cause convolution and parameter learning are carried out in a compressed domain:

```mermaid
flowchart TD
A[4C X H X W]
B[\C X 4C X 1 X 1 conv + BN/]
C[ReLU]
D[3 X 3 conv + BN]
E[ReLU]
F[/4C X C X 1 X 1 conv + BN\]
G((+))
H[ReLU]
A --> B --> C --> D --> E --> F --> G --> H
A --> G
START:::hidden --> A
H --> END:::hidden
classDef hidden display: none;
```

### Avoid the information loss

in order to overcome the limitation of [bottleneck residual blocks](#Increasing%20depth%20with%20bottleneck%20residual%20blocks) mobilenet-v2 improved the model by using inverted blocks

```mermaid
flowchart TD
A[Cin X H X W]
B[/tCin X Cin X 1 X 1 conv + BN\]
C[ReLU]
D[tCin X Cin X 3 X 3 tCin conv + BN]
E[ReLU]
F[\Cout X tCin X 4C X 1 X 1 conv + BN/]
G((+))
A --> B --> C --> D --> E --> F --> G
A --> G
START:::hidden --> A
G --> END:::hidden
classDef hidden display: none;
```

To improve performance the convolution step is performed as a [depthwise convolutions](pages/computer_vision/machine_learning_cv/convolutional_neural_networks.md#depthwise%20separable%20convolutions), another improvement (*proved by experimental evidence*) is the absence of non linear blocks between residual blocks
## Resnet training

In the training phase dropouts is not deployed because the use of batch normalization acts as regularizer

| HYPERPARAMETER                   | VALUE                                                   |
| -------------------------------- | ------------------------------------------------------- |
| Traiming Iterations              | $60 \times 104$                                         |
| Optimizer                        | SGD with $B=256$                                        |
| Learning Rate                    | $0.1$, divided by 10 when the validation error plateaus |
| Weight Decay                     | $0.0001$                                                |
| Momentum                         | $0.9$                                                   |
| Data Augmentation, Normalization | Same as [VGG](pages/computer_vision/machine_learning_cv//vgg.md)                                   |
| Initialization                   | He initilization                                        |

[<](pages/computer_vision/machine_learning_cv/vgg.md)
