package alberoBinario;

import java.util.List; //Per l'output delle visite
import java.util.LinkedList; //Per l'output delle visite

import coda.*; //Per la visita BFS (come esempio di struttura dati propria)
import java.util.Stack; //Per la visita DFS (come esempio di struttura dati predefinita di JFC)

public class AlberoBinarioImpl implements AlberoBinario{
	protected NodoBinario radice;

	//Metodo costruttore di default
	public AlberoBinarioImpl(){
		radice = null;
	}
	
	//Metodi costruttori: due varianti (uno con l'info ed uno direttamente con il nodo)
	public AlberoBinarioImpl(Object e){
		radice = new NodoBinario(e);
	}

	public AlberoBinarioImpl(NodoBinario rad){
		radice = rad;
	}
	
	//Metodi accessori:
	public NodoBinario radice(){
		return radice;	
	}
	
	
	public int numNodi(){
	 return numNodi(radice);	
	}
		
	/**
	 * Restituisce il numero di nodi dell'albero radicato in un nodo
	 * <code>r</code>. Tale informazione viene determinata conteggiando
	 * ricorsivamente il numero di nodi dei sottoalberi
	 * radicati nei figli di <code>r</code>.
	 * 
	 * @return il numero di nodi presenti nell'albero radicato in <code>r</code>.
	 */
	private int numNodi(NodoBinario r) {
		return r == null ? 0 : numNodi(r.sinistro) + numNodi(r.destro) + 1;
	}
	
	public int grado(NodoBinario v) {
		int grado = 0;
		if (v == null) return -1;
		if (((NodoBinario) v).sinistro != null) grado++;
		if (((NodoBinario) v).destro != null) grado++;
		return grado;
	}
	
	public Object info(NodoBinario v){
		return v.elem;
	}
	
	//Restituisce true se v e' un figlio sinistro	
	public boolean figlioSinistro(NodoBinario v){
		if(v.equals(v.padre.sinistro)) return true;
		else return false;		
	}
	
	//Restituisce true se v e' un figlio sinistro	
	public boolean figlioDestro(NodoBinario v){
		if(v.equals(v.padre.destro)) return true;
		else return false;		
	}
	
    public NodoBinario padre(NodoBinario v){
	   return v.padre;
    }
	
	public NodoBinario sin(NodoBinario v){
		return v.sinistro;
	}
		
	public NodoBinario des(NodoBinario v){
		return v.destro;
	}
	
	public void cambiaInfo(NodoBinario v, Object info){
		v.elem =info; 
	}
	
	public void scambiaInfo(NodoBinario v1, NodoBinario v2){
		Object app = v1.elem;
		v1.elem = v2.elem;
		v2.elem = app;
	}
			
	//aggiunge "albero" come sottoalbero sinistro di "padre"
	public void innestaSin(NodoBinario padre, AlberoBinario albero){
		NodoBinario figlio =  albero.radice();
		if(figlio!=null) figlio.padre = padre;
		padre.sinistro = figlio;
	}

	//aggiunge "albero" come sottoalbero destro di "padre"
	public void innestaDes(NodoBinario padre, AlberoBinario albero){
		NodoBinario figlio =  albero.radice();
		if(figlio!=null) figlio.padre = padre;
		padre.destro = figlio;
	}


	//elimina il sottoalbero sinistro di "padre" e lo restituisce
	public AlberoBinario potaSinistro(NodoBinario padre){
		NodoBinario figlio = padre.sinistro;
		figlio.padre=null;
		AlberoBinario newalbero = new AlberoBinarioImpl(figlio);
		padre.sinistro = null;
		return newalbero;
	}	

	//elimina il sottoalbero destro di "padre" e lo restituisce
	public AlberoBinarioImpl potaDestro(NodoBinario padre){
		NodoBinario figlio = padre.destro;
		figlio.padre=null;
		AlberoBinarioImpl newalbero = new AlberoBinarioImpl(figlio);
		padre.destro = null;
		return newalbero;
	}	
		
