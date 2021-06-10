# Variables
CONTAINER_NAME:=jrcichra/ssh-tunnel
GIT_COMMIT:=$(shell git rev-parse --short=8 HEAD)

.PHONY: help
.ONESHELL:

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

build: ## Build the container
	@echo "Building $(CONTAINER_NAME):$(GIT_COMMIT)"
	docker build -t $(CONTAINER_NAME):$(GIT_COMMIT) .

build-latest: ## Build the latest image
	@echo "Building $(CONTAINER_NAME):latest"
	docker build -t $(CONTAINER_NAME):latest .

push: ## Push the image
	@echo "Pushing $(CONTAINER_NAME):$(GIT_COMMIT)"
	docker push $(CONTAINER_NAME):$(GIT_COMMIT)

push-latest: ## Push the latest image
	@echo "Pushing $(CONTAINER_NAME):latest"
	docker push $(CONTAINER_NAME):latest