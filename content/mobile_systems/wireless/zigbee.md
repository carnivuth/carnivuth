---
id: ZIGBEE
aliases: []
tags: []
index: 8
next: pages/mobile_systems/manets/manets.md
previous: pages/mobile_systems/wireless/bluetooth.md
---

# Zigbee (ieee 802.15.4)

Protocol optimized for some vertical domains IOT oriented where [bluetooth](pages/mobile_systems/wireless/bluetooth.md) fails like

- industrial application
- home automation and home appliances controls
- environmental monitoring

The protocol has several improvements over [bluetooth](pages/mobile_systems/wireless/bluetooth.md) as:

- higher node limits (up to 65536 nodes)
- support for full mesh networking
- better support for real time appliances

## Topologies

![](assets/mobile_systems/Pasted%20image%2020240321144834.png)

## Nodes roles

In a [zigbee](pages/mobile_systems/wireless/zigbee.md) network a node can play different roles:

- **PAN COORDINATOR** main network controller
- **Full function device** participates to packets routing
- **Reduced function device** device with limited capabilities

## Channel management

The zigbee protocol offers to possible solution for physical channel management

- [CSMA/CA](pages/mobile_systems/wireless/csma.md#csma/ca%20variant)
- Beacon enabled network where the **PAN COORDINATOR** sends periodic messages, this solution is similar to what [BLUETOOTH](pages/mobile_systems/wireless/bluetooth.md) does, is better suited for sensors communication

[<](pages/mobile_systems/wireless/bluetooth.md)[>](pages/mobile_systems/manets/manets.md)
