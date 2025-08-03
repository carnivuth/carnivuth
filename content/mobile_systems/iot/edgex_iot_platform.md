---
title: EDGEX_IOT_PLATFORM
series: ["Mobile systems"]
draft: true
next: "pages/mobile_systems/iot/iot_devices.md"
previous: "pages/mobile_systems/iot/siemens_mindsphere.md"
aliases: []
tags: []
series_order: 51
---

# Edgex foundry

Infrastructure to manage communication with different IoT devices that abstracts from the protocol details and offers a northbound API for application and CLOUD infrastructure

![](assets/mobile_systems/Pasted%20image%2020240613162524.png)

EDGEX is a microservice architecture, The principal components are:

- **core-data** manages dataflow from the IoT devices
- **core-metadata** manages information on monitored devices, how to communicate with them and what data and command can be pulled/send to IoT devices
- **core-command** exec command on the nodes
- **device services** bottom elements of the infrastructure, they pull data from specific protocols and transform them in events that can be managed by the core-data component
- **registry service** service to monitor the status and perform healthchecks of the other edegex microservices (*e.g. [consul](https://www.consul.io/)* )

[<](pages/mobile_systems/iot/siemens_mindsphere.md)[>](pages/mobile_systems/iot/iot_devices.md)
