---
id: rsa
aliases: []
tags: []
index: 8
next: pages/sicurezza_informazione/key_management.md
previous: pages/sicurezza_informazione/cifrari_asimmetrici.md
---

# Rivest–shamir–adleman (rsa)

cifrario asimmetrico che sfrutta il problema della [fattorizzazione di un numero primo](pages/sicurezza_informazione/problemi_difficili.md#fattorizzazione%20di%20un%20numero%20primo) in cui la chiave pubblica e formata da due numeri $n,e$ (*noti*) e la privata da $n,d$ (*privati*)

## Generazione delle chiavi

$n$ viene scelto essere: $$ p\ast q $$ con $p$ e $q$ numeri primi molto grandim si calcola poi un numero coprimo di $n$ come segue $$\Phi(n) = (p-1) \ast (q-1)$$
a questo punto $e$ viene scelto fra i coprimi di $\Phi(n)$: $$gen(\Phi(n),e)= 1$$
infine viene calcolato $d$: $$d= e^{-1}\mod{n}$$
Le chiavi finali risultano essere:

$$
\displaylines{
k_{priv} = [d,n] \\
k_{pub} = [e,n] \\
}
$$

La cifratura e la decifratura sono implementate come esponenziazioni modulari

$$
E_{rsa}(x)= x^e\mod n
$$
$$
D_{rsa}(c)= x^d\mod n
$$

E molto importante che nel caso $x \gt n$  questo venga frammentato per garantire una cifratura corretta

## Ricerca numeri primi

Per implementare correttamente queste soluzioni e necessario trovare un' implementazione efficiente per la ricerca di numeri primi

una possibile soluzione può essere

```c
# numero random grande
int x = random.gen()
while(! primo(x)){ // test di primalita
x= x+2
}
return x
```

>[!NOTE] questa soluzione ha un tempo di esecuzione $o(ln(x))$

### Test di primalità

Per ricercare un numero primo per la generazione dei segreti previsti per RSA e necessario definire un metodo per determinare se un dato numero e primo o meno, ci sono 2 metodologie per eseguire un test di primalità:

- **deterministico** più oneroso ma garantisce di trovare un numero primo
- **probabilistico**  meno oneroso ma non c'e certezza di trovare un numero primo

## Attacchi a rsa

L'algoritmo RSA e vulnerabile a diverse tipologie di attacco:

- **Forza bruta**: attacchi che sfruttano il numero n, la fattorizzazione del numeri primi, per evitare dobbiamo dividere in modo corretto la chiave.
- **Attacchi matematici**
- **Attacchi a tempo**: difficilissima da fare ma è stata dimostrata, esistono contromisure che possono essere adottate (es tecniche di padding)
- **Attacchi a testo cifrato scelto**: posso evitare se utilizzo il padding oaet (probabilistico)

## Firma con rsa

RSA e un algoritmo di cifratura con recupero (*e.g. che necessita di frammentare il messaggio e firmare i singoli pezzi*), questo lo rende meno adatto a eseguire la firma di testi in quanto essa può essere trasportata da un file ad un altro se i blocchi sono identici.

### Perché firmare con rsa: autenticazione a occhi chiusi

grazie alla proprietà moltiplicativa di RSA e vero che:

$$
c = (m^{dU}\mod nU)=
((m_1\ast m_2)^{dU}\mod nU) = \\
((m_1^{dU}\mod nU)\ast (m_2^{dU}\mod nU))^{dU}\mod nU
$$

questo consente di implementare la cosiddetta **autenticazione ad occhi chiusi**, dove un nodo e in grado di firmare un messaggio senza conoscerne il contenuto

- X sceglie a caso un numero $r$ coprimo con $nT$
- Invia a T il testo cifrato $c_1 = mr^{eT} \mod nT$
- T firma $c1$ e restituisce a X $c2 = m^{dT}r^{eTdT}  \mod nT = (m^{dT}r) \mod nT$
- X moltiplica $c2$ per $r^{-1}$:  $c3 = (m^{dT}rr^{-1})\mod nT = d^{dT} \mod nU$
- Il destinatario di $m$ può verificare che è autenticato da T: $(c3)^{eT} \mod nT = m$

questa proprietà può essere sfruttata da un attaccante per far firmare messaggi a una destinazione che altrimenti non li firmerebbe

[<](pages/sicurezza_informazione/cifrari_asimmetrici.md)[>](pages/sicurezza_informazione/key_management.md)
