DOCKER_COMPOSE = docker compose
IMPOSM_CONTAINER = imposm

# Commande build
build:
	$(DOCKER_COMPOSE) build

# Commande start
start:
	$(DOCKER_COMPOSE) up -d

init-osm-db:
	$(DOCKER_COMPOSE) exec $(IMPOSM_CONTAINER) /srv/imposm/scripts/init_db.sh