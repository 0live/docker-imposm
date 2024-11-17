FROM debian:bookworm-slim

# Installer les dépendances nécessaires
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    tar \
    ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Définir le répertoire de travail
WORKDIR /app

COPY tiles.mbtiles /app/tiles.mbtiles

# Télécharger et extraire le binaire de Martin
RUN curl -L -O https://github.com/maplibre/martin/releases/latest/download/martin-x86_64-unknown-linux-gnu.tar.gz && \
    tar -xzf martin-x86_64-unknown-linux-gnu.tar.gz && \
    chmod +x ./martin && \
    rm martin-x86_64-unknown-linux-gnu.tar.gz

# Exposer le port utilisé par Martin
EXPOSE 3000

# Commande de démarrage
CMD ["./martin", "tiles.mbtiles"]


# Utiliser l'image officielle de Martin comme base
# FROM ghcr.io/maplibre/martin:latest

# # Définir le répertoire de travail
# WORKDIR /app

# # Copier les fichiers de configuration si présents (optionnel)
# # Placez votre fichier config.yaml dans ./martin/config dans votre projet
# COPY config/config.yaml /config/config.yaml
# COPY tiles.mbtiles /app/tiles.mbtiles

# # Commande par défaut pour lancer Martin
# CMD ["--config", "/config/config.yaml"]
# # CMD ["./martin", "tiles.mbtiles"]