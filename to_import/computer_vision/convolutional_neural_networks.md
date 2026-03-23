---
id: CONVOLUTIONAL_NEURAL_NETWORKS
aliases: []
tags: []
book_order: 49
draft: true
---

# Convolutional neural networks (cnn)

## Limits of fully connected layers

Let's assume that the feature detection layer need to compute some kind of local features (e.g. edges or keypoints) so the dimension of the $W$ array becomes:

$$
size(W_l)= (3\times M \times N) \times (M \times N)
$$

so the network's layer dimensions increase exponentially with the image dimensions and becomes computationally impossible

## Convolution to the rescue

Similarly to what is done in [classical computer vision](pages/computer_vision/image_filtering/image_filters.md), where convolution is used to detect features in deep learning convolution can be used in layers to detect features with filters that are learned [minimizing a loss function](pages/computer_vision/machine_learning_cv/creating_a_classifier.md#minimizing_the_loss_function)

## Convolutional layers

So to achieve this in a convolutional layer input and output are not flatten and each output is connected only to a local set of the input that shares the weights thus reducing the weights array dimension of the layer

$$
y(i,j) = w_1x(i-1,j-1) +w_2x(i-1,j) +w_3x(i-1,j+1)+
$$
$$
w_4x(i,j-1) +w_5x(i,j) +w_6x(i,j+1)+
$$
$$
w_7x(i+1,j-1) +w_8x(i+1,j) +w_9x(i+1,j+1) \Rightarrow
$$
$$
y(i,j) = \sum_{m=-1}^{m=1}\sum_{l=-1}^{l=1} {w(m,l)x(i+m,j+l)}
$$

![](assets/computer_vision/Pasted_image_20240504170704.png)

### Color image as inputs

color images are represented as 3 channels input so convolution kernel must be 3-dimensional tensors

$$
[K\times I](i,j) = \sum_{n=1}^{3}\sum_{m}\sum_{l}K_n(m,l)I_n(i+m,j+l)+ b
$$

### Output activation

By sliding the kernel over the image, input channel are translated in a single channel output i.e. the output activation of the convolutional layer, they are also called feature maps because layers tend to specialize in detecting specific features/patterns

### Multiple channel output activation

It can be useful to retrieve multiple channel output for detecting multiple features (e.g. Horizontal and vertical edges)

$$
[K^2\times I](i,j) = \sum_{n=1}^{3}\sum_{m}\sum_{l}K^2_n(m,l)I_n(i+m,j+l)+ b^2
$$

### General structure

This approach can be generalized, obtaining the **general structure of a convolutional layer**:

$$
[K^k\times I](i,j) = \sum_{n=1}^{C_{in}}\sum_{m}\sum_{l}K^k_n(m,l)I_n(i+m,j+l)+ b^k\space with \space k=1..C_{out}
$$
![](assets/computer_vision/Pasted_image_20240504173105.png)

### Chaining convolutional layers

Convolutional layers are a form of linear transformation (they can be expressed by matrix) so in order to take advantage of network depth there is the need to chain them with some form of non-linearity (e.g. [relu](pages/computer_vision/machine_learning_cv/deep_learning_and_neural_networks.md#activation%20function))

![](assets/computer_vision/Pasted_image_20240504173234.png)

The main advantage of chaining is that with each level of depth the number of input pixels that the layer takes into account (e.g. the **receptive field**) gets larger and larger enabling the network to detect larger patterns

![](assets/computer_vision/Pasted_image_20240504175829.png)

### Strided convolution

Convolution can be computed every $S$ (stride) positions in both directions

![](assets/computer_vision/Pasted_image_20240504180313.png )
## Pooling layers

Pooling layers are layers with handcrafted functions that aggregates the input neighboring values in order to downsample the output

![](assets/computer_vision/Pasted_image_20240504180153.png)

The pooling layer introduces some more hyperparameters such as dimensions of the kernel and stride

## Cnn final structure

![](assets/computer_vision/Pasted_image_20240504180437.png)

Example of cnn's can be [LENET](pages/computer_vision/machine_learning_cv/lenet.md) and [ALEXNET](pages/computer_vision/machine_learning_cv/alexnet.md)

## Number of learnable parameters

For a single convolutional layer the number of learnable parameter depends on kernel dimensions and input and output activation dimensions so the size of the $W$ array can be obtained as:

$$
C_{out} \times (C_{in} \times H_k \times W_k +1)
$$

## The problem with increasing depth

Intuitively increasing depth should take better results at the price of computation cost but as shown by [VGG](pages/computer_vision/machine_learning_cv/vgg.md) in real testing this is not the case

![](assets/computer_vision/Pasted_image_20240504181754.png)

### Residual learning as a solution

The idea is to add skip connection in order to fast forward the input to the deep nested layers

```mermaid
flowchart LR
A(input)
B[Conv]
C[BN]
D[ReLU]
E[Conv]
F[BN]
G((+))
H[ReLU]
A --> B --> C --> D --> E --> F --> G --> H
A --> G
```

So the output is given by:

$$
H(x) = F(x)+x
$$

An example of this can be found in [RESNET](pages/computer_vision/machine_learning_cv/resnet.md)

### Global average pooling

In order to reduce the number of parameter at the begin of the [FC layers](pages/computer_vision/machine_learning_cv/deep_learning_and_neural_networks.md#fully%20connected%20layers) the output can be processed by average pooling

![](assets/computer_vision/Pasted%20image%2020241001145533.png)

### Grouped convolutions

In order to improve the computational costs kernels are split into $G$ groups and each group process $\frac{C_{in}}{G}$ input channels, with this required flops and number of parameters are scaled by a $G$ factor

![](assets/computer_vision/Pasted_image_20240505120419.png)

## Depthwise separable convolutions

In order to improve the computational cost of convolution depthwise variant splits the spatial analysis and the feature combination and perform them sequentially.


```mermaid
flowchart TD
A[C X C X 3 X 3 Gconv + BN <br> G=C]
B[ReLU]
C[C X C X 1 X 1 + BN]
D[ReLU]
A --> B --> C --> D
START:::hidden --> A
D --> END:::hidden
classDef hidden display: none;
```

The first convolution step is realized as a [GROUPED CONVOLUTIONS](#Grouped%20convolutions)

## Transfer learning

To prevent overfitting, training of a deep neural network requires too big datasets that in a lot of deployment scenarios are expensive.

So in order to train big CNN a 2 steps approach is adopted:

- **pre-train** the deep network with a large, general purpose dataset
- **fine-tune** specific parts of the network with the smaller specific one dataset

[<](pages/computer_vision/machine_learning_cv/deep_learning_and_neural_networks.md)[>](pages/computer_vision/machine_learning_cv/lenet.md)
