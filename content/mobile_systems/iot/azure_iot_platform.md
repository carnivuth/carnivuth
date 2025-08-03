---
title: AZURE_IOT_PLATFORM
draft: true
next: "pages/mobile_systems/iot/siemens_mindsphere.md"
previous: "pages/mobile_systems/iot/aws_iot_platform.md"
aliases: []
tags: []
index: 49
---

# Azure iot platform

Microsoft cloud solution for IoT application, the main component is the azure IoT hub that communicates with the IoT devices and redirect the dataflow to the cloud components

![](assets/mobile_systems/Pasted%20image%2020240613162421.png)

## Azure iot edge

azure IoT offers also the possibility to perform edge computing tasks thanks to the edge runtime, the edge device can run azure modules, that are the smallest computational entities of an azure IoT solution (*e.g. docker compatible containers*)

```mermaid
flowchart LR
subgraph Azure_IoT_Edge_device
direction TB
A[azure module]
B[azure module]
C[azure module]
D[azure IoT edge runtime]
end
E[(IoT hub)]
D --> E
A & B & C --> D
```

[<](pages/mobile_systems/iot/aws_iot_platform.md)[>](pages/mobile_systems/iot/siemens_mindsphere.md)
