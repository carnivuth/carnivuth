---
title: GLOBAL_POSITIONING_SYSTEM
layout: simple
date: 2024-06-08
series: ["Mobile systems"]
draft: true
aliases: []
tags: []
series_order: 20
next: pages/mobile_systems/positioning_systems/no_infrastructure_positioning_systems.md
previous: pages/mobile_systems/positioning_systems/manet_positioning_systems.md
---

# Global positioning system (gps)

GPS is a positioning system that exploits dedicated hardware (*e.g. satellites*) for improved performance in localization capabilities

The concept is to use [lateration](pages/mobile_systems/positioning_systems/base_techniques.md#lateration) in combination with [toa](pages/mobile_systems/positioning_systems/base_techniques.md) using satellites with known positions

![](assets/mobile_systems/Pasted%20image%2020240608190728.png)

GPS satellites needs to have a perfect synchronized clock, $1_{\mu s}$ can achive an error of around 300 meters

## Differential gps

to reduce the error range of GPS a base station with a fixed position is used to correct the error in the satellites measures

[<](pages/mobile_systems/positioning_systems/manet_positioning_systems.md)[>](pages/mobile_systems/positioning_systems/no_infrastructure_positioning_systems.md)
