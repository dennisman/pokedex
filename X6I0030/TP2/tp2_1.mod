

# Donnée

	param nbInc;
	set S := 1..nbInc; # index des inconnues

	param nbCont;
	set indCont := 1..nbCont;
	
	set matCreuse within indCont cross S; # double-indice des inconnues	et contraintes 
	#ordre ligne puis colonne

	param obj{S}; # Vecteur des coefficients de la fonction objectif 

	param mdroite{indCont}; # Vecteur des membres de droite des contraintes (indicÃ© sur les salle)


# DÃ©claration d'un tableau de variables binaires
	
	var x{S} binary;	

# Fonction objectif

	maximize fonctionb : sum{j in S} obj[j]*x[j];

# Contraintes

	s.t. Cont{i in indCont} : sum{(i,j) in matCreuse} x[j] <= mdroite[i]; 

# Résolution

	solve;

# Affichage des résultats

	display : x;	# affichage "standard" des variables
	display{j in S : x[j] = 1} : j; # affichage plus lisible  
	display : "objectif : ", sum{j in S} obj[j]*x[j];



data;

	param nbInc := 9;
	param nbCont := 11;

	set matCreuse := (1,*) 1 5 (2,*) 2 5 (3,*) 3 5 (4,*) 3 4
					 (5,*) 2 7 (6,*) 5 7 (7,*) 5 4 (8,*) 6 7
					 (9,*) 6 8 (10,*) 8 4 (11,*) 5 9;
					 

	param obj :=
	1 1
	2 3
	3 7
	4 3
	5 12
	6 4
	7 9
	8 4
	9 3;	

	param mdroite default 1;


end;
