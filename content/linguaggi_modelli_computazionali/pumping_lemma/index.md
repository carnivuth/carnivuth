---
date: 2024-03-10
series: ["Linguaggi e modelli computazionali"]
draft: true
title: Pumping lemma
description: Distinguere grammatiche di tipo 2 e 3
aliases: []
tags: []
series_order: 9
---

{{ mathjax }}
È una condizione necessaria (*ma non sufficiente*) per dimostrare che un linguaggio è di [tipo 2](/linguaggi_modelli_computazionali/grammatiche_tipo_2) o di [tipo 3](/linguaggi_modelli_computazionali/grammatiche_regolari), si basa sul concetto che in un linguaggio infinito a un certo punto **deve essere presente una stringa motore che viene ripetuta $n$ volte** (*pompata*) per ottenere nuove stringhe del linguaggio

Se $L$ e un linguaggio di tipo 2 esiste un intero $N$ tale che per ogni stringa $z: len(z)\geq N$ per cui:

- $z$ e scomponibile in 5 parti $z = uvwxy$
- $vwx \leq N$
- $\vert vx \vert \geq 1$

Dove le componenti $v$ $x$ possono essere ripetute (*pompate*) per ottenere le altre frasi del linguaggio

$$uv^iwx^iy \in L \forall i \geq 0$$

## Linguaggi di tipo 3

Esiste una variante del teorema per linguaggi di tipo 3

Se $L$ e un linguaggio di tipo 3 esiste un intero $N$ tale che per ogni stringa $z: len(z)\geq N$ per cui:

- $z$ e scomponibile in 3 parti $z = xyw$
- $y\leq N$
- $\vert y\vert \geq 1$

Dove la componente centrale $y$ può essere ripetuta (*pompata*) per ottenere le altre frasi del linguaggio

$$xy^iw \in L \forall i \geq 0$$

