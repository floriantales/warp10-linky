#!/bin/bash

# Def separateur
IFS=";"

# Boucle sur les lignes du CSV
while read f1 f2
do
#echo "Horodate       : heure de la relève des index (heure Paris)         : $f1"
#echo "Conso max jour : toujours "arrete quotidien"                        : $f2"

# Check Format Date & convert to gts
if [[ $f1 == ????-??-??T??:??:??+??:?? ]]
then
  f1=$(echo "$f1" | cut -d'+' -f1) # Cut UTC+02:00
  epoch_us=$(date -u -d "$f1" +%s%6N 2>/dev/null) # Convert date to epoch in microseconds
  echo "$epoch_us// linky.maxjour.watts{} $f2"
fi

done < $1
