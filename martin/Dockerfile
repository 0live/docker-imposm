# Étape 1 : Construire Martin à partir des sources avec Rust
FROM rust:slim AS builder

# Installer les dépendances nécessaires pour la compilation
RUN apt-get update && apt-get install -y \
    curl \
    libssl-dev \
    pkg-config \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Installer Martin via Cargo
RUN cargo install martin

# Étape 2 : Créer une image légère pour exécuter Martin
FROM debian:bookworm-slim

# Installer gettext-base (pour envsubst) et autres dépendances nécessaires pour l'exécution
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    gettext-base \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Définir le répertoire de travail
WORKDIR /app

# Copier le fichier MBTiles dans l'image
COPY tiles.mbtiles /app/tiles.mbtiles

# Copier le fichier template du fichier de configuration
COPY martin_config.yaml.template /app/martin_config.yaml.template

# Copier le binaire Martin depuis l'étape de compilation
COPY --from=builder /usr/local/cargo/bin/martin /usr/local/bin/martin

# Remplacer les variables d'environnement dans le fichier de configuration au build
RUN envsubst < /app/martin_config.yaml.template > /app/martin_config.yaml

# Exécuter Martin en utilisant le fichier de configuration généré
# CMD exec /usr/local/bin/martin
# CMD ["martin", "tiles.mbtiles"]
CMD ["martin", "--config", "/app/martin_config.yaml"]