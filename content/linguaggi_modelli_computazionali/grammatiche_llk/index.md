---
date: 2024-10-15
series: ["Linguaggi e modelli computazionali"]
draft: true
id: GRAMMATICHE_LLK
next: "pages/linguaggi_modelli_computazionali/interpreti.md"
previous: "pages/linguaggi_modelli_computazionali/pda.md"
aliases:
  - starter_symbol_set
  - director_symbol_set
tags: []
index: 12
---

# Grammatiche $ll(k)$

Le grammatiche $LL(k)$ sono grammatiche che risultano deterministiche al patto di poter *"sbirciare"* $k$ simboli di input, caso eccellente quello in cui $k=1$

## Starter symbols set

Lo starter symbols set di una riscrittura $\alpha$ e l'insieme:

$$
SS(\alpha) = \{a \in VT | \alpha \rightarrow a\beta \}, con \space \alpha \in V^+, \beta \in V^*
$$

ovvero l'insieme di simboli terminali iniziali delle produzioni che coinvolgono il metasimbolo $\alpha$ sulla sinistra

## Come ottenere una grammatica $ll(1)$

Condizione **necessaria** (sufficiente per le grammatiche senza $\epsilon -rules$) per far si che una grammatica sia $LL(1)$ e che gli **starter symbols** (*ovvero gli elementi iniziali della parte destra di una produzione*) **di un metasimbolo siano tutti diversi fra loro**

## Il problema delle $\epsilon$

Le grammatiche che presentano produzioni in grado di annullare un metasimbolo non sono considerate dalla definizione di [starter symbols set](pages/linguaggi_modelli_computazionali/grammatiche_llk.md#STARTER%20SYMBOLS%20SET), dato che in caso di produzione vuota e necessario considerare il metasimbolo successivo per verificare il determinismo della produzione

$$
S \rightarrow AB|c
$$
$$
A \rightarrow a|\epsilon
$$
$$
B \rightarrow b|dc
$$

in questa grammatica lo [starter symbols set](pages/linguaggi_modelli_computazionali/grammatiche_llk.md#STARTER%20SYMBOLS%20SET) di $S$ e dipendente anche dal metasimbolo $B$ perché e necessario considerare che il metasimbolo $A$ può essere eliminato

## Director symbols set

Per ovviare a questo problema si estende la nozione di [starter symbols set](pages/linguaggi_modelli_computazionali/grammatiche_llk.md#STARTER%20SYMBOLS%20SET), dato l'insieme $SS(\alpha)$ e l'insieme $FOLLOW(A)$ definito:

$$
FOLLOW(A) = \{a \in VT | S \rightarrow \gamma Aa\beta\}, con \space \gamma,\beta \in V^*
$$
ovvero l'insieme dei simboli terminali che compaiono come primi in caso di annullamento delle produzioni precedenti

il director symbol set e dato da

$$
DS(A\rightarrow \alpha) = trunc_1(FIRST(\alpha)\bullet FOLLOW(A))
$$

ovvero la troncatura a un carattere della concatenazione dei due insiemi.

## Come ottenere una grammatica $ll(1)$

Condizione necessaria e sufficiente per ottenere una grammatica $LL(1)$ e che il [director symbols set](pages/linguaggi_modelli_computazionali/grammatiche_llk.md#DIRECTOR%20SYMBOLS%20SET) relativi alle produzioni siano disgiunti

## Grammatiche $ll(1)$ il problema della [il problema della ricorsione sinistra](pages/linguaggi_modelli_computazionali/grammatiche_tipo_2.md#il%20problema%20della%20ricorsione%20sinistra)

Le grammatiche $LL(k)$ non sono compatibili con la ricorsione a sinistra delle produzioni $A \rightarrow A\alpha | a$, che tuttavia [può essere sempre rimossa](pages/linguaggi_modelli_computazionali/grammatiche_tipo_2.md#eliminazione%20della%20ricorsione%20sinistra) a patto di poter fare a meno della sua capacita espressiva (*no necessita di dare una semantica alla frase*)

questa problematica può essere risolta adottando tecniche di analisi più avanzate come le [grammatiche LR(k)](pages/linguaggi_modelli_computazionali/grammatiche_lrk.md)

[<](pages/linguaggi_modelli_computazionali/pda.md)[>](pages/linguaggi_modelli_computazionali/interpreti.md)
