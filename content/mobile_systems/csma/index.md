---
title: CSMA
layout: simple
series: ["Mobile systems"]
draft: true
next: "pages/mobile_systems/wireless/wifi.md"
previous: "pages/mobile_systems/wireless/medium_access_control.md"
aliases: []
tags: []
series_order: 3
---

# Csma/cd

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

This are particular problems that can manifest in a wireless environment

![](assets/mobile_systems/Pasted%20image%2020240604181911.png)![](Pasted%20image%2020240604181924.png)

### Csma/ca variant

A way to limit the hidden/expose node issue is to send short acknowledgement frames before transmit:

```mermaid
flowchart TD
A[A]
B[B]
A --sends rts--> B
B --sends cts--> A
```

so the node **A** sends a request to send packet to **B** and wait for a clear to send reply before start transmitting the data

this solution limits collisions only to the **rts** and **cts** packets reducing the cost of re transmission but increase the overhead because every communication requires an rtc/cts exchange


## Token ring

[<](pages/mobile_systems/wireless/medium_access_control.md)[>](pages/mobile_systems/wireless/wifi.md)
