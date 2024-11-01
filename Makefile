# Variables pour docker-compose et conteneur imposm
DOCKER_COMPOSE = docker compose
IMPOSM_CONTAINER = imposm  # Corrigez le nom du service ici

# Commande build
build:
	$(DOCKER_COMPOSE) build

# Commande start
start:
	$(DOCKER_COMPOSE) up -d

init-osm-db:
	$(DOCKER_COMPOSE) exec $(IMPOSM_CONTAINER) /srv/imposm/scripts/init_db.sh