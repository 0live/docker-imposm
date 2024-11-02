# Utiliser Ubuntu comme base
FROM ubuntu:latest

# Déclarer les arguments nécessaires pour l'environnement
ARG PBF_URLS
ARG POSTGRES_USER
ARG POSTGRES_PASSWORD
ARG POSTGRES_DB
ARG POSTGRES_HOST
ARG REPLICATION_URL
ARG REPLICATION_INTERVAL

# Installer wget, envsubst et les dépendances nécessaires
RUN apt-get update && apt-get install -y bash && apt-get install -y wget gettext && apt-get clean

# Installer Imposm
RUN wget https://github.com/omniscale/imposm3/releases/download/v0.14.0/imposm-0.14.0-linux-x86-64.tar.gz -O /tmp/imposm.tar.gz && \
    tar -xzf /tmp/imposm.tar.gz -C /usr/local/bin --strip-components=1 && \
    rm /tmp/imposm.tar.gz

# Créer le répertoire de données et config
RUN mkdir -p /srv/imposm/data /srv/imposm/config /srv/imposm/logs /srv/imposm/imposm_cache /srv/imposm/imposm_diff /srv/imposm/scripts

# Copier les fichiers nécessaires dans l'image
COPY /scripts/*.sh /srv/imposm/scripts/
COPY /files/*.json /files/*.yaml /files/*.geojson /srv/imposm/config/
RUN chmod +x /srv/imposm/scripts/*.sh

# Remplacer les placeholders dans config.template.json et créer config.json, puis supprimer le template
RUN envsubst < /srv/imposm/config/config.template.json > /srv/imposm/config/config.json && \
    rm /srv/imposm/config/config.template.json

# Télécharger les fichiers PBF
RUN PBF_URLS=$PBF_URLS /srv/imposm/scripts/download_pbf.sh

# Commande par défaut pour garder le conteneur actif
CMD ["tail", "-f", "/dev/null"]
