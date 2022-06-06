help:
	@cat Makefile

DOCKER_FILE=Dockerfile
SRC?=$(shell pwd)

IMAGE=yantonov/anaconda3
TAG=2022.05
FQN_IMAGE=$(IMAGE):$(TAG)
CONTAINER_NAME?=$(shell echo "$(IMAGE)" | tr '/' '_')

CONTAINER_SRC=/src

JUPITER_PORT=8888
EXPOSED_JUPITER_PORT?=8888

build:
	docker build \
		-t "$(FQN_IMAGE)" \
		-f "$(DOCKER_FILE)" .

notebook:
	docker run \
			--hostname localhost \
			-it \
			-p $(EXPOSED_JUPITER_PORT):$(JUPITER_PORT) \
			-v "$(SRC):$(CONTAINER_SRC)" \
			--name "$(CONTAINER_NAME)" \
			--rm \
			"$(FQN_IMAGE)" \
			"jupyter notebook \
			--notebook-dir=$(CONTAINER_SRC) \
			--ip=0.0.0.0 \
			--port=$(JUPITER_PORT) \
			--no-browser \
			--allow-root"

lab:
	docker run \
			--hostname localhost \
			-it \
			-p $(EXPOSED_JUPITER_PORT):$(JUPITER_PORT) \
			-v "$(SRC):$(CONTAINER_SRC)" \
			--name "$(CONTAINER_NAME)" \
			--rm \
			"$(FQN_IMAGE)" \
			"jupyter lab \
			--notebook-dir=$(CONTAINER_SRC) \
			--ip=0.0.0.0 \
			--port=$(JUPITER_PORT) \
			--no-browser \
			--allow-root"

ssh:
	docker run -it \
			--name "$(CONTAINER_NAME)" \
			--rm \
			"$(FQN_IMAGE)" \
			bash

stop:
	docker stop "$(CONTAINER_NAME)"

pull:
	docker pull "$(FQN_IMAGE)"

push:
	docker push "$(FQN_IMAGE)"

uninstall:
	docker image rm "$(FQN_IMAGE)"
