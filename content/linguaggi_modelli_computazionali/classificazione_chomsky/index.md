---
date: 2024-03-10
draft: true
id: CLASSIFICAZIONE DELLE GRAMMATICHE (DI CHOMSKY)
next: "pages/linguaggi_modelli_computazionali/grammatiche_tipo_0.md"
previous: "pages/linguaggi_modelli_computazionali/linguaggi_grammatiche.md"
aliases: []
tags: []
index: 3
---
# Classificazione di chomsky

 la classificazione delle grammatiche di Chomsky prevede 4 tipologie principali di grammatiche, divise in base alla capacita computazionale richiesta per riconoscerle

| GRAMMATICHE                       | AUTOMI RICONOSCITORI                                          |
| --------------------------------- | ------------------------------------------------------------- |
| [TIPO 0](pages/linguaggi_modelli_computazionali/grammatiche_tipo_0.md)   | Se $L(G)$ e riconoscibile e necessaria una macchina di turing |
| [TIPO 1](pages/linguaggi_modelli_computazionali/grammatiche_tipo_1.md)   | Macchina di turing                                            |
| [TIPO 2](pages/linguaggi_modelli_computazionali/grammatiche_tipo_2.md)   | Push down automaton (PDA)                                     |
| [TIPO 3](pages/linguaggi_modelli_computazionali/grammatiche_regolari.md) | Automa a stati finiti (ASF)                                   |

esiste una relazione gerarchica fra le grammatiche, **un linguaggio generato da una grammatica di tipo inferiore può essere generato anche da una grammatica di tipo superiore**

## Problema della stringa vuota

i linguaggi generati da [GRAMMATICHE DI TIPO 1](pages/linguaggi_modelli_computazionali/grammatiche_tipo_1.md) non ammettono produzioni con la stringa vuota ma quelle di tipo 2 e 3 si data la relazione gerarchica grammatiche di tipo $A$ possono generare linguaggi di tipo $B$ con $A\gt B$ **ma la grammatica di tipo $A$ ha necessità computazionali più esose**

## Grammatiche, tipo 1 vs tipo 2

le grammatiche di tipo 2 non ammettono produzioni della forma

$$BC \rightarrow CB$$

ovvero **non consentono di scambiare i simboli in una produzione**

## Grammatiche, tipo 2 vs tipo 3

le produzioni di Tipo 2 **ammettono un metasimbolo in qualunque punto della frase** (*self embedding*) mentre le produzioni di tipo 3 **ammettono metasimboli solo a destra o a sinistra della frase**

| TIPO 2  | TIPO 3 |
| ------- | ------ |
| $$aBa$$ | $$Ba$$ |

## Nella pratica

Le grammatiche 1 2 e 3 sono tutte riconoscibili, ma la capacita computazionale richiesta per riconoscerle cambia assieme alle capacita espressive della grammatica stessa, sta al progettista scegliere la corretta grammatica in base ai requisiti (*i linguaggi general purpose sono generati da grammatiche di tipo 2, riconosciute da un push down automaton*)

[<](pages/linguaggi_modelli_computazionali/linguaggi_grammatiche.md)[>](pages/linguaggi_modelli_computazionali/grammatiche_tipo_0.md)
