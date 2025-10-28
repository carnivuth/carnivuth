---
date: 2025-02-09
layout: simple
aliases:
  - /tecnologie_basi_dati/operatori_relazionali/index.md
  - /tecnologie_basi_dati/operatori_relazionali
permalink: /tecnologie_basi_dati/operatori_relazionali/index.md
draft: false
id: operatori_relazionali
title: Operatori relazionali
description: Come rispondere alle interrogazioni
tags: ["operatori relazionali","operatori logici", "operatori fisici"]
series: ["Tecnologie progettazione basi di dati"]
series_order: 10
---

{{< mathjax >}}
Nei DBMS relazionali le interrogazioni vengono risolte combinando in maniera opportuna un insieme di operatori, di conseguenza e necessario

- implementare in maniera efficiente tali operatori
- saper trovare la miglior combinazione per rispondere in velocita

>[!NOTE] le prestazioni di risposta a una query dipendono da molti fattori tra cui numero di tuple, distribuzione delle stesse, presenza di indici, buffer ecc...

## Tipologie di operatori

Gli operatori si dividono in due categorie

| Operatori logici                                                                                                       | Operatori fisici                                                                                            |
| ---------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- |
| estensione di quelli messi a disposizione dall'algebra relazionale, forniscono un insieme di tuple con certe proprietà | implementazione effettiva degli operatori logici, a questi e possibile associare un **costo di esecuzione** |

## Operatori logici

Gli operatori logici sono i seguenti:

- **ordinamento**
- **selezione**
- **proiezione**
- **join**
- **operatori insiemistici**
- **group by**
- **operatori aggregati**
- **operatori di modifica** (*update, delete, insert*)

## Stime di costo di un operatore

Per poter stimare il costo di un operatore si prendono in considerazione i seguenti parametri (*reperibili dai cataloghi del database*)

- $N(R)$ = numero di record di $R$
- $P(R)$ = numero di pagine di $R$
- $Len(R)$ = lunghezza (in byte) di un record di $R$
- $NK(R.A)$ = numero di valori distinti dell'attributo $R.A$
- $TP(R)$ = numero di tuple per pagina
- $B$ = numero di pagine buffer a disposizione per l'operatore
- $L(IX)$ = numero di pagine foglia dell’indice $IX$
