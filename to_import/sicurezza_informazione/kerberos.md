---
id: kerberos
next: "pages/sicurezza_informazione/pgp.md"
previous: "pages/sicurezza_informazione/ssl.md"
aliases: []
tags: []
index: 13
---

# Kerberos

Servizio di autenticazione centralizzato per un accesso a un pull di workstation e differenziare accesso in base agli utenti.

Kerberos garantisce le seguenti funzionalità:

- Previene l'impersonificazione
- Limita la possibilità per un utente di alterare l’indirizzo IP di una workstation
- Evita possibili attacchi con replica

## Protocollo

Il protocollo avviene fra tre entità, il server fidato il client e il fornitore del servizio

```mermaid
sequenceDiagram
participant C
participant AS
participant V
C ->> AS: IDC || PC || IDV
AS ->> C: ticket
C ->> V: IDC || ticket
```

Uno dei problemi fondamentali con questa versione del protocollo e evitare attacchi di replica, inoltre ad ogni comunicazione con la destinazione e necessario ripetere la procedura di autenticazione

i problemi sopracitati possono essere compensati introducendo un elemento architetturale che si occupi di lasciare ticket di sessione per mezzo di ticket con tempo di validità:

```mermaid
sequenceDiagram
participant C
participant AS
participant V
participant TGS
C ->> AS: IDC || PC || IDV
AS ->> C: ticket
C ->> TGS: IDC || ticket
TGS ->> C: || session ticket
C ->> V: IDC || session ticket
```

## Domini multipli

In caso di domini multipli gestiti da più TGS e AS si predispongono delle relazioni di fiducia tra i vari AS  basati su chiavi precondivise in modo da erogare il servizio a utenti diversi da quelli del proprio dominio

[<](pages/sicurezza_informazione/ssl.md)[>](pages/sicurezza_informazione/pgp.md)
