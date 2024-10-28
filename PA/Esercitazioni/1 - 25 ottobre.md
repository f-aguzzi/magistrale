# Esercitazione 25 ottobre 2024

<u>Esercizio 1</u>
```c
#include<stdio.h>
#include<stdlib.h>

void foo(int* a) {
    *(a+1) = 20;
}

int main(void) {
    int x = 0, y = 10;
    printf("%d %d\n", x, y);
    foo(&y);
    printf("%d %d\n", x, y);

    
    return EXIT_SUCCESS;
}
```

Le variabili sono allocate in memoria in ordine inverso rispetto alla dichiarazione, e quindi `x` si trova dopo `y`. La funzione `foo`, chiamata sull'indirizzo di `y`, dereferenzia in realtà una cella avanti a `y`: `*(a+1)` e dunque va a scrivere in `x`. Eseguendo il codice, vediamo che il valore `20` è finito in `x`, e che `y` rimane al valore di inizializzazione di 10.

<u>Esercizio 2</u>
```c
#include<stdio.h>

int main() {
    int x[100];
    printf("x: %p\n", &x);

    int *ptr = x;
    printf("Ptr prima: %p\n", ptr);

    // ptr += 20000; troppo, causa segmentation fault
    ptr += 20;
    printf("Ptr dopo: %p\n", ptr);
    *ptr = 2;
}
```

Spostando di un numero eccessivamente elevato di celle il puntatore, e dereferenziandolo, rischiamo di ottenere un `segmentation fault` da parte del sistema operativo. Questo perché la memoria assegnata ai programmi è divisa in pagine non contigue, ed esagerare porta ad uscire dalla pagina corrente, causando un errore visibile dal sistema operativo. Usando numeri bassi, invece, usciamo dall'array senza uscire dalla pagina, e il programma internamente non se ne accorge.

<u>Esercizio 3</u>
```c
#include<stdlib.h>

int main() {
    int *ptr;
    ptr = NULL;
    *ptr = 2;
}
```

In questo esercizio viene assegnato un valore al puntatore nullo. Si tratta di *undefined behavior*, che viene gestito diversamente in base al compilatore usato.  