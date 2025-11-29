---
title: IOT_DEVICES
layout: simple
date: 2024-06-13
series: ["Mobile systems"]
draft: true
next: "pages/mobile_systems/iot/iot_protocols.md"
previous: "pages/mobile_systems/iot/edgex_iot_platform.md"
aliases: []
tags: []
series_order: 52
---

# Iot devices

IoT devices can be classified in different categories given the following characteristics

- energy consumption
- networking capabilities

## Network classification

| CATEGORY | CARACTERISTICS                                                                                  |
| -------- | ----------------------------------------------------------------------------------------------- |
| C0       | devices with no independent network capabilities, a gateway is needed to enable communicaitions |
| C1       | devices with some communication capabilities but they don't implement the full ip/tcp stack     |
| C2       | devices with full ip/tcp capabilities, they may benefit from the use of simple protocols        |

## Energy classification

| CATEGORY | CARACTERISTICS             |
| -------- | -------------------------- |
| E0       | event energy limitation    |
| E1       | period energy limitation   |
| E2       | lifetime energy limitation |
| E9       | no energy limitation       |

[<](pages/mobile_systems/iot/edgex_iot_platform.md)[>](pages/mobile_systems/iot/iot_protocols.md)
