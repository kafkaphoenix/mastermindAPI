SHELL=/bin/bash -e -o pipefail
PROJECT ?= mastermind
PROJECT_VERSION ?= local
COMPOSE_FILE=docker/docker-compose.yml
GID ?= $(shell id -g)
UID ?= $(shell id -u)
DC=docker-compose -p ${PROJECT} -f ${COMPOSE_FILE}
DOCKERFILE=docker/Dockerfile

# export environment variables required by our docker-compose files
export PROJECT
export PROJECT_VERSION
export UID
export GID


.DEFAULT_GOAL := help
include makefiles/help.mk
include makefiles/database.mk
include makefiles/development.mk
include makefiles/tests.mk
