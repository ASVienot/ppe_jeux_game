#!usr/bin/bash

DOSSIER=$1
LANGUE=$2

LISTE_FICHIER=$(ls $DOSSIER)
BASED=$(basename ${DOSSIER})

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

echo -e "<lang=\"$LANGUE\">" > "../itrameur/${BASED}-${LANGUE}.txt"

lineno=1
for FICHIER in $LISTE_FICHIER
do
	BASEF=$(basename ${FICHIER} .txt)

	if [[ $BASEF =~ $LANGUE\- ]]
	then
		contenu=$(cat $DOSSIER/$FICHIER | sed -e 's/&/&amp/g ; s/>/&gt/g ; s/</&lt/g')
		echo -e "\n<page=\"${LANGUE}-${lineno}\">\n<text>\n${contenu}\n</text>\n</page> §\n" >> "../itrameur/${BASED}-${LANGUE}.txt"

	lineno=$(expr $lineno + 1)
	fi

done

echo -e "</lang>" >> "../itrameur/${BASED}-${LANGUE}.txt"
echo "fin du programme"

