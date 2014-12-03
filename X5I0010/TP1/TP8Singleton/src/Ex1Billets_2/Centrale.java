package Ex1Billets_2;

import java.util.Vector;

public class Centrale {
	static private volatile Centrale instance;
	private Vector<Billet> billets;
	private Billeterie fabrique;

	
	private Centrale(Billeterie f) {

		fabrique = f;
		billets = new Vector<Billet>();
		
	}
	
	public static Centrale getInstance(Billeterie f){
		if(instance == null){
			synchronized (Centrale.class) {
				if(instance == null){
					instance = new Centrale(f);
				}else{
					if(f.getClass() != instance.fabrique.getClass()){
						instance.fabrique = f;
					}
				}
			}
			
		}else{
			if(f.getClass() != instance.fabrique.getClass()){
				instance.fabrique = f;
			}
		}
		return instance;
	}
	
	public void addBillet(){

		Billet b = fabrique.factoryMethod();
		billets.add(b);
	}
	
	public Vector<Billet> getBillets(){
		return billets;
	}

}
