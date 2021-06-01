-include .env
-include .env.local
-include .env.$(APP_ENV)
-include .env.$(APP_ENV).local
export

COMPOSE_PROJECT_NAME := "$(APP_NAME)_$(APP_INSTANCE)"

SUDO := $(shell sh -c "if [ 0 != $EUID ]; then echo 'sudo'; fi")
KERNEL := $(shell sh -c "uname")

-include ./.make/docker
-include ./.make/git

## ----------------------------------------------------------
## Main
## ----------------------------------------------------------
.PHONY: install update start restart down

install:
	$(SUDO) sysctl -w vm.max_map_count=262144
	make docker/start
	$(SUDO) cp "$(PWD)/config/nginx/kibana.conf" "/etc/nginx/sites-enabled/kibana.conf"
	$(SUDO) cp "$(PWD)/config/nginx/elasticsearch.conf" "/etc/nginx/sites-enabled/elasticsearch.conf"
	$(SUDO) service nginx restart

update:
	make docker/down
	make git/update
	make docker/start

start:
	make docker/start

restart:
	make docker/restart

down:
	make docker/down
