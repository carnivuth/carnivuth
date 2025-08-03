---
id: SOCKETS
next: "pages/mobile_systems/iot/iot.md"
previous: "pages/mobile_systems/android/alarms.md"
aliases: []
tags: []
index: 44
---

# Sockets and networking in android

the java solution for sockets are available in android (*e.g. `Socket` `ServerSocket`*), they require a [multi-thread solution](pages/mobile_systems/android/asynchronous_techniques.md), and explicit permission in the manifest file

## Managing network state

There are also components to interact with the network state

- **ConnectivityManager** Answers queries about state of network connectivity and Notifies applications when network connectivity changes
- **NetworkInfo** Describes status of a network interface of a given type (*e.g. Mobile or WiFi* )

## Communication libraries

There are also libraries that handles the networking requests and the threading issues related like [volley](https://google.github.io/volley/) and [okhttp](https://square.github.io/okhttp/)

## Network card management

The network card can operate at different energy limited levels:

- **high power** max data transfer rate maximum energy consumption
- **low power** network card at the 50% of the power
- **idle** no connection available minimum energy consumption

## Best practice: bundle data transfers

In order to be energy efficient a best practice is to bundle the data transfers to limit the amount of time the network card is active

![](assets/mobile_systems/Pasted%20image%2020240618124220.png)

[<](pages/mobile_systems/android/alarms.md)[>](pages/mobile_systems/iot/iot.md)
