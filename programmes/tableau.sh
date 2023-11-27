#!/usr/bin/env bash

URLS=$1
langue=$(basename $URLS .txt)

#vérification nombre d'arguments = 2
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

lineno=1
while read -r URL
do
	response=$(curl -s -L -w "%{http_code}" -o /dev/null $URL)
	encoding=$(curl -s -L -w "%{content_type}" -o /dev/null $URL | grep -P -o "charset=\S+" | cut -d"=" -f2 | tail -n 1)
	nb_occurrence=$(cat ../dumps-text/"${langue}${lineno}.txt"|grep -P "jeu.?-?\b"|wc -l)
	echo -e "$lineno\t$URL\t$response\t$encoding\t${langue}${lineno}_brut\t${langue}${lineno}_dumptxt\t${nb_occurrence}" >> "../tableaux/${langue}_tableau.txt"
	lineno=$(expr $lineno + 1)
done < "$URLS"
