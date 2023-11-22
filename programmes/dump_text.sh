#!usr/bin/bash
#programme qui prends 2 arguments :
#1 = une liste d'urls en .txt
#2 = un nom de langue qu'il va renvoyer comme titre des outputs (par exemple FR, EN ou CH)

URLS=$1
langue=$2

#vérification nombre d'arguments = 2
if [[ $# -ne 2 ]];
then
	echo "On veut exactement deux arguments au script : une liste d'url au format .txt et un nom de langue"
	exit
fi

#vérification argument1 est un fichier (pas un dossier)
if [ ! -f $URLS ]
then
	echo "On attend un fichier, pas un dossier"
	exit
fi

#Boucle d'extraction : pour chaque ligne (=chaque url de la liste) extrait le contenu textuel et l'enregistre dans un fichier .txt dans le dossier ./URLs
lineno=1
while read -r URL
do
	contenu_textuel=$(lynx -dump -nolist $URL)
	echo "$contenu_textuel" > "../dumps-text/${langue}${lineno}.txt"
	lineno=$(expr $lineno + 1)
done < "$URLS"

