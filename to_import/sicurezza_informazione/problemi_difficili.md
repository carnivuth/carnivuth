---
title: problemi_difficili
show_title: true
show_right_column: true
show_toc: true
show_image: false
draft: true
description:
book: "information security"
aliases: []
tags: []
---

# Problemi difficili

Tutti gli algoritmi di cifratura si basano su problemi difficili della teoria dei numeri, qui elencati alcuni esempi interessanti:

## Fattorizzazione di un numero primo

*dato un numero primo $p$ trovare i numeri primi $x_i$ e i coefficienti $k_i$ tali per cui 

$$p=\sum_{i}{k_ix_i}$$

## Calcolo del logaritmo discreto

*dato un numero primo $p$ un generatore $g$ e un numero intero $A$ trovare $x$ tale per cui $A = g^x\mod{p}$* Tale problema ha una complessità sub-esponenziale per $p$ grande

[>](pages/sicurezza_informazione/trasformazioni.md)
