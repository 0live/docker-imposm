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

import-sql:
	$(DOCKER_COMPOSE) run $(DC_OPTS) openmaptiles-tools sh -c 'import-sql' | \
    	awk -v s=": WARNING:" '1{print; fflush()} $$0~s{print "\n*** WARNING detected, aborting"; exit(1)}' | \
    	awk '1{print; fflush()} $$0~".*ERROR" {txt=$$0} END{ if(txt){print "\n*** ERROR detected, aborting:"; print txt; exit(1)} }'