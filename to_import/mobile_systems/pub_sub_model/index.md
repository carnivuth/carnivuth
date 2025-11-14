---
title: PUB_SUB_MODEL
layout: simple
date: 2024-06-15
series: ["Mobile systems"]
draft: true
next: "pages/mobile_systems/iot/pub_sub_protocols.md"
previous: "pages/mobile_systems/iot/iot_protocols.md"
aliases: []
tags: []
series_order: 54
---

# Pub/sub model

model where  nodes plays the role  of publishers and subscribers, publisher send messages and subscribers subscribe to topics and receive messages based on the subscribed topics

```mermaid
flowchart TD
A((broker))
B[publisher]
C[subscriber]
D[subscriber]
B --publish X on topic --> A
C & D --subscribes on topics--> A
A --recive X--> C & D
```

PUB/SUB has the following properties

- **space decoupling** No need for the nodes to know each other
- **time decoupling** no need for the nodes to be connected at the same time
- **synchronization decoupling**  no need for the nodes to halt the operation flow to receive communications

[<](pages/mobile_systems/iot/iot_protocols.md)[>](pages/mobile_systems/iot/pub_sub_protocols.md)
