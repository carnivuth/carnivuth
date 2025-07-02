---
date: 2024-09-21
series: ["Linguaggi e modelli computazionali"]
draft: true
id: RICONOSCERE_LINGUAGGI_TIPO_3
next: "pages/linguaggi_modelli_computazionali/pda.md"
previous: "pages/linguaggi_modelli_computazionali/pumping_lemma.md"
aliases:
  - RSF
tags: []
series_order: 10
---
# Automa a stati finiti

Per riconoscere linguaggio di livello 3 e necessario un **automa a stati finiti**, questo può essere definito come

$$
<A,S,S_0,F,sfn^*>
$$

dove:

- $A$ e un alfabeto
- $S$ e l'insieme degli stati
- $S_0$  e lo stato iniziale ($S_0 \in S$)
- $F$ e l'insieme degli stati finali
- $sfn^*$ e la funzione di stato che computa lo stato futuro del sistema

la funzione $sfn$ definisce a partire dallo stato iniziale $S_0$ l'evoluzione del sistema in funzione delle sequenze in ingresso $x$

```mermaid
flowchart LR
I((I))
E((E))
A((A))
F((F))
c --a--> A
I --b,u--> E
F --a,b,u--> E
A --b--> F
A --a--> A
```

### Linguaggi e riconoscitori

Un linguaggio di di tipo 3 e **non vuoto**  se il riconoscitore accetta una stringa x di lunghezza $L_x$ minore del numero di stati $N$

Un linguaggio di di tipo 3 e **infinito** se il riconoscitore accetta una stringa x di lunghezza $N \lt L_x \lt 2N$ dove $N$ e il numero di stati del automa


## Da riconoscitori a generatori

La differenza fra riconoscitori di un linguaggio a generatori dello stesso e dipende da un cambio di prospettiva nella loro descrizione, riprendendo l'esempio di cui sopra:

> *l'automa dallo stato $C$ si sposta in $A$ con input $a$*

Si puo ache esprimere come segue:

> *l'automa dallo stato $C$ genera la stringa a e si sposta nello stato $A$*

In questo modo si possono interpretare il grafo di un automa come produzioni di una grammatica

[<](pages/linguaggi_modelli_computazionali/pumping_lemma.md)[>](pages/linguaggi_modelli_computazionali/pda.md)
