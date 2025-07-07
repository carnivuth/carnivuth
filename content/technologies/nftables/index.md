---
title: Nftables
date: '2025-07-07'
draft: false
description: "manage firwall rules"
tags:
  - networking
series: ["Technologies notes"]
series_order:
---

[Nftables](https://wiki.nftables.org) is the framework for the packet filtering inside the linux kernel.

## Tables

Tables are the top-level object inside the nft domain model, they belong to a specific family that defines what typologies of packets are targeted from the rules inside the table (for example `ip` family targets `ipv4` packets)

To list all tables run:

```bash
nft list ruleset
```

To add a new table run:

```bash
nft add table [family] [name]
```

## Chains

Chains are containers for rules, they are defined by a name, a type and a hook. A type describe witch operation on packet can be performed by the rule of a specific chain, possible values are:

- filter
- route
- nat

The hook describe at which point of the packet processing pipeline the rule is applied, possible values are:

- ingress
- prerouting
- input
- forward
- output
- postrouting

Each table family and each chain type implements a specific set of hooks, see [this](https://wiki.nftables.org/wiki-nftables/index.php/Netfilter_hooks#Netfilter_hooks_into_Linux_networking_packet_flows) for reference

## Rules

Rules are the effective operation done on packets based on filter and parameters, for a list of filters see [this](https://wiki.nftables.org/wiki-nftables/index.php/Quick_reference-nftables_in_10_minutes)


### mark packets for routing policy with different ip route tables

In order to route packets based on a specific mark configure ip as follows

- Edit `/etc/iproute2/rt_tables` and add the new table with the number between 100-200 (*best practice*)

```bash
ehco '[NUMBER] [NAME]'>> /etc/iproute2/rt_tables
```

- Add a rule to forward the marked packet to the correct table

```bash
ip rule add fwmark [MARK NUMBER] table [NAME]
```

- Then create a nft table to contain the rule chain and rules

```bash
nft add table [FAMILY] [NAME]
nft 'add chain [FAMILY] [TABLE] [CHAIN NAME] {type filter hook prerouting priority 0;} '
```
> [!NOTE]
> In this case the type `filter` is used because the interested packets comes from another host and are not originated from this local machine, otherwise the type `route` is preferable

- add the rules for the ip marking

```bash
nft add rule [TABLE NAME] [CHAIN NAME] ip saddr 169.254.254.2/32 tcp dport 123 mark set 230
```
> [!NOTE]
> In this case the filter targets `ntp` packets from `169.254.254.2`
