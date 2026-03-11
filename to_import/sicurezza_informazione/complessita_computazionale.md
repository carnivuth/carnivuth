---
id: complessita_computazionale
aliases: []
tags: []
next: pages/sicurezza_informazione/trasformazioni.md
---

# Complessità computazionale

Per distinguere algoritmi pesanti da algoritmi leggeri si fa affidamento al concetto di complessità computazionale, definito come l'andamento in funzione dell'input del numero di operazioni necessarie per portare a termine l'algoritmo stesso

Possiamo classificare gli algoritmi in due famiglie:

-   **Algoritmi con tempo polinomiale**: $T=O(n^t)$, con esponente più grande in $g(n)$,
-   **Algoritmi con tempo esponenziale**: $T = O(b^n)$, con $b$ costante, o $T = O(\exp(n))$

Di conseguenza i problemi possono essere classificati in base agli algoritmi che li risolvono:

-   **Facile**, se esiste un algoritmo polinomiale in grado di risolverlo su una macchina di Turing deterministica

-   **Difficile**, se non sono stati fino ad ora individuati algoritmi che lo risolvono in tempo polinomiale

La chiave di volta nel creare funzioni sicure sta nello scegliere parametri che fanno si che il problema di risalire alle informazioni protette sia **Difficile**

## Dimensionamento delle [chiavi](pages/sicurezza_informazione/chiavi.md)

Per far si che le chiavi siano sicure e necessario selezionare una dimensione per cui il problema di ricerca esaustiva diventi Difficile

![](assets/sicurezza_informazione/Pasted%20image%2020240625151801.png)

[>](pages/sicurezza_informazione/trasformazioni.md)
