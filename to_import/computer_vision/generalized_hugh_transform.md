---
title: GENERALIZED_HUGH_TRANSFORM
aliases: []
tags:
  - ght process
  - sift descriptor
  - object detection
book_order: 44
draft: true
show_toc: true
show_title: true
show_right_column: true
show_image: true
---

# Generalized hough transform

The Generalized Hough transform (**GHT**) is a generalization aimed to apply **[GHT](pages/computer_vision/object_detection/hough_transform.md)** to non analytical shapes.

```mermaid
flowchart LR
subgraph online phase
f[detect edges in the target image]
g[compute gradient direction]
h[quantize the gradient to index the R table]
i[compute the position of the reference point]
j[ cast a vote in the accumulator array]

f --> g --> h --> i --> j --repeat for all r vectors\n in the indexed row--> i
j --repeat for all edges--> g
end

subgraph offline phase

a[detect edeges in the model image]
b[choose a reference point e.g. the baricentre of the shape]
c[compute vector R for each edge point]
d[compute gradient direction]
e[store R in a table indexed by the quantized gradient direction]

a --> b --> c --> d --> e --repeat for all edges--> c
end
```

![](assets/computer_vision/Pasted_image_20240427172424.png)

## Ght with local invariant features

The most popular computer vision pipeline relies on combining GHT with local invariant features such as the [sift descriptor](pages/computer_vision/local_features/sift_descriptor.md). In this pipeline Local invariant features are used instead of edges.

### Ght: offline phase

Detect keypoints (e.g. [DOG](pages/computer_vision/local_features/dog_detector.md)) and compute descriptors (e.g. [SIFT](pages/computer_vision/local_features/sift_descriptor.md)) in the model image:

$$
F = \{F_1,F_2,...,F_n\}
$$
$$
F_i = (P_i,D_i,\phi_i,S_i)
$$

Choose a reference point (eg the [barycentre](pages/computer_vision/image_segmentation_blob_analysis/blob_analysis.md#barycentre))

$$
P_C = \frac{1}{N}\sum_{i=1}^{N}P_i
$$
Compute the joining vectors between the features and the reference point:

$$
\forall F_i \in F \rightarrow V_i= P_C -P_i
$$

The Star Model consist of the features and their joining vectors (*no need of the R Table*):

$$
F_i = (P_i,D_i,\phi_i,S_i,V_i)
$$

### Ght: online phase

Detect [keypoints](pages/computer_vision/local_features/finding_correspondences.md#keypoints) on the target image and compute descriptors :

$$
\overset{\sim}F = \{\overset{\sim}F_1,\overset{\sim}F_2,...,\overset{\sim}F_n\}
$$
$$
\overset{\sim}F_i = (\overset{\sim}P_i,\overset{\sim}D_i,\overset{\sim}\phi_i,\overset{\sim}S_i)
$$

Match descriptor between target and model image

$$
\forall \overset{\sim}F_i \in \overset{\sim}F \rightarrow \overset{\sim}D_j = D_j
$$

for each keypoint on the target image that matches his descriptor with a keypoint in the model image compute the reference point and cast a vote in the accumulator array

$$
\overset{\sim}P_{C_j} = \overset{\sim}P_j + \overset{\sim}V_j
$$
$$
A[\overset{\sim}P_{C_j} ] ++
$$

## 2D accumulator array issues

A 2D accumulator array is not sufficient to account for rotation and scale, the solution is to use a 4D accumulator array in order to account for scale and rotation

![](assets/computer_vision/Pasted_image_20240428143913.png)

[<](pages/computer_vision/object_detection/hough_transform.md)[>](pages/computer_vision/object_detection/object_detection_pipeline.md)
