# PPE1 TRAVAIL DE GROUPE
# Siman Chen, Pauline Degez, Alix Sirven-Viénot


## 1er séance travail de groupe

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


 
EXERCICES SEANCE 9

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


