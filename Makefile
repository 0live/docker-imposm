DOCKER_COMPOSE = docker compose
IMPOSM_CONTAINER = imposm
OPENMAPTILES_IMPORT_CONTAINER = openmaptiles-import

# Commande build
build:
	$(DOCKER_COMPOSE) build

# Commande start
start:
	$(DOCKER_COMPOSE) up -d

import-openmaptiles:
	$(DOCKER_COMPOSE) --profile import up $(OPENMAPTILES_IMPORT_CONTAINER)

init-osm-db:
	$(DOCKER_COMPOSE) exec $(IMPOSM_CONTAINER) /srv/imposm/scripts/init_db.sh