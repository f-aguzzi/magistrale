package alberoBR;

import alberoBinario.AlberoBinario;
import alberoBinario.AlberoBinarioImpl;
import alberoBinario.NodoBinario;

public class AlberoBR extends AlberoBinarioImpl implements Dizionario {
	
     /*  Metodi accessori */	
	//Assume che il campo elemento di un nodo sia di tipo "Record"
	protected Comparable chiave(NodoBinario nodo){
		if(nodo == null) return null;
		else return ((Record)nodo.elem).key;	
	}
	
	protected Object data(NodoBinario nodo){
		if(nodo == null) return null;
		else return ((Record)nodo.elem).data;	
	}
	
	/**
	 * Aggiunge all'albero la coppia <code>(e,k)</code>
	 * 
	 * @param e elemento da inserire
	 * @param k chiave associata all'elemento
	 */
	public void insert(Object e, Comparable k){
		//Crea un record e poi un nodo a partire dalla coppia (e,k)
		NodoBinario z = new NodoBinario(new Record(e,k));
	
		if(radice == null){ //albero vuoto
			this.radice = z;
		}
		else{									
			NodoBinario corr = radice;
			NodoBinario y = null;//y sara' il pradre dell'ultimo nodo alla fine
			while(corr != null){
				y = corr;
				if(k.compareTo(chiave(corr)) <= 0) corr = corr.sinistro;
				else corr = corr.destro;							
			}
			//y e' il padre du z, e z sara' figlio sx o dx di y a seconda delle chiavi
			z.padre = y;
			if(k.compareTo(chiave(y)) <= 0) 
				y.sinistro = z;
			else y.destro = z;										
		}			
	}

	
	
	
	/**
	 * Restituisce l'elemento <code>e</code> con chiave <code>k</code>.
	 * In caso di duplicati, l'elemento restituito
	 * &egrave; il record scelto arbitrariamente tra quelli con chiave <code>k</code>.
	 * 
	 * @param k chiave dell'elemento da ricercare
	 * @return elemento (l'intero record) di chiave k, null se assente o l'albero � vuoto
	 */	
	public Object search (Comparable k){
		NodoBinario nodo = searchNodo(k,radice);
		if(nodo == null) return null;
		else return nodo.elem; //o in alternativa return data(nodo);
	}
	
	//Trova un nodo di chiave data
	private NodoBinario searchNodo(Comparable k, NodoBinario v){
		while(v != null){
			if(k.compareTo(chiave(v))==0) return v;//chiave trovata
			if(k.compareTo(chiave(v))<0) v = v.sinistro;//ricerca procede a sinistra
			else v = v.destro;//ricerca procede a destra	
		}
		return null; //chiave non trovata o albero vuoto (v==radice==null)		
	}
	

	/**
	 * Rimuove l'elemento di chiave <code>k</code>
	 * 
             *@param k chiave dell'elemento da ricercare
	*/
	public void delete(Comparable k){
	    //Ricerca del nodo u di chiave k da cancellare
 	    NodoBinario u = searchNodo(k,radice);
		if(u != null){
			//u ha al piu' un figlio (o e' foglia o ha un unico figlio)
			if(u.sinistro == null || u.destro == null){ 
				contraiNodo(u); //cancellazione effettiva di un nodo con al pi� un figlio
			}
			else{//u ha 2 figli
				//Si individua il predecessore v di u (il max del sottoalbero sinistro di u)
				NodoBinario v = max(u.sinistro);
				scambiaInfo(u,v);			
				contraiNodo(v); //cancellazione effettiva di un nodo con al pi� un figlio			
			}	
	   }
	}
		
		//cancella un nodo con al piu' un figlio
		private void contraiNodo(NodoBinario u){		
			NodoBinario v = null; //figlio (unico) del rimosso
			if(u.sinistro != null) v = u.sinistro;
			else if(u.destro != null) v = u.destro;
			if(v == null) //rimosso e' una foglia, la rimuovo
			  pota(u);
			else{
				scambiaInfo(u,v); //rimpiazziamo il contenuto informativo del nodo con quello del figlio
				AlberoBinario albf = pota(v); //potiamo il sottoalbero radicato nel figlio e lo restituiamo
				//riattacchiamo i sottoalberi sin e des del figlio nel nodo
				innestaSin(u,albf.pota(v.sinistro)); 
				innestaDes(u,albf.pota(v.destro));
			}
		}	
	
	
	
	
	
	/**
	 * Ricerca del nodo con valore max della chiave
	 * nel sottoalbero radicato in u 
	 * @param u Nodo radice del sottoalbero
	 */
	public NodoBinario max(NodoBinario u){
		NodoBinario v = u;		
		while(v.destro != null) 
			v=v.destro;//mi sposto piu' a destra possibile
		return v;	
		
	}
	
	// ---- ESERCIZI ----
	
	/**
	 * Ricerca del predecessore di un elemento del dizionario.
	 * 
	 * @param k
	 * @return il record trovato
	 */
	public Object pred(Comparable k) {
		NodoBinario nodo = searchNodo(k,radice);
		if(nodo == null) return null;
		return pred(nodo).elem;
	}
	
	// Metodo ausiliario per la ricerca del predecessore
	private NodoBinario pred(NodoBinario u) {
		if(figlioSinistro(u) && sin(u) != null)
			return max(sin(u));
		while(padre(u) != null && sin(padre(u)) == u)
			u = padre(u);
		return padre(u);
	}
	
	/**
	 * Ricerca del nodo con valore min della chiave
	 * nel sottoalbero radicato in u 
	 * 
	 * @param u Nodo radice del sottoalbero
	 * @return il minimo
	 */
	public NodoBinario min(NodoBinario u){
		NodoBinario v = u;		
		while(v.sinistro != null) 
			v=v.sinistro;//mi sposto piu' a destra possibile
		return v;	
		
	}
	
	/**
	 * Ricerca del successore di un elemento del dizionario.
	 * 
	 * @param k
	 * @return il record trovato
	 */
	public Object succ(Comparable k) {
		NodoBinario nodo = searchNodo(k,radice);
		if(nodo == null) return null;
		return succ(nodo).elem;
	}
	
	// Metodo ausiliario per la ricerca del successore
	private NodoBinario succ(NodoBinario u) {
		if(figlioDestro(u) && des(u) != null)
			return min(des(u));
		while(padre(u) != null && des(padre(u)) == u)
			u = padre(u);
		return padre(u);
	}
	
	
	/**
	 * Ritorna l'albero intersezione tra l'albero dato e l'albero parametro.
	 * 
	 * @param altro
	 * @return
	 */
	public AlberoBR intersezione(AlberoBR altro) {
		AlberoBR risultato = new AlberoBR();
		if(radice == null || altro.radice() == null) return null;
		intersezione(radice, altro, risultato);
		return risultato;
	}
	
	// Metodo ausiliario per la determinazione dell'intersezione
	private void intersezione(NodoBinario v, AlberoBR altro, AlberoBR risultato) {
		if (v == null) return;
		Record rec = (Record) v.elem;
		if(altro.search(rec.key) != null)
			risultato.insert(rec.data, rec.key);
		intersezione(v.sinistro, altro, risultato);
		intersezione(v.destro, altro, risultato);
	}
	
}
