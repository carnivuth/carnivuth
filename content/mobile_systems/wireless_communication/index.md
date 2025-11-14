---
title: Wireless communications for mobile devices
layout: simple
description: wireless problems to manage in mobile environments
date: 2024-06-04
series: ["Mobile systems"]
draft: false
aliases: []
tags: []
series_order: 1
---

To understand better the problem that mobile device's software have to face we need to analyze the physical medium that allows this devices to communicate, the wireless medium.

## Wireless medium

The physical layer over wireless medium has a lot of problems due to the signal nature:

- **shadowing**
- **frequency-selective fading**
- **Rayleigh fading**

Signal can also bounce over reflective surfaces generating reflections

![](signal_bounce.png)

There are also meteorological conditions that can influence the signal strength.

In real scenarios with mobile nodes, mathematical models cannot be used to estimates the power loss due to the nature of the environment been to variable.

In general it can be said that power fluctuations depends on the distance from the transmitter.

> [!IMPORTANT]
> **layer 2 protocols need to take into account this physical layer problems**

## Medium access control

IEEE defines a section of standards for wireless connectivity technologies at data link layer under the section 802.xx

```mermaid
flowchart TD
subgraph higher_layer
A[802.2]
B[802.3]
C[802.5]
D[802.11]
end
subgraph medium_access_control
E[CSMA/CD]
F[Token-passing]
G[CSMA]
end
higher_layer ~~~ medium_access_control
```

## Wirelles medium access control protocols

To manage the medium access control there are different protocols in the litterature

### Csma/cd

The **CSMA/CD** relies on sensing the channel and transmit only when the channel il free

```mermaid
flowchart TD
A{channel is\n free}
B[send message]
C{collision\n detected}
D[wait a random time]
A-->|yes|B
B-->C
C-->|yes|D
A-->|no|D
D-->A
```

In wireless environment this approach have some issues due to the nature of the nodes not being able to listen the entire channel and the node mobility

### Hidden and exposed node issues

This are particular problems that can manifest in a wireless environment where the communication is obstructed from the presence of one or more nodes in the range of the transmitter and receiver

![](hidden_node.png) ![](exposed_node.png)

### Csma/ca variant

A way to limit the hidden/expose node issue is to send short acknowledgment frames before transmit:

```mermaid
flowchart TD
A[A]
B[B]
A --sends rts--> B
B --sends cts--> A
```

So the node **A** sends a request to send packet to **B** and wait for a clear to send reply before start transmitting the data

This solution limits collisions only to the **rts** and **cts** packets reducing the cost of re transmission but increase the overhead because every communication requires an rtc/cts exchange

## Wireless architectures

There are two possible configuration for a wireless infrastructure:

### Base station mode

The nodes are connected to a base station and communication can only append trough the base station itself

```mermaid
flowchart LR
subgraph net1
A[ap1]
C[node1]
end
subgraph net2
B[ap2]
D[node2]
end
C --> A
D --> B
E((internet))
A & B -->  E
```

### Ad hoc mode

All nodes are potentially mobile and communicate directly

```mermaid
flowchart LR
subgraph net
A[node1]
B[node2]
C[node3]
D[node4]
E[node5]
A  <--> B & C
B  <--> D
C  <--> D
D  <--> E
E  <--> B
end
```
