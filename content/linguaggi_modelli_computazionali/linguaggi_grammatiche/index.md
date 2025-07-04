---
date: 2024-09-21
series: ["Linguaggi e modelli computazionali"]
draft: false
title: Linguaggi e grammatiche
description: Definizioni generali nel campo dei linguaggi
aliases: []
tags: ["chiusura di un alfabeto","grammatiche formali","linguaggio"]
series_order: 2
---

{{< mathjax >}}
Per poter ottenere una [macchina di Turing universale](https://it.wikipedia.org/wiki/Macchina_di_Turing_universale) e necessario dare definizione formale di linguaggio, per comprendere l'inadeguatezza al riconoscimento di definizioni non formali ne citiamo una come segue

*Un linguaggio è un insieme di parole e di metodi di combinazione delle parole usate e comprese da una comunità di persone*

E necessario dunque esprimere **sintassi** (*notazioni BNF EBNF*) e **semantica** del linguaggio secondo notazioni formali (*funzioni matematiche/formule logiche*)

Da questa suddivisione si deduce quindi che una macchina di Turing universale deve adempiere a queste due operazioni

- **analisi lessicale** data una frase riconoscere le singole parole (**token**) di una frase
- **analisi sintattica** data una sequenza di token generare una rappresentazione interna della frase (*alberi [AST](/linguaggi_modelli_computazionali/interpreti#interpretazione-differita-(abstract-syntax-tree))*)
- **analisi semantica** data una frase corretta applicare la semantica corretta per la data frase

## Struttura di un linguaggio

*Ma quali sono gli elementi che compongono un linguaggio?*

Per rispondere a questa domanda e necessario dare prima alcune definizioni:

### Alfabeto

un alfabeto $A$ è un insieme finito e non vuoto di simboli atomici. Esempio: $A = \{ a, b \}$

### Stringa

un stringa è una sequenza di simboli, ossia un **elemento del prodotto cartesiano** $A^n$.

### Linguaggio

Dato un alfabeto $A$ un linguaggio $L$ definito su $A$ e un insieme di stringhe su $A$

### Chiusura di un alfabeto

L'insieme infinito di stringhe composte per mezzo della combinazione di a (*tutti i possibili prodotti cartesiani*)

$$
A^* = A^0 \cup A^1 \cup A^2 \cup A^3 .....
$$

#### Chiusura positiva di un alfabeto

la [chiusura](/linguaggi_modelli_computazionali/linguaggi_grammatiche#chiusura-di-un-alfabeto) escludendo la stringa vuota

$$
A^+=A^* - \{\epsilon \}
$$

Ma come si può dare una definizione delle frasi lecite di un linguaggio costruite su $A^*$?

Se il linguaggio e infinito occorre una **notazione finita** in grado di descrivere un **insieme infinito di simboli** ovvero la **grammatica formale**

## Grammatiche formali

La grammatica e una notazione formale con cui definire la sintassi di un linguaggio: espressa dalla quadrupla $<VT,VN,P,S>$ dove:

- $VT$ insieme finito di **simboli terminali**
- $VN$ insieme finito di **simboli non terminali** (*metasimboli*)
- $P$ insieme finito delle **produzioni**
- $S$ simbolo non terminale speciale chiamato **scopo della grammatica**

Una stringa composta da simboli e metasimboli si dice forma di frase.

## Derivazione

Date due forme di frase $\alpha,\beta$ si dice che $\beta$ deriva direttamente da $\alpha$ se e vero che

$$
a=\eta A\delta, \space \beta = \eta \gamma\delta
$$

Ed esiste una produzione $A \rightarrow \gamma$, in caso non esista una produzione ma una catena di produzioni si parla di derivazione (*non diretta*)

## Linguaggio generato dalla grammatica

Data una grammatica $G$ si dice linguaggio $L_G$ generato dalla grammatica $G$ **l'insieme delle frasi derivabili dal simbolo iniziale della grammatica applicando le sue produzioni**

$$
L_G = \{ s \in VT^{*}: S\Rightarrow s\}
$$

Quando due grammatiche producono lo stesso linguaggio si dice che sono equivalenti, stabilire se due grammatiche sono equivalenti e un problema indecidibile, inoltre **grammatiche diverse ma equivalenti potrebbero necessitare di riconoscitori diversi**
