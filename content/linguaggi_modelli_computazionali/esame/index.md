---
date: 2024-11-01
draft: false
title: Esame
draft: Esempi per l'esame
aliases: []
tags: []
series: ["Linguaggi e modelli computazionali"]
series_order: 20
---

{{< mathjax >}}
> data una grammatica mostrare che e riconoscibile per mezzo di $LL(1)$
## Grammatica

- $S \rightarrow dSAB|BC$
- $A \rightarrow aA|C$
- $B \rightarrow bB|\epsilon$
- $C \rightarrow c$

### Pumping lemma per dimostrare che non e di tipo 3

si dimostra per mezzo della stringa $d^ncc^n$ in cui non e identificabile il pezzo centrale per effettuare la scomposizione nei tre pezzi $xwy$ in quanto il pezzo centrale ripetuto non e in grado di generare le due parti della stringa

>[!NOTE] si vedeva subito anche dal fatto che la prima regola di produzione presenta [self embedding](/linguaggi_modelli_computazionali/grammatiche_tipo_2#self-embedding) e il corrispondente automa a stati finiti avrebbe avuto infiniti stati

### Calcolo dei [director symbols set](/linguaggi_modelli_computazionali/grammatiche_llk#director-symbols-set)

- $DSS(S -> dSAB)= \{d\}$
- $DSS(S -> BC)= \{c,b\}$
- $DSS(A -> aA)= \{a\}$
- $DSS(A -> c)= \{c\}$
- $DSS(B -> bB)= \{b\}$
- $DSS(C -> c) =\{c\}$

- aggiungere una regola di ricorsione sinistra e mostrare che la grammatica non e più $LL(1)$

- $C\rightarrow Cd$

si ha un conflitto nei [director symbol set](/linguaggi_modelli_computazionali/grammatiche_llk#director-symbols-set) che riguardano il metasimbolo $c$ dato che si ha $dss(c \rightarrow c)$ non disgiunto con $dss(c\rightarrow cd)$ la grammatica non e $ll(1)$

> mostrare che la ricorsione sinistra si può rimuovere ma si ottiene una grammatica diversa

### Rimozione della ricorsione sinistra

- $S \rightarrow dSAB|BC$
- $A \rightarrow aA|C$
- $B \rightarrow bB|\epsilon$
- $C \rightarrow c|cD$
- $D \rightarrow d|dD$

La ricorsione sinistra e rimovibile ma si ottiene una grammatica diversa, non ottimale in caso si voglia applicare una semantica

> tentare l'approccio con analisi $LR(0)$  e $SLR$ per verificare se si può mantenere la ricorsione sinistra senza modificare il linguaggio

### Calcolo dei [contesti sinistri](/linguaggi_modelli_computazionali/grammatiche_lrk#contesti-sinistri-di-una-produzione)

- $LEFTCTXLR(0)(Z) = \{\epsilon\}$
- $LEFTCTXLR(0)(S) = LEFTCTXLR(0)(Z),LEFTCTXLR(0)(S)d$
- $LEFTCTXLR(0)(A) = LEFTCTXLR(0)(S)dS,LEFTCTXLR(0)(A)a$
- $LEFTCTXLR(0)(B) = LEFTCTXLR(0)(S)dSA,LEFTCTXLR(0)(S),LEFTCTXLR(0)(B)b$
- $LEFTCTXLR(0)(C) = LEFTCTXLR(0)(A),LEFTCTXLR(0)(C),LEFTCTXLR(0)(S)B$

### Calcolo dei [contesti lr(0)](/linguaggi_modelli_computazionali/grammatiche_lrk#contesti$lr\(0\))

- $CTXLR(0)(Z \rightarrow S) = \epsilon$
- $CTXLR(0)(S \rightarrow dSAB) = d^*dSAB$
- $CTXLR(0)(S \rightarrow BC) = d^*BC$
- $CTXLR(0)(A\rightarrow aA) = (d^*dS)a^*aA$
- $CTXLR(0)(A\rightarrow C) = (d^*S)a^*C$
- $CTXLR(0)(B \rightarrow bB) = (d^*dSA+d^*)b^*bB$
- $CTXLR(0)(B \rightarrow \epsilon) =(d^*dSA+d^*)b^*$
- $CTXLR(0)(C \rightarrow c) =((d^*S)a^*+d^*B)^*c$
- $CTXLR(0)(C \rightarrow Cd) = ((d^*S)a^*+d^*B)^*Cd$

La grammatica in questione non risulta essere [lr(0)](/linguaggi_modelli_computazionali/grammatiche_lrk#analisi-$lr\(0\)$) in quanto la regola di produzione $B \rightarrow \epsilon$ genera un conflitto shift/reduce nell'automa

> [!NOTE] per essere $LR(0)$ non devono esserci ricorsioni destre del tipo $A\rightarrow aA|a$ ne produzioni dello stesso metasimbolo che iniziano con la stessa forma di frase e si differiscono per un terminale $S\rightarrow B|Ba$, neanche le produzioni della forma $B\rightarrow bB|\epsilon$ sono corrette in quanto generano nel automa conflitti shift/reduce per via dell $\epsilon$-mossa

### Calcolo degli insiemi $follow_1$

- $FOLLOW_1(S)=END,a,c$
- $FOLLOW_1(A)=b,END,$
- $FOLLOW_1(B)=c,END,$
- $FOLLOW_1(C)=d,END$

e i conseguenti contesti $SLR$

- $SLR(1)CTX(Z \rightarrow S) = \epsilon$
- $SLR(1)CTX(S \rightarrow aSAB) = d^*dSAB(END+a+c)$
- $SLR(1)CTX(S \rightarrow BC) = d^*BC(END+a+c)$
- $SLR(1)CTX(A\rightarrow aA) = (d^*dS)a^*aA+aA))(b+END)$
- $SLR(1)CTX(A\rightarrow C) = a^*a(SC+C)(b+END)$
- $SLR(1)CTX(B \rightarrow bB) = (a^*aSA+a^*+b^*)bB(c,END)$
- $SLR(1)CTX(B \rightarrow \epsilon) = (a^*aSA+a^*+b^*)(c,END)$
- $SLR(1)CTX(C \rightarrow c) = ((a^*)B+aS)^*c(c+END)$
- $SLR(1)CTX(C \rightarrow Cd) = ((a^*)B+aS)^*Cd(c+END)$

La grammatica risulta essere $SLR$

## Costrutto `lesect`

Costrutto per eseguire una data azione su tutti gli elementi di un array uguali a un dato target

```pseudo
lesect(oggetto_da_iterare,target){funzione da svolgere sull'oggetto}
```

### Scala

```scala
def lesect[T](a:Iterable[T],t:T)(expr:(T) =>Unit):Unit={
	if (!a.isEmpty){
		if (a.head == t) expr(a.head)
		lesect(a.drop(1),t)(expr)
	}
}
//il chiamante puo sfruttare la block like sintax e il costrutto e completato
val a=Array("a","b","b")
lesect(a,"b"){print}
```

### Javascript

```javascript
function lesect(iterable,target){
  return function(expr){
    if (iterable.length!==0){
      if (iterable[0] === target){expr(iterable[0])}
      lesect(iterable.slice(1),target)(expr)
    }
  }
}

var a=Array("a","b","b")
lesect(a,"a")(console.log)
lesect(a,"b")(console.log)
lesect(a,"c")(console.log)
```

## Il cacciavite del sistemista (`grep` dei poveri)

con il potentissimo costrutto `lesect`  e la possibilità offerta da javascript di [costruire funzioni dinamicamente](/linguaggi_modelli_computazionali/javascript#costruire-funzioni-dinamicamente) si possono ricreare molti tool unix semplicemente modificando un file,

```javascript
const readline = require('readline');
const lesect = require('./lesect.js')
const fs = require('node:fs');

// check sui parametri
if (process.argv.length<4){console.error("wrong parameters"); process.exit(1)}

try {
  var commandfile=process.argv[2]
  var target=process.argv[3]
  const commandBody = fs.readFileSync(commandfile, 'utf8');
  var commmand= Function("x",file)
  var lines = [];

  var rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout,
    terminal:false
  });

  rl.on('line', (line) => {
    lines.push(line);
  });
  // approssimazione pessima, in questo modo non si consuma input prima di averne concluso la lettura, crash assicurato
  rl.on('close', (line) => {
    lesect(lines,target)(command)
  });

} catch (err) {
  process.exit(1)
}
```

e cosi possibile cambiare la semantica del costrutto `lesect` a runtime per mezzo di un semplice file `javascript`

- con questo `lesect` emula `grep`

```javascript
console.log
```

- con questo emula il comando replace di `sed`

```javascript
console.log(x.replace(process.argv[3],process.argv[4]))
```

esempi di chiamate

```bash
echo -e "a\nb\nb" | node mktool.js poorgrep.txt b
echo -e "a\nb\nb" | node mktool.js poorsed.txt a c
```

## Tratti di scala: le reverse pipes

Mostrare come scala risolve il problema dell'ereditarietà multipla per mezzo dei [tratti](/linguaggi_modelli_computazionali/scala), e le limitazioni dei tratti parametrici

```scala
// GIRA SOLO SU SCALA 3, TESTARE QUI https://scastie.scala-lang.org
class Pipe(var input:String){
	def run():Unit={
		print(input)
	}
}
trait grep(regex:String) extends Pipe{
  override def run():Unit={
    input= input.split("\\\\n").filter((x)=>{x.contains(regex)}).toList.mkString("\n");
    super.run();
  }
}
trait sed(regex:String,replace:String) extends Pipe{
  override def run():Unit={
    input= input.split("\\\\n").toList.map(x => x.replaceAll(regex,replace)).mkString("\n");
    super.run();
  }
}
(new Pipe("hello world")  with grep("pippo") with sed("hello","pippo") ).run()
```

Non e possibile creare reverse pipes con comandi ripetuti perché un tratto parametrico se esteso due volte con parametro non può essere linearizzato

```scala
class PipeGrepSed extends Pipe("Hello world") with grep("pippo") with sed("hello","pippo")
class PipeGrepSedGrep extends PipeGrepSed with grep("world")
```

>[!ERROR] questo non compila perché la seconda classe cerca di richiamare il costruttore del tratto `grep()` che viene già chiamato dalla classe padre
