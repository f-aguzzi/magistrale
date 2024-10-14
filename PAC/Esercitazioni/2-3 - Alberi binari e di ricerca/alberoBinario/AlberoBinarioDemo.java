package alberoBinario;

import java.util.LinkedList;

public class AlberoBinarioDemo{
	public static void main(String argc[]){
		AlberoBinario alb1 = new AlberoBinarioImpl(1);
		NodoBinario nodo1 = alb1.radice();

		AlberoBinario alb2 = new AlberoBinarioImpl(2);
		NodoBinario nodo2 = alb2.radice();

		AlberoBinario alb3 = new AlberoBinarioImpl(3);
		NodoBinario nodo3 = alb3.radice();

		AlberoBinario alb4 = new AlberoBinarioImpl(4);
		NodoBinario nodo4 = alb4.radice();

		AlberoBinario alb5 = new AlberoBinarioImpl(5);
		NodoBinario nodo5 = alb5.radice();

		AlberoBinario alb6 = new AlberoBinarioImpl(6);
		NodoBinario nodo6 = alb6.radice();

		
		alb1.innestaDes(nodo1,alb3);
		alb1.innestaSin(nodo1,alb2);
		alb1.innestaDes(nodo3,alb4);
		alb1.innestaSin(nodo2,alb5);
		alb1.innestaDes(nodo2,alb6);
		
		
		// ---- ESERCIZI ----
		
		// Profondità nodi
		System.out.println("Profondità del nodo 3: " + alb1.level(nodo3));
		System.out.println("Profondità del nodo 4: " + alb1.level(nodo4));
		
		// Altezza
		System.out.println("Altezza dell'albero 1: " + alb1.altezza());
		
		// Conta foglie
		System.out.println("Numero di foglie dell'albero 1:  " +  alb1.numFoglie());
		System.out.println("Numero di foglie dell'albero 3:  " +  alb3.numFoglie());
		System.out.println("Numero di foglie dell'albero 2:  " +  alb2.numFoglie());
		
		// Nodi interni
		System.out.println("Numero di nodi interni dell'albero 1: " + alb1.numNodiInterni());
		
		// Metodo equals
		System.out.println("Uguaglianza alberi 1 e 1: " + alb1.equals(alb1));
		System.out.println("Uguaglianza alberi 1 e 2: " + alb1.equals(alb2));
		System.out.println("Uguaglianza alberi 2 e 4: " + alb2.equals(alb4));
		
		// Rimozione foglie duplicate
		// Creiamo un duplicato
		AlberoBinario alb7 = new AlberoBinarioImpl(4);
		alb1.innestaSin(nodo3, alb7);
		// Eliminiamolo e confrontiamo
		System.out.println("Albero 1 prima di eliminare duplicati: " + alb1.visitaDFS().toString());
		alb1.eliminaFoglieUguali();
		System.out.println("Albero 1 dopo aver eliminato duplicati: " + alb1.visitaDFS().toString());
		
		// Ricerca
		System.out.println("Ricerca nodo 4 in alb1: " + alb1.search(4));
		System.out.println("Ricerca nodo 8 in alb1: " + alb1.search(8));
		
		// Nodi cardine
		System.out.println("Nodi cardine di alb1: " + alb1.nodiCardine().toString());
	}
}