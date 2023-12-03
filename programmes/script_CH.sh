#!/usr/bin/bin/bash
#Prend en argument un fichier texte : une liste d'urls

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

    if [[ $reponse =~ "200" ]]
    then
        #aspirations :
        data_brut=$(curl -L $URL)
        echo "$data_brut" > "../aspirations/${langue}-${lineno}.html"
        page_aspiree=../aspirations/${langue}-${lineno}.html

        #fichiers dump text :
        contenu_textuel=$(lynx -dump -nolist ../aspirations/${langue}-${lineno}.html)
        echo "$contenu_textuel" > "../dumps-text/${langue}-${lineno}.txt"
        dump_texte=../dumps-text/${langue}-${lineno}.txt

        #récupération nombre occurences
		nb_occurrence=$(cat ../dumps-text/"${langue}-${lineno}.txt"|grep -P -i -o "游戏"|wc -l)

        #récupérer les contextes
        contexte=$(cat ../dumps-text/${langue}-${lineno}.txt|grep -P -i -w -C1 "游戏")
        echo "$contexte" > "../contextes/${langue}-${lineno}.txt"
        contextes=../contextes/${langue}-${lineno}.txt

        #ligne en html : lineno | URL (cliquable : <a href="urls"> texte à cliquer </a>) | reponse
        echo -e "		<tr>
                    <td><a href='$URL'>$URL</a></td>
                    <td>$reponse</td>
                    <td>$encodage</td>
                    <td>$nb_occurrence</td>
                    <td><a href="${page_aspiree}">CH-${lineno}</td>
                    <td><a href="${dump_texte}">CH-${lineno}</td>
                    <td><a href="${contextes}">CH-${lineno}</td>
		</tr>">>"../tableaux/${langue}.html"

        #incrément de la boucle
        lineno=$(expr $lineno + 1)

	else
        #compléter ligne tableaux
        echo -e "		<tr>
            <td><a href='$URL'>$URL</a></td>
            <td>$reponse</td>
            <td>$encodage</td>
            </tr>">>"../tableaux/${langue}.html"
    fi
done < "$URLS"

#fin des balises
echo -e "\t</tbody>\n</table>" >> "../tableaux/${langue}.html"

echo "fin du programme"
