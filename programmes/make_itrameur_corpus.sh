#!usr/bin/bash

DOSSIER=$1
LANGUE=$2

LISTE_FICHIER=$(ls $DOSSIER)

if [ ! -d $DOSSIER ]
then
	echo "il nous faut un dossier en argument 1 (un dossier contenant les dump textuels)"
	exit
fi

if [ $# -ne 2 ]
then
	echo "ce script a besoin de deux arguments : un dossier et un code langue"
	exit
fi

lineno=1
for FICHIER in $LISTE_FICHIER
do
	BASEF=$(basename ${FICHIER} .txt)
	BASED=$(basename ${DOSSIER})

	if [[ $BASEF =~ $LANGUE\- ]]
	then
		contenu=$(cat $DOSSIER/$FICHIER | sed -e 's/&/&amp/g ; s/>/&gt/g ; s/</&lt/g')
		echo -e "<lang=$LANGUE>\n<page=${LANGUE}-${lineno}>\n<text>${contenu}</text>\n</page> §" >> "../itrameur/${BASED}-${LANGUE}.txt"

	lineno=$(expr $lineno + 1)
	fi

done

echo "fin du programme"

