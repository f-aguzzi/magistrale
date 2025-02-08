.TL
MAO - Riassunto teoria

.SH
Introduzione
.LP
Un
.I "problema decisionale"
consiste nel trovare una soluzione che soddisfi un insieme di
.I condizioni
e ottimizzi un
.I "criterio di valutazione"
che definisce un ordine di merito tra le soluzioni.
Le condizioni sono espresse in forma di equazioni e disequazioni. Una soluzione che le soddisfi tutte è detta
.I ammissibile.
L'insieme delle soluzioni ammissibili è detto
.I "regione ammissibile".
La
.I "soluzione ottima"
è la migliore soluzione ammissibile secondo il criterio di ottimizzazione.
.LP
All'interno del problema le
.I "variabili decisionali"
rappresentano quantità regolabili dal decisore. È necessario definire se esse
siano continue o intere, e limitarne l'intervallo a valori sensati. Ad esempio,
è quasi sempre imposta la non-negatività. Le condizioni, che prendono il nome
di
.I vincoli,
sono espresse in funzione delle variabili decisionali, per proporzionalità o
additività. Anche la
.I "funzione obiettivo"
è funzione delle variabili decisionali, e il suo valore è rappresentato dalla
.I "variabile obiettivo".
.LP
Il modello matematico risultante è formato dall'unione di:
.IP \(bu 2
funzione obiettivo (in forma di massimo o di minimo)
.IP \(bu
vincoli funzionali (condizioni)
.IP \(bu
vincoli di nonnegatività sulle variabili decisionali
.LP
I due tipi di vincoli vanno a definire i margini della regione ammissibile. Se
i vincoli sono mutuamente incompatibili, la regione risulta vuota.

.SH
Programmazione lineare
.LP
Un modello di problema decisionale in cui tutte le variabili decisionali sono
reali, e sia la funzione obiettivo che i vincoli sono funzioni lineari delle
variabili decisionali, è detto di
.I "programmazione lineare".
.LP
Lo spazio delle soluzioni è vettoriale, di cardinalità pari al numero di
variabili decisionali. I vincoli sono iperpiani e racchiudono la regione
ammissibile. Nel caso della programmazione, i punti di incrocio tra un numero
di vincoli pari al numero delle variabili decisionali sono detti
.I vertici
o
.I "soluzioni di base".
I vertici sono soluzioni ammissibili, e uno di essi è la soluzione ottima.
Quest'ultima si trova dunque sul contorno della regione ammissibile.
.LP
La funzione obiettivo rappresenta un fascio di iperpiani paralleli. L'iperpiano
di intercetta massima, tra quelli che intersecano la regione ammissibile, è
tangente ad un vertice. Tale vertice è la soluzione ottima.

.LP
La soluzione è di solito limitata da un solo vincolo, detto
.I "vincolo attivo".
Lo studio delle variazioni della struttura della soluzione al variare del
vincolo attivo è detto
.I "analisi di sensitività".

.SH
Forma standard
.LP
La formulazione del modello matematico di un problema di PL può essere
compattata in uno schema a blocchi usando la notazione matriciale / vettoriale
e le sommatorie.
I vincoli sono resi in
.I "forma standard"
trasformando le disequazioni in equazioni. Si introduce a questo fine una
.I "variabile scarto"
non-negativa, a sinistra dell'uguale, additiva nel caso di vincoli di minoranza
o sottrattiva per i vincoli di maggioranza. La variabile scarto rappresenta lo
scostamento dal termine noto.
.LP
Si possono raccogliere in una matrice i coefficienti delle variabili (sia
decisionali che di scarto) nelle equazioni. Ogni colonna rappresenta una
diversa variabile. Anche le variabili decisionali e le variabili scarto possono
essere raccolte in un unico vettore colonna. Un altro vettore colonna
rappresenta i termini noti delle equazioni. La regione ammissibile è
rappresentata, in forma matriciale, dall'equazione che eguaglia il prodotto
della matrice dei coefficienti e del vettore delle variabili al vettore dei
termini noti.
.LP
La matrice può essere partizionata. Un numero di colonne pari al numero di
righe sono tra loro linearmente indipendenti; le altre colonne possono essere
essere rappresentate come combinazione lineare delle prime. Dato che ogni
colonna rappresenta una variabile, definiamo
.I "variabili di base"
le variabili legate al primo gruppo di colonne, e
.I "variabili non di base"
le rimanenti. Questo permette dunque di partizionare anche il vettore delle
variabili in due vettori, uno di variabili di base e uno di variabili non di
base. Possiamo a questo punto esprimere le variabili di base in funzione delle
variabili non di base. Azzerando il vettore delle variabili non di base,
otteniamo le soluzioni di base, corrispondenti ai vertici. In corrispondenza di
esse, le variabili scarto hanno valore nullo.
.LP
Il numero di soluzioni di base è al massimo pari al coefficiente binomiale tra
la somma dei numeri di righe e colonne della matrice, e del numero di righe.
Una soluzione di base è detta
.I degenere
se almeno una delle variabili di base è nulla. In questo caso si trovano più
soluzioni di base coincidenti.

.SH
Teoremi fondamentali della programmazione lineare
.LP
.I "Primo teorema fondamentale della programmazione lineare:"
se la regione ammissibile non è vuota, almeno una soluzione ammissibile è di
base.
.LP
Nella dimostrazione si implica che la soluzione possa essere individuata
algoritmicamente in un numero finito di passi. L'algoritmo determina
necessariamente o la soluzione, o la sua inesistenza.
.LP
.I "Secondo teorema fondamentale della programmazione lineare:"
se esiste una soluzione ammissibile ottima, allora almeno una soluzione
ammissibile ottima è di base.
.LP
Se la funzione obiettivo è limitata (superiormente nei problemi di massimo,
inferiormente nei problemi di minimo), esiste una soluzione ammissibile ottima.
Procedendo iterativamente, è possibile trovare una soluzione di base
ammissibile ottima in un numero finito di passi.

.LP
L'algoritmo indicato nei teoremi fondamentali necessita di esaminare solamente
le soluzioni ammissibili di base. Esso determina una soluzione di base
ammissibile, indicando se sia unica, o dimostra che la funzione obiettivo sia
illimitata e che dunque non ci sia soluzione.
.LP
Durante un'iterazione dell'algoritmo, un vettore di variabili in un vertice può
essere visto come la somma del vettore al passo precedente con una direzione
moltiplicata per la lunghezza del passo. La direzione è sempre lungo il
contorno della regione ammissibile, lungo i vincoli.

.SH
Algoritmo del simplesso
.LP
La formulazione esatta dell'algoritmo risolutivo per i problemi di
programmazione lineare, detto
.I "algoritmo del simplesso",
fu formulata nel secondo dopoguerra dal logistico dell'esercito statunitense
George Dantzig, con l'intenzione di formalizzare le tecniche sviluppate durante
il conflitto per ottimizzare gli approvvigionamenti.
.LP
Il primo teorema fondamentale della programmazione lineare fornisce una
condizione sufficiente: se esiste una soluzione ammissibile, allora esiste una
soluzione ammissibile ottima. Si parta dunque da una soluzione di base
ammissibile e si porti la base in forma canonica. L'operazione consiste nel
normalizzare la matrice per renderla composta da versori. Si costruisce in
seguito un
.I tableau,
contenente, da sinistra a destra:
.IP \(bu 2
le colonne relative alle variabili decisionali;
.IP \(bu
le colonne relative alle variabili scarto;
.IP \(bu
la colonna dei coefficienti della variabile obiettivo;
.IP \(bu
la colonna dei termini noti;
.LP
e, dall'alto verso il basso:
.IP \(bu 2
le righe corrispondenti alle equazioni dei vincoli;
.IP \(bu
la riga finale relativa alla funzione obiettivo.

.LP
L'algoritmo procede conseguentemente in quattro passi.
.IP 1.
.I "test di ottimalità":
una base è ottima se i coefficienti di costo relativo relativi alle variabili
non di base (ovvero i valori delle rispettive colonne nell'ultima riga) sono
non-positivi. Se la soluzione è ottimale, non si procede oltre.
.IP 2.
.I "direzione di ricerca":
è necessario scegliere una coppia variabile di base / variabile non di base da
scambiare. La variabile non di base entra in base al posto dell'altra, che ne
esce. Euristicamente, si sceglie di far entrare in base la variabile non di
base con il coefficiente di costo relativo maggiore.
.IP 3.
.I "lunghezza del passo":
si sceglie quale variabile di base far uscire usando la regola dei rapporti.
Per ogni riga, si calcolano i rapporti tra i coefficienti dell'ultima colonna
(termini noti) e i corrispettivi elementi, sulla stessa riga, della colonna
relativa alla variabile non di base che deve essere portata in base, se essi
sono positivi. Si sceglie la riga con il più piccolo rapporto positivo. Questa
riga è detta
.I "riga pivot".
Si fa uscire di base la variabile di base la cui colonna abbia l'uno nella riga
pivot (si ricorda che le colonne delle variabili di base sono versori, con un
solo uno, e zeri in tutte le altre righe).
.IP 4.
.I "cambio di base":
tramite operazioni matriciali di riga si effettua il cambio di base vero e
proprio: la colonna relativa alla nuova variabile di base viene trasformata in
versore, a scapito della colonna della variabile uscita di base, che smette di
esserlo.
.LP
Si procede iterativamente fino al raggiungimento di una soluzione ottima. Una
soluzione di base degenere ha un numero di variabili positive inferiore al
numero di righe del tableau.

.SH
Esistenza di soluzioni ammissibili
.LP
L'algoritmo del simplesso necessita di una soluzione ammissibile di base
iniziale, dalla quale iterare per giungere alla soluzione ottima. Nei problemi
i cui vincoli siano tutti e soli di minoranza o minore-uguaglianza a termine
noto positivo, o uguaglianza con termine noto nullo, il vettore nullo è una
soluzione ammissibile di base banale. In presenza di altri tipi di vincoli
(maggioranza, maggiore-ugugaglianza e uguaglianza a termini noti positivi),
l'origine degli assi non è soluzione ammissibile.
.LP
Si cerca dunque di costruire un algoritmo, basato sul metodo del simplesso, in
grado di trovare una soluzione di base ammissibile per i problemi in cui il
vettore nullo non sia ammissibile. Si costruisce un problema ausiliario, in cui
il vettore nullo sia ammissibile, e la cui soluzione ottima corrisponda ad una
soluzione di base ammissibile per il problema originario. Questo si ottiene
aggiungendo una variabile scarto additiva e non-negativa a tutti i vincoli
problematici elencati in precedenza. La funzione obiettivo, da minimizzare, è
la somma di queste nuove variabili scarto.
.LP
Il valore della funzione obiettivo ausiliaria è interpretabile come un indice
di inammissibilità. Se il suo valore ottimo è positivo, allora il problema non
è risolvibile. Se invece il suo valore ottimo è zero, in corrispondenza di tale
punto si trova una soluzione di base ammissibile per il problema originario. In
tal caso, si eliminano dal tableau le colonne relative alle variabili scarto
ausiliarie, si sostituisce la colonna della variabile obiettivo ausiliaria con
quella della variabile obiettivo originale, e si sostituisce la funzione
obiettivo ausiliaria con quella originale. Il resto del tableau resta
invariato. Dalla configurazione così ottenuta è possibile procedere per
simplesso ordinario, fino alla soluzione del problema originale.

.SH
Analisi di sensitività
.LP
I coefficienti di costo relativo sono anche detti
.I "prezzi ombra"
o
.I "valorizzazioni interne"
e rappresentano l'aumento della variabile obiettivo determinato da un
incremento unitario della variabile decisionale corrispondente.
Per ogni soluzione di base ammissibile ottima e per ogni variabile decisionale,
esiste un intervallo nel quale è possibile apportare variazioni della seconda
senza inficiare la struttura della prima. L'ottimalità si perde al diventare
positivo di almeno un coefficiente di costo relativo delle variabili non di
base.
.LP
Questo tipo di analisi è spesso applicata ai vincoli attivi, per capire quali
cambiamenti possano avere più effetti sul sistema. È anche possibile inserire
nuove variabili decisionali o nuovi vincoli, senza la necessità di riapplicare
per intero l'algoritmo del simplesso.

.LP
Per tutte queste operazioni, il metodo da utilizzare cambia a seconda che le
variabili considerate siano di base o non di base.
.LP
In caso di variazioni della disponibilità di una risorsa:
.IP \(bu 2
se la variabile scarto associata è di base, il suo valore rappresenta
l'eccesso, e tale valore sarà dunque il valore massimo che sarà possibile
sottrarre prima di perdere l'ammissibilità della soluzione corrente;
.IP \(bu
se la variabile scarto non è di base, bisogna calcolare il coefficiente massimo
per il quale moltiplicare la sua colonna affinché, sottraendola alla colonna
delle variabili di base, il risultato abbia tutte le componenti non-negative.
.LP
In caso di variazione dei coefficienti di profitto unitario, la base resta
ottima fin quando il valore della funzione obiettivo rimane negativo o nullo:
.IP \(bu 2
se la risorsa è collegata ad una variabile di base, si considerano i due
vettori ottenuti raccogliendo i coefficienti delle variabili di base della riga
della funzione obiettivo e della riga relativa alla variabile di base. Si
determina poi il massimo coefficiente per il quale moltiplicare la riga della
variabile di base prima di sottrarla alla riga obiettivo, facendo in modo che
il risultato abbia tutte e sole componenti non-positive;
.IP \(bu
se la variabile non è di base, è possibile calcolare direttamente la massima
variazione possibile al suo coefficiente di costo relativo affinché esso
rimanga negativo. Quando esso rimane negativo, il valore della funzione
obiettivo non cambia. Se esso dovesse invece diventare positivo, sarebbe
necessario applicare l'algoritmo del simplesso per trovare la nuova base
ottima.
.LP
Per aggiungere un vincolo, si inserisce una nuova riga che lo rappresenti nel
tableau, e poi si inserisce una nuova colonna per una nuova variabile scarto
associata al vincolo, tutta a zeri tranne che nella nuova riga dove vale uno.
Usando operazioni di riga si agisce sulla nuova riga inserita per fare in modo
che le colonne relative alle variabili di base tornino ad essere versori. Può
capitare che l'operazione renda non ammissibile la base. In tal caso si applica
l'algoritmo del simplesso duale.
.LP
L'inserimento di una nuova variabile decisionale si valuta raccogliendo i suoi
consumi in un vettore. Questo vettore va poi moltiplicato scalarmente per il
vettore dei coefficienti di costo relativo delle variabili scarto. Il
risultato, sommato al profitto unitario legato alla nuova variabile
decisionale, deve essere positivo o nullo.
.LP
La variazione di un coefficiente nei vincoli cambia la base ottima solo se
rende positivo il coefficiente di costo relativo della relativa variabile
decisionale. La variazione del coefficiente di costo relativo della variabile
decisionale è pari al prodotto tra la variazione del coefficiente del vincolo e
il coefficiente di costo relativo della variabile scarto relativa al vincolo
cambiato.

.SH
Dualità
.LP
La forma canonica della base ottima in un problema di programmazione lineare
fornisce anche la soluzione ad un problema PL associato univocamente a quello
considerato. Quest'ultimo è detto
.I "problema duale",
mentre il primo è detto
.I "problema primale.
.LP
Le condizioni di ottimalità del primale corrispondono ai vincoli sulle
variabili decisionali del duale. Le variabili decisionali del problema primale
sono complementari alle variabili decisionali del problema duale, e viceversa.
È possibile passare dalla base del primale alla base del duale tramite una
trasformazione lineare.

.LP
Il
.I "teorema di dualità debole"
sancisce che, per ogni coppia di soluzioni ammissibili per i rispettivi
problemi, vale che il valore della funzione obiettivo del primale è sempre
minore o uguale a quello del duale. In particolare, come corollario, se la
soluzione considerata è quella ottima e il problema primale è di massimo, essa
coincide alla soluzione ottima del problema duale in forma di minimo.
.LP
I due problemi condividono la stessa matrice dei coefficienti, che nel duale è però trasposta rispetto al primale. Le variabili e le funzioni obiettivo sono legate secondo le modalità spiegate in precedenza. Se un problema è in forma di massimo, il suo duale è in forma di minimo, e viceversa. Il duale del duale è il primale: la trasformazione è simmetrica. L'unica vera distinzione univoca tra i due problemi è dunque il verso dell'ottimizzazione.
.LP
Il secondo corollario del teorema di dualità debole recita che se un problema
di programmazione lineare è limitato, allora il suo duale ha la regione
ammissibile vuota.

.SH
Algoritmo del simplesso duale
.LP
Una soluzione di base non ammissibile ma ottima per il problema primale è
ammissibile ma non ottima per il problema duale. Possiamo approfittare di
questa proprietà per costruire un algoritmo, detto
.I "algoritmo del simplesso duale",
che trova una soluzione di base ammissibile ottima costruendo una sequenza di
soluzioni di base non ammissibili ottime. Questo algoritmo si muove al di fuori
della regione ammissibile.
.LP
In base alle regole della dualità, le regioni ammissibili non coincidono.
Riuscendo a determinare che il vettore nullo è soluzione ottima ma non
ammissibile in un problema di programmazione lineare, è possibile risolvere il
problema duale, la cui soluzione coincide con quella del primale, invece di
utilizzare la procedura ausiliaria per i problemi di cui sia ignota una
soluzione di base ammissibile.
.LP
È possibile costruire un algoritmo diretto, che permetta di risolvere il duale
dai dati e dal tableau del problema primale, senza effettuare la trasformazione
per passare da uno all'altro. Soluzione di base ammissibile per soluzione di
base ammissibile, i valori delle variabili obiettivo dei due problemi sono
uguali tra loro, compreso il valore della funzione obiettivo nel punto di
ottimo.

.LP
Il
.I "teorema degli scarti complementari" sancisce che le soluzioni ammissibili
dei due problemi sono entrambe ottime per il rispettivo problema se e solo se
il prodotto scalare delle due coppie variabili complementari è nullo. Questa è
detta
.I "condizione di complementarietà".
.LP
Il simplesso duale può essere usato per ripristinare l'ammissibilità di una
soluzione ottima durante l'analisi di post-ottimalità.

.LP
Sia presentata ora l'effettiva formulazione dell'algoritmo del simplesso duale,
nella forma applicabile al tableau del primale. Si ricordi innanzitutto che
l'algoritmo si muove lungo una sequenza di basi ottime ma non ammissibili. La
prima fase del passo iterativo consiste dunque nel test di ottimalità (come nel
primale, accertandosi che i coefficienti delle variabili non di base nella riga
relativa alla funzione obiettivo siano non-positivi) e di non ammissibilità
(almeno una delle variabili di base, ovvero un termine dell'ultima colonna,
deve avere un valore negativo).
.LP
Il passaggio successivo consiste nella scelta della riga pivot. Si sceglie la
riga relativa alla più negativa delle variabili di base. Essa uscirà di base.
Determinata la riga pivot, si applica la regola dei rapporti, ma in verticale:
per ogni colonna si calcola il rapporto tra il termine della riga obiettivo e
il corrispettivo termine della riga pivot. La variabile che entra in base è
quella relativa alla colonna con il più piccolo rapporto positivo.
.LP
Tramite operazioni di riga basate sulla riga pivot, si porta in base la
variabile nuova. L'algoritmo è da riapplicare iterativamente finché non si
raggiunge una base ammissibile. A meno di errori, ogni base trovata procedendo
per simplesso duale a partire da una base iniziale ottimale ma non ammissibile
sarà anch'essa ottimale.

.LP
Usando la dualità è possibile stabilire limiti superiori e inferiori per il
risultato di un problema di programmazione lineare a partire da una qualsiasi
base per uno dei due problemi. Il valore ottimo è infatti stretto tra un limite
inferiore e superiore che sono determinati dal valore corrente delle funzioni
obiettivo primale e duale. Questi due valori eventualmente coincidono
nell'ottimo di entrambi. 
.LP
Sempre secondo lo stesso principio, è possibile determinare se una base sia
ottima. Per essere ottima, essa deve essere infatti ammissibile per entrambi i
problemi, senza violare le condizioni sulle variabili di nessuno dei due.
