---
date: 2024-09-21
series: ["Linguaggi e modelli computazionali"]
draft: false
title: Grammatiche regolari (tipo 3)
description: Grammatiche semplici e meno espressive ma sempre deterministiche
aliases: []
tags: []
series_order: 7
---

{{< mathjax >}}
Grammatiche le cui  produzioni ammettono un solo simbolo non terminale nel membro di destra.


| LINEARI A DESTRA             | LINEARI A SINISTRA          |
| ---------------------------- | --------------------------- |
| $$A \rightarrow \sigma  $$   | $$A \rightarrow \sigma  $$  |
| $$A \rightarrow \sigma B  $$ | $$A \rightarrow B\sigma  $$ |


I linguaggi generati dalle grammatiche regolari coincidono con quelli descritti da [espressioni_regolari](/linguaggi_modelli_computazionali/espressioni_regolari)

```mermaid
flowchart LR
A[GRAMMATICHE REGOLARI]
B[ESPRESSIONI REGOLARI]
A --> B
B --> A
```

A ogni grammatica regolare corrisponde un automa in grado di riconoscerla
