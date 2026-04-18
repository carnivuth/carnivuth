---
id: DECISION TREE PRUNING
aliases: []
tags:
  - classification
book_order: 11
book: datamining
title: decision tree pruning
date: "2023-12-30"
draft: true
image: ""
show_image: true
show_right_column: true
show_title: true
show_toc: true
---

# DECISION TREE PRUNING

In order to avoid over fitting  pruning can be done

## C4.5 STRATEGY

based on the error, it prunes the leaves if the maximum error of the root of a subtree is lower than the weighted sum of the errors of the leaves

$$eroot <= ei$$

where:

$$
ei = \sum_{leaf}{e}
$$
## BEFORE PRUNING

![](Pasted_image_20231230175754.png)

## AFTER PRUNING

![](Pasted_image_20231230175803.png)


[PREVIOUS](DECISION_TREES.md) [NEXT](REGRESSION.md)
