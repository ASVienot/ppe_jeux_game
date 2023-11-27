#!usr/bin/bash
#programme qui prends 1 argument :
#1 = une liste d'urls en .txt. Le basename de l'argument doit être le code de la langue (FR, EN ou CH)


URLS=$1
langue=$(basename $URLS .txt)

#vérification nombre d'arguments = 1
if [[ $# -ne 1 ]];
then
	echo "On veut exactement un argument au script : une liste d'url au format .txt"
	exit
fi

#vérification argument1 est un fichier (pas un dossier)
if [ ! -f $URLS ]
then
	echo "On attend un fichier, pas un dossier"
	exit
fi

#Boucle d'extraction : pour chaque ligne (=chaque url de la liste) extrait le contenu brut et l'enregistre dans un fichier .txt dans le dossier ./URLs
lineno=1
while read -r URL
do
	data_brut=$(curl $URL)
	echo "$data_brut" > "../aspirations/${langue}${lineno}.html"
	lineno=$(expr $lineno + 1)
done < "$URLS"

echo "fin du programme"
