---
title: COMMUNICATION_PATTERNS
series: ["Mobile systems"]
draft: true
next: "pages/mobile_systems/android/android_platform.md"
previous: "pages/mobile_systems/mobile_middleware/resource_management_patterns.md"
aliases: []
tags: []
series_order: 37
---

# Communication patterns

Patterns that handle communication between nodes in a mobile environment
## Client initiated connection for push model

Pattern that resolves the problem of reaching the client from the server for server -> client push interactions. the client starts a connection to the server that updates the client status (*e.g. AJAX interaction*)

![](assets/mobile_systems/Pasted%20image%2020240608151433.png)

## Connection factory

Pattern that decouple connection management and application business code by hiding connection details behind a factory component (*used by java mobile edition M.E.*)

## Multiplexed connection

Pattern to allow multiple logic connections to travel on a single level 4 physical connection in order to improve performance instead of creating multiple channels (*e.g. SCTP stream control transfer protocol for multimedia streaming*)

[<](pages/mobile_systems/mobile_middleware/resource_management_patterns.md)[>](pages/mobile_systems/android/android_platform.md)
