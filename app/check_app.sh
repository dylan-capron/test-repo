#!/bin/bash
echo "Début des vérifications…"
if [ -f app/index.html ]; then
  echo "Le fichier index.html est présent. Test réussi."
  echo "Fin des vérifications."
  exit 0
else
  echo "Le fichier index.html est absent !"
  echo "Fin des vérifications."
  exit 1
fi
