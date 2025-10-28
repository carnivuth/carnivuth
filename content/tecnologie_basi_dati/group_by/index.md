---
date: 2025-02-13
aliases:
  - /tecnologie_basi_dati/group_by/index.md
  - /tecnologie_basi_dati/group_by
permalink: /tecnologie_basi_dati/group_by/index.md
series: ["Tecnologie progettazione basi di dati"]
draft: false
id: group_by
title: Group_by
description: Computare funzioni aggregate
tags:
  - funzioni aggregate
  - group by ordinando
  - group by con hashing
  - group by con indice
series_order: 15
---

In caso di funzioni aggregate come

```sql
SELECT AVG(eta)
FROM Sommelier S
```

Tutti i record vengono scanditi  e vengono mantenute informazioni aggiuntive

| **Funzione** | Informazione mantenuta    |
| ------------ | ------------------------- |
| **SUM**      | totale dei valori stimati |
| **AVG**      | totale e numero di valori |
| **MIN**      | minimo dei valori         |
| **MAX**      | massimo dei valori        |
| **COUNT**    | numero dei valori         |

# Group by

In caso di raggruppamenti come:

```sql
SELECT S.livello, MIN(età)
FROM Sommelier S
GROUP BY S.livello
```

È necessario partizionare i record e calcolare le funzioni di aggregazione per ogni record, ci sono 3 principali strategie:

## Group by per mezzo di sorting

Una delle possibilità e quella di sfruttare tecniche di ordinamento come quelle viste per la [proiezione](/tecnologie_basi_dati/proiezione#proiettare-ordinando), va sommato il costo di calcolo delle funzioni aggregate

## Group by per mezzo di indici

In caso di indici sugli attributi di group by e di calcolo delle funzioni non e necessario accedere al file dati

>[!TIP] in caso di [b+tree](/tecnologie_basi_dati/b+tree) se gli attributi di raggruppamento sono un prefisso della chiave si può utilizzare l'indice per accedere al file dati in maniera ordinata

## Group by usando hashing

Si costruisce una tabella di hash in memoria centrale in maniera analoga al caso della [proiezione](/tecnologie_basi_dati/proiezione#proiettare-usando-hashing)
