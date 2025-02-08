.TL
Riassuntone di IMAD

.SH
Blocco 1
.LP
Un
.I sistema
è un meccanismo astratto che converte ingressi (cause) in uscite(effetti).
.LP
Un
.I modello
è la descrizione matematica di un sistema.
.LP
La modellazione può essere
.IP \(bu 2
.I "white-box",
ovvero basata sulle leggi fisiche e conoscenza a priori del modello. Precisa e
generalizzabile ma richiede conoscenza esatta del sistema ed è complessa.
.IP \(bu
.I "black-box",
basata su identificazione in seguito ad un esperimento che fornisce dati
.IP \(bu
.I "gray-box",
una via di mezzo tra le precedenti. Si conosce il modello fisico ma bisogna
stimarne i parametri a partire da dati sperimentali.
.LP
La bontà dei modelli si riconosce dalla loro capacità di prevedere
correttamente l'andamento del sistema a partire dai dati sperimentali. Il corso
si concentra sui modelli black-box. I sistemi si dividono in statici o dinamici
a seconda che non dipendano o dipendano dal tempo. L'identificazione dei
modelli è un problema di stima.

.LP
La
.I "statistica descrittiva"
analizza le caratteristiche dei dati, affetti da rumore e incertezza,
derivandone ad esempio media, varianza, correlazione e distribuzione.
.LP
Il
.I "machine learning"
individua regolarità nei dati e sviluppa algoritmi in grado di trovarle
autonomamente.
.LP
Le due tematiche sono correlate: l'analisi dei dati permette prima di
riconoscere il modello migliore, per poi stimare e infine valutare il modello
ottenuto.
La rappresentazione probabilistica genera un modello probabilistico capace di
gestire increttezza nelle misure e nella conoscenza della realtà.

.LP
L'
.I "apprendimento supervisionato"
è una sottocategoria del machine learning che si occupa di stimare le uscite
dagli ingressi.
.I L'"apprendimento non supervisionato"
scopre relazioni e strutture a partire dal solo ingresso. Questa seconda
categoria non è affrontata dal corso.
.LP
L'ingresso è definito come un vettore di regresssori, mentre l'uscita è
continua (per la regressione) o intera / categorica (per la classificazione).

