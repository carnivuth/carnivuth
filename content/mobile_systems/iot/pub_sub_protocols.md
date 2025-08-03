---
id: PUB_SUB_PROTOCOLS
next: "pages/mobile_systems/iot/request_response.md"
previous: "pages/mobile_systems/iot/pub_sub_model.md"
aliases: []
tags: []
index: 55
---

# Pub/sub protocols
## Message queue telemetry transport (mqtt)

protocol that implements the [pub/sub model](pages/mobile_systems/iot/pub_sub_model.md) that relies on TCP to handle connections, that supports different delivery semantics for messages:

- at least ones
- at most ones
- at most ones

clients can also setup wills that are messages that are delivered to nodes when the node is disconnected

## Advanced message queuing protocol (amqp)

protocol based on the [pub/sub model](pages/mobile_systems/iot/pub_sub_model.md), richer semantics than MQTT but also heavier

## Data distribution service (dds)

brokerless solution based on multicast communication that is designed for mission critical environments where performance and reliability are essentials

![](assets/mobile_systems/Pasted%20image%2020240615103454.png)

[<](pages/mobile_systems/iot/pub_sub_model.md)[>](pages/mobile_systems/iot/request_response.md)
