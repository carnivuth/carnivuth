---
date: 2024-09-21
series: ["Linguaggi e modelli computazionali"]
draft: true
id: GRAMMATICHE REGOLARI
next: "pages/linguaggi_modelli_computazionali/espressioni_regolari.md"
previous: "pages/linguaggi_modelli_computazionali/grammatiche_tipo_2.md"
aliases: []
tags: []
series_order: 7
---
# Grammatiche regolari (tipo 3)

Grammatiche le cui  produzioni ammettono un solo simbolo non terminale nel membro di destra.

| LINEARI A DESTRA             | LINEARI A SINISTRA          |
| ---------------------------- | --------------------------- |
| $$A \rightarrow \sigma  $$   | $$A \rightarrow \sigma  $$  |
| $$A \rightarrow \sigma B  $$ | $$A \rightarrow B\sigma  $$ |

 I linguaggi generati dalle grammatiche regolari coincidono con quelli descritti da [espressioni_regolari](pages/linguaggi_modelli_computazionali/espressioni_regolari.md)

```mermaid
flowchart LR
A[GRAMMATICHE REGOLARI]
B[ESPRESSIONI REGOLARI]
A --> B
B --> A
```

a ogni grammatica regolare corrisponde un automa in grado di riconoscerla

[<](pages/linguaggi_modelli_computazionali/grammatiche_tipo_2.md)[>](pages/linguaggi_modelli_computazionali/espressioni_regolari.md)