	//Stacca e restituisce il sottoalbero radicato in un certo
	// NodoBinario "rimosso" dell'albero
	public AlberoBinario pota(NodoBinario rimosso){
		if(rimosso == null) return new AlberoBinarioImpl(); //l'albero vuoto 
		if(rimosso.padre==null){ //"rimosso" � la radice dell'albero
			radice = null;
			return new AlberoBinarioImpl(rimosso); //restituiamo l'intero albero
		}
		NodoBinario pad = rimosso.padre;
		if(figlioSinistro(rimosso)){ //se "rimosso" � figlio sinistro 
			AlberoBinario newalbero = potaSinistro(pad);
			return newalbero;						
		}
		else{ ////"rimosso" � figlio destro 
			AlberoBinario newalbero = potaDestro(pad);
			return newalbero;									
		}
	}	
	
	
	//Restituisce la lista degli elementi in una visita DFS (iterativa)
	public List visitaDFS(){
		List output = new LinkedList();//lista di elementi in output
		Stack<NodoBinario> pila = new Stack<NodoBinario>(); //Classe generica Stack<T>
		if(radice!=null) pila.push(radice);
		while(!pila.isEmpty()){
			NodoBinario u = pila.pop();//Richiederebbe il casting se usassimo la classe Stack non generica
			output.add(u.elem);//mettiamo in output corrente
			//inseriamo in pila il figlio destro e poi quello sinistro
			if(u.destro!=null) pila.push(u.destro);
			if(u.sinistro!=null) pila.push(u.sinistro);
		}
		return output;
	}
	
	//Restituisce la lista degli elementi in una visita BFS
	public List visitaBFS(){
		List output = new LinkedList();
		Coda coda = new CodaCollegata();
		if(radice!=null) coda.enqueue(radice);
		while(!coda.isEmpty()){
			NodoBinario u = (NodoBinario) coda.dequeue();
			output.add(u.elem); //Il metodo add di LinkedList aggiunge il nuovo elemnto alla fine
			//Inseriamo in coda il figlio sinistro e poi quello destro
			if(u.sinistro!=null) coda.enqueue(u.sinistro);
			if(u.destro!=null) coda.enqueue(u.destro);			
		}
		return output;
	}
	
	// ---- SOLUZIONE ESERCIZI ----
	
	// Restituisce la profondità di un nodo
	@Override
	public int level(NodoBinario v) {
		if (v == radice) return 0;
		return 1 + level(v.padre);
	}

	// Restituisce l'altezza dell'albero
	@Override
	public int altezza() {
		return altezza(radice);
	}
	
	// Metodo ausiliario per il calcolo dell'altezza
	private int altezza(NodoBinario v) {
		if(v == null) return -1;
		if (v.sinistro == null && v.destro == null) return 0;
		return 1 + Math.max(altezza(v.sinistro), altezza(v.destro));
	}

	// Restituisce il numero di foglie dell'albero
	@Override
	public int numFoglie() {
		return numFoglie(radice);
	}
	
	// Metodo ausiliario per il calcolo del numero di foglie
	private int numFoglie(NodoBinario v) {
		if (v == null) return 0;
		if (v.destro == null && v.sinistro == null) return 1;
		return numFoglie(v.destro) + numFoglie(v.sinistro);
	}

	// Restituisce il numero di nodi interni
	@Override
	public int numNodiInterni() {
		return numNodi() - numFoglie();
	}

	// Verifica l'uguaglianza con un altro albero
	@Override
	public boolean equals(AlberoBinario anotherTree) {
		return equals(radice, anotherTree.radice());
	}

	private boolean equals(NodoBinario v1, NodoBinario v2) {
		if (v1 == null && v2 == null) return true;
		return v1.equals(v2) && equals(v1.sinistro, v2.sinistro) && equals(v1.destro, v2.destro);
	}

	// Elimina le foglie che abbiano un fratello uguale
	@Override
	public void eliminaFoglieUguali() {
		eliminaFoglieUguali(radice);
	}
	
	// Metodo ausiliario per l'eliminazione delle foglie
	private void eliminaFoglieUguali(NodoBinario v) {
		if (v == null) return;
		if (v.destro == null && v.sinistro == null)
			if (v.padre.sinistro != null && v.padre.destro != null &&
					v.padre.sinistro.elem.equals(v.padre.destro.elem)) {
				pota(v);
				return;
			}
		eliminaFoglieUguali(v.destro);
		eliminaFoglieUguali(v.sinistro);
	}
	
	// Cerca l'oggetto elem nell'albero
	@Override
	public boolean search(Object elem) {
		if(elem.getClass() != radice.elem.getClass()) return false;
		return search(radice, elem);
	}
	
	// Metodo ausiliario per la ricerca
	private boolean search(NodoBinario v, Object elem) {
		if (v == null) return false;
		return v.elem.equals(elem) || search(v.sinistro, elem) || search(v.destro, elem);
	}
	
	
	// Cerca i nodi cardine
	@Override
	public List nodiCardine() {
		List l = new LinkedList();
		nodiCardine(radice, l);
		return l;
	}
	
	// Metodo ausiliario per cercare i nodi cardine
	private void nodiCardine(NodoBinario v, List l) {
		if (v == null) return;
		if (level(v) == altezza(v))
			l.add(v);
		nodiCardine(v.sinistro, l);
		nodiCardine(v.destro, l);
	}
	
}

