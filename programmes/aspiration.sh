#!usr/bin/bash

URLS=$1
langue=$2

if [[ $# -ne 2 ]];
then
	echo "On veut exactement deux arguments au script : une liste d'url au format .txt et un nom de langue"
	exit
fi

if [ ! -f $URLS ]
then
	echo "On attend un fichier, pas un dossier"
	exit
fi

lineno=1
while read -r URL
do
	data_brut=$(curl $URL)
	echo "$data_brut" > "../URLs/${langue}${lineno}.txt"
	lineno=$(expr $lineno + 1)
done < "$URLS"

