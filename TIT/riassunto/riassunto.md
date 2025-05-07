---
documentclass: article
title: Teoria dell'Informazione e della Trasmissione
author: Riassunto
date: 2024-2025
header-includes: |
 \usepackage[a4paper,margin=15mm]{geometry}
 \usepackage[italian]{babel}
 \usepackage{microtype}
 \usepackage{caption}
 \usepackage{float}
 \usepackage{cancel}
---

*Mathematical Theory of Communication* (Claude Shannon, 1940).

- definire e misurare informazione
- rappresentazione efficiente dell'informazione da trasmettere o da memorizzare $\to$ *codifica di sorgente*
- trasmissione affidabile su un canale rumoroso $\to$ *codifica di canale*

Sorgenti di informazione: modello matematico.

- *sorgente*: grandezza misurabile non nota a priori che varia in funzione di una variabile indipendente (tempo)

Sorgenti:

- nel tempo:
  - continue: audio
  - discrete: testo
- nelle ampiezze:
  - continue: audio
  - discrete: testo

Focus del corso su sorgenti discrete sia nel tempo che nelle ampiezze.

Sorgente $x$ che emette messaggi $X_k$ presi da un alfabeto numerabile $\mathcal X$ di dimensione $M$, non determinisci, ovvero variabili casuali.

Divisione di sorgenti:

- *senza memoria*
  - univocamente caratterizzata da alfabeto $\mathcal X$ e da $\mathrm{pmf}$ $P_X(x)$.
- *con memoria*: messaggio corrente influenzato dai precedenti

Sorgente *stazionaria*: le statistiche dei messaggi non cambiano nel tempo.


## Misura dell'informazione

Caso considerato: *sorgente senza memoria*.

1. un messaggio contiene tanta più informazione quanto meno è atteso
2. le informazioni di due messaggi indipendenti si sommano

$$ \mathcal{I}(x_i) \triangleq \log \frac 1 {P_X(x_i)} $$

Informazione media per messaggio emessa da $X$:

$$H(X) \triangleq \mathbb E[\mathcal I(x_i)] = \sum_{i=1}^M P_X(x_i) \cdot \log \frac 1 {P_X(x_i)}$$

e si definisce *entropia* della sorgente.

Unità di misura:

- $\mathrm{nat}$ se $\log = \ln$
- $\mathrm{bit}$ se $\log = \log_2$

*Proprietà*:

- $H(x) \ge 0$ perché $P_X(x_i) \le 1$ $\forall i$

*Osservazione*: siccome $\lim_{x \to 0} x \log x = 0$ osserviamo il valore limite a messaggi improbabili ($P_X(x_i) = 0$) non hanno contributo nell'entropia.

---

ESEMPI

---

*Proprietà*:

$$ H(x) \le \log_2 M \quad \text{limite superiore per l'entropia} $$

Dimostrazione:

$$\sum P(c) \log \left( \frac 1 {P(X)} \right) - P(X) \log_2 M$$
$$ = \sum P(X) \log \left( \frac 1 {P(X)M} \right) \le $$


---



---

Recap:

- $X$ sorgente senza memoria $$\mathcal X = \{x_1, ..., x_n\},\quad P_X(x)$$
- entropia $$H(X) = \sum_{i=1}^M P_X(x_i) \log \frac 1 {P_X(x_i)} = E_X [\mathcal I(x_i)]$$
  misura l'informazione media per messaggio $[\mathrm{bit}]$ emessa da $X$
- $\mathcal C$ univocamente decodificabile per $X$ $\Rightarrow$ $\bar n_{\mathcal C} \ge H(X) \le \log_2 M$
- Gilbert-Moore $$n_i = \lceil \log \frac 1 {P_X(x_i)} \rceil$$

---
