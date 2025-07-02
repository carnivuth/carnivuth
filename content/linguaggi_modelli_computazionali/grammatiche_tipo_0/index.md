---
date: 2024-03-10
series: ["Linguaggi e modelli computazionali"]
draft: true
title:  Grammatiche di tipo 0
description:  Grammatiche più potenti ma anche più costose da riconoscere
aliases: []
tags: []
series_order: 4
---

{{ mathjax }}
Sono grammatiche prive di restrizioni sulle produzioni, e ammessa la produzione della stringa vuota (ergo le frasi possono ridursi di lunghezza)

Un possibile esempio e il seguente:

$$
S \rightarrow aSBC, \space CB \rightarrow BC, \space SB \rightarrow bF, \space FB \rightarrow bF,
$$
$$
FC \rightarrow cG, \space GC \rightarrow cG, \space G \rightarrow \epsilon
$$

Notare che tale linguaggio **ammette produzioni in cui la frase viene accorciata**

$$
S \rightarrow aSBC\rightarrow abFC \rightarrow abcG \rightarrow abc
$$

## Rami di derivazione morti

Nelle grammatiche di Tipo 0 è possibile arrivare a una **stringa in cui non è possibile applicare altre produzioni**, in questo caso si parla di ramo di derivazione morto
