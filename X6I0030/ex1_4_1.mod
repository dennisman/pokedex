/* soit on met les créneaux de 0 a 11, soit on va devoir bidouiller les
indices des infirmieres qui travaillent au créneau j*/
#implicite
 #Déclaration des ensembles utilisés

	param tailleC; # nombre de creneaux
	set C := 1..tailleC; # ensemble des indices des creneaux
	
	param mdroite{C}; # coefficients des membres de droite

# Déclaration de variables non-négatives sous la forme
# d'un tableau de variables indicées sur les Creneaux
	
	var x{C} >= 0 integer;

# Fonction objectif minimizer le nombre d'infirmiere en tout

	minimize nbInf : sum{j in C} x[j];

# Contraintes

	s.t. NbMinParCren{i in C} :  x[i] + x[((i-2) mod 12) +1] + x[((i-4) mod 12)+1] + x[((i-5) mod 12) +1] >= mdroite[i];

# Résolution (qui est ajoutée en fin de fichier si on ne le précise pas)
	solve;

# Affichage des résultats
	display : x;	# affichage "standard" des variables
	display : 'z=',sum{j in C} x[j]; # affichage de la valeur optimale
	
# Des données peuvent être séparés de la modélisation, on parle alors de modélisation implicite

data;

	param tailleC := 12;



	param mdroite := 1 	35
	                 2 	40
	                 3	40
	                 4	35
	                 5	30
	                 6	30
	                 7	35
	                 8	30
	                 9	20
	                 10 15
	                 11	15
	                 12	15;

end;


