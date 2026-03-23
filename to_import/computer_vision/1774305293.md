---
title: IMAGE_FORMATION_FLOW
aliases: []
tags: []
draft: true
show_image: true
show_right_column: true
show_title: true
show_toc: true
categories:
  - computer vision
book: computer vision
date: "2024-02-22"
---

# IMAGE FORMATION FLOW

```mermaid
flowchart TD
A["`trasformation of point
from WRF to CRF
according to the extrinsic
parameters`"]
B["`canonical perspective
projection`"]
C["`non linear mapping
for lens distortion effect `"]
D["`trasformation according
to the intrinsic
parameters
of the camera`"]
A --> B
B --> C
C --> D

 [NEXT](pages/image_formation_acquisition/PERSPECTIVE_PROJECTION.md)
