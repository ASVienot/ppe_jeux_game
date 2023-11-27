#!/usr/bin/bin/bash

URLS=$1
langue=$(basename $URLS .txt)

#vérification nombre d'arguments = 1
if [[ $# -ne 1 ]];
then
	echo "On veut exactement un argument au script : une liste d'url au format .txt"
	exit
fi

#vérification argument est un fichier (pas un dossier)
if [ ! -f $URLS ]
then
	echo "On attend un fichier, pas un dossier"
	exit
fi

#ouverture de la table, headers et ouverture du corps du tableau
echo -e "<table>
	<thead>
		<tr>
			<th>numero url</th>
			<th>url</th>
			<th>reponse</th>
			<th>encodage</th>
			<th>nombre occurrence</th>
			<th>page aspiree</th>
			<th>dump textuel</th>
			<th>contextes</th>
		</tr>
	</thead>
	<tbody>" > "../tableaux/${langue}.html"

#boucle pour remplir les lignes du tableau avec balises
lineno=1
while read -r URL
do
	#récupération réponse serveur
	reponse=$(curl -I -s -L -w "%{http_code}" -o /dev/null $URL)

	#récupération encodage
	encodage=$(curl -I -s -L -w "%{content_type}" -o /dev/null $URL | grep -P -o "charset=\S+" | cut -d = -f 2)

	#récupération nombre occurences
	if [[ $URLS =~ FR.* ]]
	then
		nb_occurrence=$(cat ../dumps-text/"${langue}${lineno}.txt"|grep -P "jeu.?-?\b"|wc -l)
	fi

	if [[ $URLS =~ EN.* ]]
	then
		nb_occurrence=$(cat ../dumps-text/"${langue}${lineno}.txt"|grep -P "game|games"|wc -l)
	fi

	if [[ $URLS =~ CH.* ]]
	then
		nb_occurrence=$(cat ../dumps-text/"${langue}${lineno}.txt"|grep -P "游戏"|wc -l)
	fi

	page_aspiree=../aspirations/${langue}${lineno}.html
	dump_texte=../dumps-text/${langue}${lineno}.txt
	contextes=../contextes/${langue}${lineno}.txt

	#ligne en html : lineno | URL (cliquable : <a href="urls"> texte à cliquer </a>) | reponse
	echo -e "		<tr>
				<td>$lineno</td>
				<td><a href='$URL'>$URL</a></td>
				<td>$reponse</td>
				<td>$encodage</td>
				<td>$nb_occurrence</td>
				<td><a href="${page_aspiree}">lien_aspiration</td>
				<td><a href="${dump_texte}">lien dump textuel</td>
				<td><a href="${contextes}">lien contextes</td>
		</tr>">>"../tableaux/${langue}.html"

	#incrément boucle
	lineno=$(expr $lineno + 1)
done < "$URLS"

#fin des balises
echo -e "\t</tbody>\n</table>" >> "../tableaux/${langue}.html"

echo "fin du programme"
