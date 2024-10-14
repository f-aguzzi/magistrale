package alberoStringhe;

import java.util.Iterator;
import java.util.TreeSet;


public class AlberoStringhe extends TreeSet<String> implements InsiemeStringhe {

	private static final long serialVersionUID = -7483013507545010014L;

	@Override
	public void insert(String s) {
		super.add(s);
	}

	@Override
	public void delete(String s) {
		super.remove(s);
	}

	@Override
	public boolean contains(String s) {
		return super.contains(s);
	}

	@Override
	public String concat() {
		Iterator<String> iter = super.iterator();
		StringBuffer buf = new StringBuffer();
		
		while(iter.hasNext()) {
			buf.append(iter.next());
		}
		return buf.toString();
	}
	
	@Override
	public String toString() {
		Iterator<String> iter = super.iterator();
		StringBuffer buf = new StringBuffer();
		
		while(iter.hasNext()) {
			buf.append(iter.next());
			if (iter.hasNext())
				buf.append(", ");
		}
		return buf.toString();
	}

}