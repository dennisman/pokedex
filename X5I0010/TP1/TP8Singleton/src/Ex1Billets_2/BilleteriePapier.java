package Ex1Billets_2;

public class BilleteriePapier implements Billeterie {
	private int numero;
	public BilleteriePapier() {
		numero = 0;
	}

	@Override
	public Billet factoryMethod() {
		numero++;
		return new BilletPapier(numero);
		
	}
	

}
