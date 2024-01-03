#!usr/bin/bash
#créer des fichiers concordances.txt à partir des fichier contextes pour chaque langue


grep -i -o -P "(\w+\W){0,5}(jeux?)(\W\w+){0,5}" ../contextes/FR1.txt | sed 's/\(jeu\)/\t\1\t/g'
grep -i -o -P "(\w+\W){0,5}(jeux?)(\W+\w+){0,5}" ./contextes/FR1.txt | sed 's/\(jeux?\)/\t\1\t/g'

echo "fin du programme"

grep -E -o '(\w+\W+){0,5}(JEU)(\W+\w+){0,5}'  ../itrameur/contextes-FR.txt| sed -E 's/\(jeux?\)/\t/g'

grep -E -o '(\w+\W+){0,5}(JEU)(\W+\w+){0,5}'  ../itrameur/contextes-FR.txt| sed -E 's/\(JEU\)/\t/g'
