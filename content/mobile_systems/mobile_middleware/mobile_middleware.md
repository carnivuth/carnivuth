---
title: MOBILE_MIDDLEWARE
series: ["Mobile systems"]
draft: true
next: "pages/mobile_systems/mobile_middleware/mobile_middleware_principles.md"
previous: "pages/mobile_systems/mobility/i_tcp.md"
aliases: []
tags: []
index: 32
---

# Mobile middleware

Mobile Middleware general definition:

*support software stack, typically cross-layer and application-agnostic, which targets issues and challenges at OSI levels >= 4*

## Why a middleware for mobile applications

Many of the problems that a mobile application need to resolve are always the same and are related to the **network not always available and no guaranteed performance**.

Given that, is not feasible for a business to address those problems each time there is the need to develop for mobile environments (**e.g. follow the DRY principle**)

A Middleware can also address different environment and hardware infrastructures and offer an homogeneous interface.

## Mobile vs fixed middleware

A mobile middleware **has lot of differences to address due to the different deployment environment**

- Context dynamically changes
- Need of decoupling in space and in time
- Asynchronous events, spaces for data sharing
- provisioning of some level/degree of visibility of running conditions to lower layers
- partial visibility of location change
- modifications in the QoS levels currently available

[<](pages/mobile_systems/mobility/i_tcp.md)[>](pages/mobile_systems/mobile_middleware/mobile_middleware_principles.md)
