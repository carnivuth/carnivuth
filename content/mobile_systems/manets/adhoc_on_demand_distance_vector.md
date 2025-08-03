---
title: ADHOC_ON_DEMAND_DISTANCE_VECTOR
draft: true
aliases: []
tags: []
index: 13
next: pages/mobile_systems/manets/greedy_perimeter_stateless_routing.md
previous: pages/mobile_systems/manets/dinamic_source_routing.md
---

# Ad hoc on demand distance vector

AODV tries to address the problem of the variable sized header of [DSR](pages/mobile_systems/manets/dynamic_source_routing.md) by maintain a reduced routing table suitable for manets

## Limit the routing problems of manets

In order to avoid limit the header lenght problem, 2 routing tables are used:

- **inverse path routing table** that is used to route the route reply packets, the records on this table are removed after a timeout

| SOURCE | DESTINATION | DISTANCE FROM THE SOURCE |
| ------ | ----------- | ------------------------ |
| S      | D           | 1                        |

- **direct path routing table** that is used to route the actual traffic to the destination this table does the heavy lifting

|     | DESTINATION | NEXT HOP | DISTANCE FROM THE DESTINATION |
| --- | ----------- | -------- | ----------------------------- |
| S   | D           | F        | 3                             |

```mermaid
flowchart TD
a[the source sends a packet \n with source and destination in flooding mode]
b[nodes that recive the packets \n start the creation of a routing table of the inverse paths]
c[the destination recives the packet \n and send a route reply packet to the source \n the unicast transmision does not contain the full path \n but exploits the routing tables]
d[nodes that recive the packets \n start the creation of a routing table of the direct paths]
a --> b
b --> b
b --> c
c --> d
```

## Route error

In the route error scenario the node that detects the route error situation informs the other nodes like in [DSR](pages/mobile_systems/manets/dynamic_source_routing.md) and they update their routing table, the message is broadcast to the neighbors route error to inform them

## Link failure detection

Extension that force all nodes to send hello messages to the neighbors in order to discover broken routing table lines

## Avoid the flooding propagation

In order to avoid the excessive flooding if an intermediate node has already the route information can respond with  a route reply, this generate some loop problems

### Using dsn to avoid loops

So in order to avoid loops, an integer value is introduced (DSN) that is incremented with each propagation of a route request packet, if the

[>](pages/mobile_systems/manets/greedy_perimeter_stateless_routing.md)
