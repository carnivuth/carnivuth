---
draft: true
series: ["Tecnologie progettazione basi di dati"]
series_order: 21
date: 2025-02-18
id: r-tree
title: R-tree
description: Indici ad albero per la risoluzione di query spaziali
aliases: []
tags:
  - r-tree vs b+tree
  - minimum bounding box
  - MBB
  - search with r-tree
---

{{< katex >}}
Gli r-tree sono alberi paginati e bilanciati dove ogni nodo corrisponde a una regione triangolare detta minimal bounding box (*MMB*) che contiene tutte le regioni figlie

L'utilizzo dello storage da parte di un nodo varia dal \\(100\%\\) a un valore minimo inferiore al \\(50\%\\) (*parametro tunabile*)

Le foglie dell'albero sono entry nella forma  `(key, RID)`, dove il valore di chiave contiene le coordinate
>[!NOTE] possibile contenere anche oggetti con un estensione spaziale

I nodi interni dell'albero si presentano nella forma `(MBB, PID)`, dove la chiave sono le coordinate della minimal bounding box

![](r_tree.png)

## Concetto di mbb

La minima bounding box e definita come la regione hyper-rettangolare minima che contiene un set di punti \\(m\\)

![](minimum_bounding_box.png)

Per definirla e sufficiente conoscere le coordinate di due vertici opposti

## R-tree vs [b+tree](/tecnologie_basi_dati/b+tree)


| B+tree                                                 | R-tree                                                                 |
| ------------------------------------------------------ | ---------------------------------------------------------------------- |
| bilanciato e paginato                                  | bilanciato e paginato                                                  |
| i dati sono contenuti nelle foglie                     | i dati sono contenuti nelle foglie                                     |
| le foglie sono ordinate                                | non esiste l'ordine                                                    |
| i dati sono organizzati in intervalli monodimensionali | i dati sono organizzati in intervalli multidimensionali                |
| la ricerca puntuale segue un solo percorso dell'albero | la ricerca puntuale può seguire strade diverse all'interno dell'albero |


## Ricerca con r-tree

La ricerca con un r-tree consiste nel trovare tutti i punti che fanno parte della bounding box della query di ricerca

![](ricerca_r_tree.png)

Per implementare la ricerca e necessario implementare le API previste dalla specifica [GiST](/tecnologie_basi_dati/gist)

- `Consistent(E,q)` ritorna true solo se `E` e `q` hanno intersezione non nulla
- `Union(P)` l'output e la MMB che contiene tutte le entry
-  `Penalty(E1,E2)` Se il punto si trova dentro la bounding box la penalty e `0` altrimenti e data dal aumento di dimensione della bounding box stessa
- `Picksplit(P)` in output vengono fornite le entry e l'output e un set di due bounding box con cardinalità inferiore, lo split viene deciso minimizzando l'area complessiva delle due [MBB](#concetto-di-mbb)
>[!WARNING] minimizzare la somma complessiva e un problema Np-hard
