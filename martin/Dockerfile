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
