# PPE1 TRAVAIL DE GROUPE
# Siman Chen, Pauline Degez, Alix Sirven-Viénot


## 1er séance travail de groupe
-auteur = Alix-

- préparer arborescence dans le git
.
├── aspirations
│   └── aspi.gitkeep
├── concordances
│   └── con.gitkeep
├── contextes
│   └── contextes.gitkeep
├── dumps-text
│   └── dump.gitkeep
├── journal.md
├── programmes
│   ├── freq_bigramme.sh
│   └── programmes.gitkeep
├── README.md
├── tableaux
│   └── table.gitkeep
└── URLs
    └── URL.gitkeep

- préparer script pour fichier aspirations (commandes curl)

- créer le dossier dump -> Lynx -dump <URL>  >  <fichier.txt>
passer par nos fichiers aspirations et utiliser le man pour trouver commandes qui prend en compte l'encodage

- ajouter les liens dans deux nouvelles colones dans le tableau

- compter les occurences du mot

- contexte

- concordances


### Folders:
aspirations = pages brutes HTML
dumps = contenu textuel sans HTML
contextes =
programmes =
tableaux =
URLs = 1 fichier par langue, nommé : Langue (Fr, En, Ch) + numéro de fichier
Dans le fichier URL 3 fichiers de travail des URLs, un par langue (Fr_URL, EN_URL, CH_URL)

fichiers .gitkeep = fichiers vides permettant de créer des dossiers vide dans git

basename = enlève les suffixes ou préfixes d'un nom de fichier
ex fr.tkx -> $basename URLs/fr.txt .txt => fr


 
### EXERCICES SEANCE 9
- auteur = Pauline -

1 à 4 faits.

Bonne nouvelle : pas besoin de passer par les codes unicode pour grep les caractère chinois.
urlsFR = 70, quelques erreurs serveur
urlsEN = 50, quelques erreurs serveur
urlsCD = une dizaine, en cours de collection

Commandes utiles :
basename .txt	donne le nom du fichier sans l'extension (.txt .html...)
grep -A NB	donne le grep + NB lignes après
grep -B NB	donne le grep + NB lignes après

Etat des scripts :

