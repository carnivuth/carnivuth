---
id: ipsec
next: "pages/sicurezza_informazione/ssl.md"
previous: "pages/sicurezza_informazione/diffie_hellman.md"
aliases: []
tags: []
index: 11
---
# Ipsec

È un servizio di sicurezza a livello di rete che nasce per risolvere alcuni problemi che altrimenti non possono essere risolti:

- **Packet sniffing**: lettura dei pacchetti in transito.
- **IP spoofing**: falsificazione dell’indirizzo del mittente, ciò permette di effettuare attacchi sofisticati.
- **Connection hijacking**: inserimento di dati nei pacchetti in transito.

## Protocolli

I protocolli utilizzati sono i seguenti

- **Authentication Header**: per autenticare pacchetti, garantisce autenticità e integrità.
- **Encapsulating Security Payload**: può essere configurato per garantire solo confidenzialità o anche autenticazione dei pacchetti.
- **Internet Key Exchange**: negoziare parametri di sicurezza, autenticazione e distribuzione delle chiavi utilizzate.

## Elementi architetturali

IPSEC non è solo un insieme di protocolli,  ma prevede una serie di elementi architetturali tra cui

### Security associations (sa)

Struttura dati che stabilisce quali sono i parametri di sicurezza che i due interlocutori devono utilizzare per la comunicazione seguente, composto da diversi elementi:

- **Security parameter index (SPI)** : valore che indica quali sono i pacchetti che sono sottoposti alla **SA**
- **Ip destination Address**
- **Security Protocol Identifier**: Tipo di protocollo applicato

### Security policy database (spd)

Database in cui vengono mantenute le security policy, queste vengono applicate alla comunicazione in base a differenti parametri della connessione stessa (*destination address, source address*)

## Incapsulamento dei messaggi

I messaggi possono essere scambiati secondo 2 modalità:

- **trasporto** a essere cifrato e solo il payload del pacchetto IP, gli indirizzi utilizzati devono essere instradabili nella rete
- **tunnel** utilizzato per costruire vpn, tutto il pacchetto IP viene cifrato e inserito all'interno di un altro pacchetto IP

## Servizio anti-reply

Servizio per impedire attacchi di replay, si basa sul concetto di finestra a scorrimento:

Una volta stabilita la dimensione della finestra: i nodi comunicanti alla ricezione di un pacchetto lo marcano e controllano la finestra:

- se il pacchetto e gia presente nella finestra viene scartato
- se il pacchetto non e presente nella finestra viene marcato e inserito nella finestra
-  se il pacchetto ha un numero di sequenza inferiore all' ultimo pacchetto in finestra viene scartato

## modalità trasporto vs modalità tunnel

Nella modalita trasporto il payload del pacchetto originario viene incapsulato nel pacchetto IPSEC **senza modificare l'intestazione dello stesso** questo comporta che i nodi coinvolti non sono mascherati

Mentre nella modalità tunnel si prevede di avere il parchetto originario IP che viene cifrato e incapsulato in un nuovo pacchetto **che ha un'intestazione diversa da quello originale** (caso di utilizzo comune)

[<](pages/sicurezza_informazione/diffie_hellman.md)[>](pages/sicurezza_informazione/ssl.md)
