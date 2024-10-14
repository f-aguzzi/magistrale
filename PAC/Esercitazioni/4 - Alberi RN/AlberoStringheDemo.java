package alberoStringhe;

public class AlberoStringheDemo {

	public static void main(String[] args) {
		InsiemeStringhe a = new AlberoStringhe();
		
		a.insert("ZZZZZZ");
		a.insert("Ciao Mondo!");
		a.insert("AAAAA");
		a.insert("BBBBB");
		
		// Contenimento
		System.out.println("Contenuto inserito ordinatamente: " + a.toString());
		System.out.println("Cerchiamo se contiene AAAAA (sì): " + a.contains("AAAAA"));
		System.out.println("Cerchiamo se contiene CCCCC (no): " + a.contains("CCCCC"));
		
		// Rimozione
		System.out.println("\nPrima di rimuovere BBBBB: " + a.toString());
		a.delete("BBBBB");
		System.out.println("Dopo aver rimosso BBBBB: " + a.toString());
		
		// Concatenazione
		System.out.println("\nContenuto concatenato dell'intero albero: " + a.concat());
	}

}
