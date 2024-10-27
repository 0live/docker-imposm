# /home/olivier/dev/docker-imposm/imposm/Dockerfile
FROM ubuntu:latest

# Déclarer l'argument pour PBF_URLS
ARG PBF_URLS

# Installer wget et les dépendances nécessaires
RUN apt-get update && apt-get install -y wget && apt-get clean

# Installer Imposm
RUN wget https://github.com/omniscale/imposm3/releases/download/v0.14.0/imposm-0.14.0-linux-x86-64.tar.gz -O /tmp/imposm.tar.gz && \
    tar -xzf /tmp/imposm.tar.gz -C /usr/local/bin --strip-components=1 && \
    rm /tmp/imposm.tar.gz

# Créer le répertoire de données
RUN mkdir -p /srv/imposm/data /srv/imposm/config /srv/imposm/logs

# Copier le fichier clip.geojson dans l'image
COPY clip.geojson /srv/imposm/data/clip.geojson

# Ajouter un script pour télécharger les fichiers PBF
COPY download_pbf.sh /usr/local/bin/download_pbf.sh
RUN chmod +x /usr/local/bin/download_pbf.sh

# Télécharger les fichiers PBF avec l'argument
RUN PBF_URLS=$PBF_URLS /usr/local/bin/download_pbf.sh

# Commande par défaut pour garder le conteneur actif
CMD ["tail", "-f", "/dev/null"]
