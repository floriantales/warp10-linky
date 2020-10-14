#!/bin/bash

# Def separateur
IFS=";"

# Boucle sur les lignes du CSV
while read f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 f12 f13 f14 f15 f16 f17
do
#echo "Horodate       : heure de la relève des index (heure Paris)         : $f1"
#echo "Type de releve : toujours "arrete quotidien"                        : $f2"
#echo "EAS F1         : poste 1 grille Fournisseur                         : $f3"
#echo "EAS F2         : poste 2 grille Fournisseur                         : $f4"
#echo "EAS F3         : poste 3 grille Fournisseur                         : $f5"
#echo "EAS F3         : poste 4 grille Fournisseur                         : $f6"
#echo "EAS F3         : poste 5 grille Fournisseur                         : $f7"
#echo "EAS F3         : poste 6 grille Fournisseur                         : $f8"
#echo "EAS F3         : poste 7 grille Fournisseur                         : $f9"
#echo "EAS F3         : poste 8 grille Fournisseur                         : $f10"
#echo "EAS F3         : poste 9 grille Fournisseur                         : $f11"
#echo "EAS F10        : poste 9 grille Fournisseur                         : $f12"
#echo "EAS D1         : poste 1 grille Distributeur                        : $f13"
#echo "EAS D2         : poste 2 grille Distributeur                        : $f14"
#echo "EAS D3         : poste 3 grille Distributeur                        : $f15"
#echo "EAS D4         : poste 4 grille Distributeur                        : $f16"
#echo "EAS T          : index totalisateur (energie produite et consommee) : $f17"

# Check Format Date & convert to gts
if [[ $f1 == ????-??-??T??:??:??+??:?? ]]
then
  f1=$(echo "$f1" | cut -d'+' -f1) # Cut UTC+02:00
  epoch_us=$(date -u -d "$f1" +%s%6N 2>/dev/null) # Convert date to epoch in microseconds
  echo "$epoch_us// linky.consommation.wh{} $f17"
fi

done < $1
