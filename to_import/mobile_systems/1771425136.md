---
title: GREEDY_PERIMETER_STATELESS_ROUTING
layout: simple
date: 2024-06-07
series: ["Mobile systems"]
draft: true
next: "pages/mobile_systems/manets/temporary_ordered_routing_algorithm.md"
previous: "pages/mobile_systems/manets/adhoc_on_demand_distance_vector.md"
aliases: []
tags: []
series_order: 14
---

# Greedy perimeter stateless routing

**GPSR** is a geographic routing protocol based on 2 big assumptions

- each nodes knows is location and the destination location
- each nodes maintains a list of the neighbors and they're positions

**This are two big assumption that are not always guaranteed**

## Data transmission modes

there are 2 possible modes for data transmission in **GPSR**

- **greedy** the packet is forwarded to the neighbor that is closest to the destination

 - **perimeter face forwarding** each nodes computes the relative neighborhood graph and when greedy fails the first node in the graph is traversed and then greedy is tried again

[<](pages/mobile_systems/manets/adhoc_on_demand_distance_vector.md)[>](pages/mobile_systems/manets/temporary_ordered_routing_algorithm.md)
