---
id: MOBILE_MIDDLEWARE_PRINCIPLES
draft: true
next: "pages/mobile_systems/mobile_middleware/patterns.md"
previous: "pages/mobile_systems/mobile_middleware/mobile_middleware.md"
aliases: []
tags: []
index: 33
---

# Mobile middleware principles

Mobile middleware follow different sets of principles that comes with the multiple environments where a mobile nodes needs to operate
## Internet principles
### End-to-end principle

The opportunity to maintain state and intelligence only on network borders (edges). Today in real scenarios this principle is violated frequently: firewalls, Network Address Traversal,caches for Web content.

### Robustness principle

*Be conservative in what you do, be liberal in what you accept from others*

When developing internet capable applications, respect RFC's standards but be able to process information that does not respect them.

## Web principles

Web principles follow the guidelines of the ones at the basis of the
underlying TCP/IP stack
### Simplicity, modularity, decentralization, and robustness

In particular processes that access, manipulate or represent data should follow this principles
### State management

Usage of the many techniques developed in web scenarios to manage the state storage and representation and the stateful interactions (*e.g. REST interfaces*)

## Soa principles

### Service oriented architecture (soa)

Develop software architectures structured around business process where the components are minimal and loosely coupled in order to be interchangeable and exploits:

 - Re-usability
 - granularity
 - modularity
 - possibility of dynamic composition
 - component-based organization
 - interoperability

## Cross layering principle

Handle request for the high level components to interact with lower parts of the stack in different ways

### Upward info flow

with info propagated from lower to higher layers, in opposite to classical principles for layered architectures
### Downward info flow

with info propagated from higher to lower layers, typically to configure lower-layer parameters and settings

### Back-and-forth info flow

with info propagated in both directions

### Merging of adjacent layers

allows the combination of different adjacent layers into a single super-layer
### Coupling

with no addition of new interfaces. Two or more layers are coupled at design time in a finalized way, with no possibility of maintaining independency/abstraction from lower layer
### Vertical calibration

Usually to achieve layers-joint optimization of the configuration of parameters (*joint tuning*) and to obtain better overall performance

![](assets/mobile_systems/Pasted%20image%2020240611101358.png)

[<](pages/mobile_systems/mobile_middleware/mobile_middleware.md)[>](pages/mobile_systems/mobile_middleware/patterns.md)
