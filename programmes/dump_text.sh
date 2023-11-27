#!usr/bin/bash
#transforme les fichiers html d'un dossier en fichiers txt dans le dossier dumps-text

LISTE_FICHIER=$(ls ../aspirations)

for FICHIER in $LISTE_FICHIER
do
	contenu_textuel=$(lynx -dump -nolist ../aspirations/$FICHIER)
	basename=$(basename ${FICHIER} .html)
	echo "$contenu_textuel" > "../dumps-text/${basename}.txt"
done

echo "fin du programme"
