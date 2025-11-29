---
title: Wifi
layout: simple
date: 2024-06-04
series: ["Mobile systems"]
draft: false
aliases: []
tags: []
series_order: 2
---

The IEEE 802.11 standard is the most widespread solution for wireless communications, it implements both the [base station mode](/mobile_systems/wireless_communication#base-station-mode) architecture and the [ad hoc mode](/mobile_systems/wireless_communication#ad-hoc-mode) architecture

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

## Wifi mesh network

The objective is to cover with wireless connectivity technology wide areas like cities with a mesh network

![](mesh_network.png)