*Aspiration :
	-> 1 argument (fichier .txt, liste d'urls)
	-> input : liste url .txt
	-> output : un fichier .html par url dans le dossier aspiration
*dump_text : 
	-> pas d'argument
	-> input : tous les fichiers .html du dossier aspiration
	-> output : fichiers .txt (sans les balises html) dans le dossier dumps-text
*contexte :
	-> pas d'argument
	-> input : tous les fichiers .txt du dossier dumps-text
	-> output : fichier .txt dans le dossier contexte. 2 lignes avant le mot, 2 lignes après. Séparation entre deux contextes = --
*tableau :
	-> 1 argument (fichier .txt, liste d'urls)
	-> input liste url .txt
	-> output fichier html (tableau : NB/url/réponse/encodage/NB mot/lien html/lien dump/lien contexte)

Concordancier
-> comment faire pour les mots qui apparaissent plusieurs fois en en moins de 2 lignes ?


## Séance 10 
- auteur = Alix -

chemin relatif ou chemin absolu de la github page 
lien absolu un peu étrange besoin de bien vérifier 

nos scripts doivent être lancés depuis le dossier programmes 
ATTENTION ../ partout 

iTrameur: 
analyse automatique, statistique et documentaire de text 
Trouver une question 
ressemble au XML 
Mais pas de racine unique 
ex: <lang ="fr">
<page="fr-1">
<text> contenu </text>
- calcul des spécificités (appliqué aux coocurents)
quantifier les unités dans les textes 
loi hypergéométrique = loi normale décalée 
spécificité donné en log10 
Correspond au nbr de 0 aprés la virgule et avant le premier chiffre
ex: log0,1= 1 / log 0,01 = 2 
+ c'est haut + c'est utilisé dans le corpus 
+ c'est bas 

Pour iTrameur: 
sans expression régulière mais peut les transformer en /jeu/ tout au singulier 


## Exos iTrammeur S10 
- auteur= Alix, Pauline, Siman -

- dossier créé pour l'annalyse iTrammeur
- script iTrammeur 
	- 2 arguments (../dossier en question; LANGUE)
	- sed multiple = sed -e 's/a/b/g ; s/b/d/g'
	- choisi de remplacer les & les > et les <
	- /!\ -F erreur 
- tokenisation pour le chinois ajoutée au niveau de la création des fichiers dumps 
- ouverture des fichiers contextes sur itrameur et exploration basique (concordances, nuages de points, sections etc)

## Séance 11 

correction des exos
- pas forcément besoin du ls 
- § symbole de paragraphe 
- la commande `meld` = comparaison de fichiers 
- page dédié aux restulats de l'annalyse dan sun fichier HTML
- Quel python commande `wich`
- Lancer l'environement `source demo_venv/bin/activate`
- utiliser pip dans les environements 
- prétraitement des corpus pour jeux/jeu/jeux-/jeu-/...
- script des profs coocurents.py : 
	sur chaque ligne 1 item (mot ou groupe genre jeux-vidéo)
	recrée le tableau des coocurents 
	quand besoin d'expressions régulières/insensibilité à la case 
	aide script pour le manuel du script = nom_script -help 
	trier par ordre de spécificité 
	`-N nb` (seulement nb ligne)
	`-i` = insensible à la case 
	`target "jeux?-?.*"` autres options `--match-mod regex` = expression régulière 
	`-t` -> résultats proches de iTrameur (spécificités de comptes =/=)
	Peut mettre fr-* et il roule sur tous les fichiers 
- jeu/jeu-vidéo ? -> vidéo comme coocurent ? 
- wordcloud = création de nuage de mots  
- `wordcloud_cli --text ../ppe_videogame/dumps-text/FR-1.txt --scale 3 --imagefile image.png`
	`-- markfile` fichier ou le motif sera noir sur un fond blanc // le nuage aura la forme du nuage
	`--background [white]` -> plus lisible 
	`--contour_colot [black]` `contour_width [nb]` -> contour de la forme 
	POUR CH: 
	option `--fontfile [path]` trouver les fonts déjà installé 
	`/usr/share/fonts/truetype/arphic X /arphic X .ttf`
	`/usr/share/fonts/truetype/[nom de police]/[fichier de la police].ttf`
	`ls /usr/share/fonts`



## S 12 
alix 
- archiver le dépot du git (attention à la date)
	normalement n'affecte pas le site (envoyer mail objet au secours)
- A RENDRE LE 7 JANVIER 
si le git est archiver le 8 c'est pas grave mais si c'est le 15 pas ouf 
- Si lien ne marche pas 0 à cette partie 
Dans le tableau 
- attention aux 0 / ne pas faire un fichier pour les liens qui ne marchent pas 
-  running 
- Siman n'apparait pas en tant que collaboratrice mais est dans les commit 
problème de l'année dernière envoyer un mail au prof 
- on a mis les créer les fichier pour itrameur 
- sur itrameur le cadre de CH ne marche pas  





## TO DO
- [X] script contexte par langue DONE 
- [ ] grep "jeux" 
- [ ] prétraitement de jeux/jeu // game/games avec script des profs coocurents.py 
- [X] rajouter boucle dans dump éviter erreurs 404 DONE
test si $response == "200"
```
{ if [$response == "200"]
then 
	lynx -dump -nolist ./aspirations/${langue}-${lineno}.html > ./dump...
fi }
```
- [ ] monter le site web 
	- à la racine 
- [X] grep -c à la place de |wc // ne pas utiliser -c qui compte les lignes et non les occurences
- [X] -i pour ne pas prendre en compte les cases -o pour les mots 
- [X] nbr occurences vérifier bien 0 
- [X] création dump dans la boucle pour que les fichiers ne soient pas créer pour les urls vides 
et peut mettre `$dump` et $nbroccurences à 0 pour que ce ne soit pas remplacer par la valeur précédente DONE
- [X] grep -C suivi du nombre de ligne = contexte de l'occurence 
- [ ] Concordancier à améliorer 
accent considéré comme _ avec \-Wsegmentation
- [ ] prétraitement (script dump) pour jeux
- [ ] hypothése choix de mot 
- [ ] infirmer/affirmer not hypothèses dans pages résultats 
- [ ] iconv en UTF-8 pour Fr et Ch 
- [ ] lynx - assume_charset pour iconv 
- [ ] nuage de mot 

- [ ] vérifier que chaque lien marche 
- [ ] chacun doit avoir commit au minimum une fois 
- [ ] mail au prof pour que Siman soit collaboratrice (pb d'identification) // mettre capture d'écran des commits 

