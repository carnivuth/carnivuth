---
id: MORAVEC_CORNER_DETECTOR
aliases: []
tags: []
book_order: 31
draft: true
---

# Moravec corner detector

In this detector the measure of cornerness is given by

$$
C(p) = \min_{q \in n_8(p)}{\Vert N(p)-N(q)\Vert^2}
$$

Where $N$ is the neighborhood around the point and its neighbors

The output is the lowest difference computed between the neighborhood of $p$ and the neighborhoods of the neighbor points $q$

![](assets/computer_vision/Pasted_image_20240310153802.png)

[<](pages/computer_vision/local_features/zero_crossing_edge_detection.md)[>](pages/computer_vision/local_features/harris_corner_detector.md)
