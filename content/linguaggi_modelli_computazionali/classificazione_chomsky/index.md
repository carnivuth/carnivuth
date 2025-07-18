---
date: 2024-03-10
series: ["Linguaggi e modelli computazionali"]
draft: false
title: Classificazione di chomsky
description: Tassonomia delle grammatiche
next: "pages/linguaggi_modelli_computazionali/grammatiche_tipo_0.md"
aliases: []
tags: []
series_order: 3
---

{{< mathjax >}}
La classificazione delle grammatiche di Chomsky prevede 4 tipologie principali di grammatiche, divise in base alla capacita computazionale richiesta per riconoscerle

| GRAMMATICHE                       | AUTOMI RICONOSCITORI                                          |
| --------------------------------- | ------------------------------------------------------------- |
| [TIPO 0](/linguaggi_modelli_computazionali/grammatiche_tipo_0)   | Se $L(G)$ e riconoscibile e necessaria una macchina di turing |
| [TIPO 1](/linguaggi_modelli_computazionali/grammatiche_tipo_1)   | Macchina di turing                                            |
| [TIPO 2](/linguaggi_modelli_computazionali/grammatiche_tipo_2)   | Push down automaton (PDA)                                     |
| [TIPO 3](/linguaggi_modelli_computazionali/grammatiche_regolari) | Automa a stati finiti (ASF)                                   |

Esiste una relazione gerarchica fra le grammatiche, **un linguaggio generato da una grammatica di tipo inferiore può essere generato anche da una grammatica di tipo superiore**

## Problema della stringa vuota

I linguaggi generati da [grammatiche di tipo 1](/linguaggi_modelli_computazionali/grammatiche_tipo_1) non ammettono produzioni con la stringa vuota ma quelle di tipo 2 e 3 si data la relazione gerarchica grammatiche di tipo $A$ possono generare linguaggi di tipo $B$ con $A\gt B$ **ma la grammatica di tipo $A$ ha necessità computazionali più esose**

## Grammatiche, tipo 1 vs tipo 2

Le grammatiche di tipo 2 non ammettono produzioni della forma

$$BC \rightarrow CB$$

Ovvero **non consentono di scambiare i simboli in una produzione**

## Grammatiche, tipo 2 vs tipo 3

Le produzioni di Tipo 2 **ammettono un metasimbolo in qualunque punto della frase** (*self embedding*) mentre le produzioni di tipo 3 **ammettono metasimboli solo a destra o a sinistra della frase**

| TIPO 2  | TIPO 3 |
| ------- | ------ |
| $$aBa$$ | $$Ba$$ |


## Nella pratica

Le grammatiche 1 2 e 3 sono tutte riconoscibili, ma la capacita computazionale richiesta per riconoscerle cambia assieme alle capacita espressive della grammatica stessa, sta al progettista scegliere la corretta grammatica in base ai requisiti (*i linguaggi general purpose sono generati da grammatiche di tipo 2, riconosciute da un push down automaton*)
