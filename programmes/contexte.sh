#!usr/bin/bash

LISTE_FICHIER=$(ls ../dumps-text)

for FICHIER in $LISTE_FICHIER
do
	contexte=$(cat ../dumps-text/${FICHIER}|grep -P -A 2 -B 2 "jeu.?\b|jeux-vidéo|jeu-vidéo")
	basename=$(basename ${FICHIER} .html)
	echo "$contexte" > "../contextes/${basename}.txt"
done

echo "fin du programme"
