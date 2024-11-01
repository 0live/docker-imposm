#!/bin/sh

# Chemin vers le dossier contenant les fichiers .pbf
DATA_DIR="/srv/imposm/data"
CONFIG_FILE="/srv/imposm/config/config.json"
CLIP_FILE="$DATA_DIR/clip.geojson"

# Initialiser une variable pour déterminer le premier fichier
first_file=true

# Boucle sur chaque fichier .pbf dans le dossier
for file in "$DATA_DIR"/*.pbf; do
  if [ "$first_file" = true ]; then
    # Exécuter la commande pour le premier fichier
    imposm import -config "$CONFIG_FILE" -read "$file" -write -limitto "$CLIP_FILE" -diff -optimize
    first_file=false
  else
    # Exécuter la commande pour les fichiers suivants
    imposm import -appendcache -config "$CONFIG_FILE" -read "$file" -write -limitto "$CLIP_FILE" -diff -optimize
  fi
done

# Exécuter la commande finale après tous les fichiers
imposm import -config "$CONFIG_FILE" -deployproduction
