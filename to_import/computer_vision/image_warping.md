---
title: IMAGE_WARPING
aliases: []
tags: []
book_order: 14
draft: true
show_toc: true
show_title: true
show_right_column: true
show_image: true
---

# Image warping

The image points are converted by a pair of functions $f_{u}(u,v),f_{v}(u,v)$ into a new image

![](assets/computer_vision/Pasted_image_20240227160817.png)

$$
\begin{cases}
u^{'} = f_{u}(u,v) \\
v^{'} = f_{v}(u,v)
\end{cases}
$$

It's also possible to invert warping

$$
\begin{cases}
u = g_{u}(u^{'},v^{'}) \\
v = g_{v}(u^{'},v^{'})
\end{cases} \space \forall \space (u^{'},v^{'}): I^{'}(u^{'},v^{'}) = I(g_{u}(u^{'},v^{'}),g_{v}(u^{'},v^{'}))
$$

## Warping to compensate lens distortion

once the lens distortion parameter are computed by [camera calibration](pages/computer_vision/image_formation_acquisition/camera_calibration.md) it's possible to get back the un-distorted points by a backward warp

![](assets/computer_vision/Pasted_image_20240227164313.png)

[<](pages/computer_vision/image_formation_acquisition/stereo_camera_calibration.md)[>](pages/computer_vision/image_filtering/image_filters.md)
