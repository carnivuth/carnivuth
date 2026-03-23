---
title: PERSPECTIVE_PROJECTION
aliases: []
tags: []
book_order: 1
draft: true
show_toc: true
show_title: true
show_right_column: true
show_image: true
---

# Perspective projection

The model that rules the conversion from a 3D scene  to an image is called perspective projection, it's based on the [pinhole camera model](https://en.wikipedia.org/wiki/Pinhole_camera_model) and it goes like follow:

![](assets/computer_vision/Pasted_image_20231005122554.png)

from this model are derived the equation to map a 3D point to a 2D coordinate are as follow

$$
u=\frac{f}{z}*x
$$
$$
v=\frac{f}{z}*y
$$

It's important to notice that this equations are **inversely proportional** in respect to the depth of the point in the 3D world

## Information loss

This set of equation is not bidirectional as we are representing a 3D world with a 2D image, so the information loss is inevitable, in the process the following informations are lost:

- ratios of lenghts (*unless they are paralel to the image plane*)
- parallelism between line (*unless they are paralel to the image plane*)
- depth of a point

In order to recover the depth information [stereo image acquisition](pages/computer_vision/image_formation_acquisition/stereo_image_acquisition.md) can be used

## Vanishing points

The vanishing point of a 3D line is the image of the point at infinity of the line (i.e. the image
of the point on the line which is infinitely distant from the optical center).

![](assets/computer_vision/Pasted_image_20240221202839.png)

with such definition all 3D lines in the image will **share the same vanishing point**

in a real case application this model alone it's not sufficient, there are [real camera parameters](pages/computer_vision/image_formation_acquisition/camera_parameters.md) and  [lens effects](pages/computer_vision/image_formation_acquisition/lens.md) to take into account. In order to apply some computation to an image [digitization](pages/computer_vision/image_formation_acquisition/image_digitization.md) is also needed.

[>](pages/computer_vision/image_formation_acquisition/camera_parameters.md)
