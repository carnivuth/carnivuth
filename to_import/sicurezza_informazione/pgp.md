---
id: pgp
aliases: []
tags: []
index: 14
next: pages/sicurezza_informazione/blockchain.md
previous: pages/sicurezza_informazione/kerberos.md
---

# Pretty good privacy (pgp)

Protocollo di sicurezza pensato per scambiare documenti in modo sicuro (*email e file storage*), compatibile con differenti sistemi di messaggistica email, fornisce anche servizi di autenticazione per mezzo di meccanismi di [firma digitale](pages/sicurezza_informazione/protocolli.md#firma%20digitale).

## Pgp e la riservatezza

per lo scambio di informazioni viene applicato un [cifrario ibrido](pages/sicurezza_informazione/cifrari_asimmetrici.md#cifrario%20ibrido) con [rsa](pages/sicurezza_informazione/rsa.md), i messaggi scambiati contengono il testo cifrato, la chiave k  per la cifratura simmetrica che a sua volta viene cifrata con la chiave pubblica della destinazione.

## Pgp e autenticazione

L'autenticazione si basa su hashing e signing di messaggi

## cifratura

la cifratura simmetrica avviene per mezzo del [CFB](pages/sicurezza_informazione/modalita_cifratura.md#cipher%20feedback%20(cfb)).

## formato dei messaggi

I messaggi scambiati contengono:

- message digest (*hash del messaggio*)
- timestamp (*non sicuro*)
- identificatore della chiave pubblica del destinatario o del firmatario (*a seconda del pacchetto*)

## Gestione delle chiavi: il portachiavi

PGP non prevede nessuna entità centralizzata per l'autenticazione, invece ogni utente si predispone di 2 portachiavi (*uno per le chiavi private l'altro per le pubbliche*) in cui conservare le chiavi utilizzate per il protocollo PGP.

Le chiavi pubbliche possono essere ottenute:

- dal possessore della chiave stessa
- da un intermediario

A ogni chiave e associato un livello di fiducia che può dipendere:

- dal canale di comunicazione in cui la chiave e stata scambiata
- dal possessore
- dall'intermediario che ha fornito la chiave

E previsto inoltre un meccanismo di fiducia anche per i certificati mostrati dagli intermediari.

[<](pages/sicurezza_informazione/kerberos.md)[>](pages/sicurezza_informazione/blockchain.md)
