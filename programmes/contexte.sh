#!usr/bin/bash
#créer des fichiers contexte.txt à partir des fichier dumps-text de chaque langue

LISTE_FICHIER=$(ls ../dumps-text)

for FICHIER in $LISTE_FICHIER
do
	if [[ $FICHIER =~ FR.* ]]
	then
		contexte=$(cat ../dumps-text/${FICHIER}|grep -P -A 2 -B 2 "jeu.?\b|jeux-vidéo|jeu-vidéo")
	fi

	if [[ $FICHIER]] =~ CH.* ]]
	then
		contexte=$(cat ../dumps-text/${FICHIER}|grep -P -A 2 -B 2 "游戏")
	fi
	if [[ $FICHIER =~ EN.* ]]
	then
		contexte=$(cat ../dumps-text/${FICHIER}|grep -P -A 2 -B 2 "game|games")
	fi

	basename=$(basename ${FICHIER} .txt)
	echo "$contexte" > "../contextes/${basename}.txt"
done

echo "fin du programme"
