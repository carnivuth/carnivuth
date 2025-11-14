---
title: PATTERNS
layout: simple
date: 2024-06-11
series: ["Mobile systems"]
draft: true
aliases: []
tags: []
series_order: 34
next: pages/mobile_systems/mobile_middleware/distribution_patterns.md
previous: pages/mobile_systems/mobile_middleware/mobile_middleware_principles.md
---

# Patterns

Mobile environment can exploit several patterns for different tasks typologies

## Architectural patterns

inherited from non mobile environments, patterns for application's architectures that describes how component should interact

### Level-based

Multi-layer sw architecture with different responsibilities “rigidly” allocated to different layers

### Client-server

Most frequent pattern in distributed computing: clients use resources and services offered by server

### Peer-to-peer

Any node can dynamically play the role of either client or server; functionality could be more or less symmetric

### Pipeline

Pipeline as chain of processing elements aligned in such a way that output of one is offered as input for the successive one in the chain

### Multi-tier

Client-server architecture where applications are run by a multiplicity of different software agents

### Blackboard

A common knowledge base (blackboard) is updated iteratively by different knowledge sources, starting from including problem specification and then evolving to solution results

### Publish/subscribe

Different nodes publish data to a broker that can be received from different nodes acting as subscribers

Other types of patterns specific for mobile nodes are

- [COMMUNICATION_PATTERNS](pages/mobile_systems/mobile_middleware/communication_patterns.md)
- [RESOURCE_MANAGEMENT_PATTERNS](pages/mobile_systems/mobile_middleware/resource_management_patterns.md)
- [DISTRIBUTION_PATTERNS](pages/mobile_systems/mobile_middleware/distribution_patterns.md)

[<](pages/mobile_systems/mobile_middleware/mobile_middleware_principles.md)[>](pages/mobile_systems/mobile_middleware/distribution_patterns.md)
