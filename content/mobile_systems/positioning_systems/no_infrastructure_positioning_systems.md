---
id: NO_INFRASTRUCTURE_POSITIONING_SYSTEMS
aliases: []
tags: []
index: 21
next: pages/mobile_systems/positioning_systems/active_bat.md
previous: pages/mobile_systems/positioning_systems/global_positioning_system.md
---

# No infrastructure positioning systems

There are also solutions to compute position of an object without dedicated hardware

## Gsm based positioning systems

There are possible techniques of positioning based on the GSM infrastructure:

- **Enhanced observed time difference**  exploits the number of base stations in visibility (*3 minimum*)
- **Timing advance** this technique exploits handover

## Bluetooth based positioning systems

One possible solution is to exploits the limited range of Bluetooth devices and is low costs to implement a [proximity](pages/mobile_systems/positioning_systems/base_techniques.md#proximity) based positioning system.

One possible solution is to place Bluetooth devices at the point of interests (PoI) and devices can compute their position by connecting to a BT POI and computing the RSSI

![](assets/mobile_systems/Pasted%20image%2020240609154600.png)

This method allow different levels of privacy for the device that can scan in silent mode the PoI

[<](pages/mobile_systems/positioning_systems/global_positioning_system.md)[>](pages/mobile_systems/positioning_systems/active_bat.md)
