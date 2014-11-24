package Ex2Banque;

public class Factory {
	/*protected Lettre lettre;
	public Factory(String s) {
		lettre = factoryMethod(s);
	}*/
	
	public Factory(){}
	
	public Lettre factoryMethod(String type){
		if(type == "visa"){
			return new LettreVisa("assurance annulation ");
		}else if(type == "american"){
			return new LettreAmercianExpress("reduction loc voiture ");
		}else if(type == "mastercad"){
			return new LettreMastercard("assistance juridique a l etranger ");
		}else{
			return null;
		}
	}

}