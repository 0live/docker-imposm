#!/bin/bash

# Vérifier si la variable d'environnement PBF_URLS est définie
if [ -z "$PBF_URLS" ]; then
  echo "Aucune URL spécifiée pour les fichiers PBF."
  exit 1
fi

# Convertir la chaîne d'URLs en tableau
IFS=',' read -r -a urls <<< "$PBF_URLS"

# Télécharger chaque fichier PBF dans /srv/imposm/data
for url in "${urls[@]}"; do
  echo "Téléchargement de $url..."
  wget "$url" -P /srv/imposm/data
done

echo "Téléchargement terminé."
