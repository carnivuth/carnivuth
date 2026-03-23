---
id: SCALE_NORMALIZED_LOG
aliases: []
tags: []
book_order: 35
draft: true
---

# Scale normalized log

One of the proposals for the research of features in a [Gaussian scale space](pages/computer_vision/local_features/scale_invariance.md#scale%20space) it's to find extremes of the $2^{nd}$ derivative of the normalized Gaussian function

$$
F(x,y,\sigma) = \sigma^2\nabla^2L(x,y,\sigma) = \sigma^2(\nabla^2G(x,y,\sigma)\ast I(x,y))
$$

![](assets/computer_vision/Pasted_image_20240314101650.png)

[>](pages/computer_vision/local_features/dog_detector.md)
