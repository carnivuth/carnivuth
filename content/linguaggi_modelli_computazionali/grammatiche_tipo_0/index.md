---
date: 2024-03-10
draft: true
id: GRAMMATICHE DI TIPO 0
next: "pages/linguaggi_modelli_computazionali/grammatiche_tipo_1.md"
previous: "pages/linguaggi_modelli_computazionali/classificazione_chomsky.md"
aliases: []
tags: []
index: 4
---
#  GRAMMATICHE DI TIPO 0

sono grammatiche prive di restrizioni sulle produzioni, e ammessa la produzione della stringa vuota (ergo le frasi possono ridursi di lunghezza)

un possibile esempio e il seguente:

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

nelle grammatiche di Tipo 0 è possibile arrivare a una **stringa in cui non è possibile applicare altre produzioni**, in questo caso si parla di ramo di derivazione morto

[<](pages/linguaggi_modelli_computazionali/classificazione_chomsky.md)[>](pages/linguaggi_modelli_computazionali/grammatiche_tipo_1.md)
