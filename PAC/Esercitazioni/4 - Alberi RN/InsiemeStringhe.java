package alberoStringhe;

public interface InsiemeStringhe {
	/**
	 * Metodo che permette di inserire ordinatamente una stringa nell'insieme
	 * rispettando l'ordinamento lessicografico.
	 * 
	 * @param s
	 */
	public void insert(String s);
	
	/**
	 * Elimina la stinga passata per argomento, se presente nell'insieme.
	 * 
	 * @param s
	 */
	public void delete(String s);
	
	/**
	 * Controlla la presenza nell'insieme della stringa passata per argomento.
	 * 
	 * @param s
	 * @return se la stringa esiste nell'albero
	 */
	public boolean contains(String s);
	
	/**
	 * Restituisce una stringa ottenuta per concatenazione, in ordine
	 * alfabetico, di tutte le stringhe memorizzate nell'insieme.
	 * 
	 * @return la stringa concatenata
	 */
	public String concat();
	
}
