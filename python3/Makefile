help:
	@cat Makefile

DOCKER_FILE=Dockerfile
SRC?=$(shell pwd)

IMAGE=yantonov/anaconda3
TAG=2023.09
FQN_IMAGE=$(IMAGE):$(TAG)
CONTAINER_NAME?=$(shell echo "$(IMAGE)" | tr '/' '_')

CONTAINER_SRC=/src

JUPITER_PORT=8888
EXPOSED_JUPITER_PORT?=8888

EXECUTABLE=$(shell command -v docker >> /dev/null 2>&1 && echo "docker" || echo "podman")

build:
	$(EXECUTABLE)  build \
		-t "$(FQN_IMAGE)" \
		-f "$(DOCKER_FILE)" .

notebook:
	$(EXECUTABLE)  run \
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
	$(EXECUTABLE)  run \
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
	$(EXECUTABLE)  run -it \
			--name "$(CONTAINER_NAME)" \
			--rm \
			"$(FQN_IMAGE)" \
			bash

stop:
	$(EXECUTABLE)  stop "$(CONTAINER_NAME)"

pull:
	$(EXECUTABLE)  pull "$(FQN_IMAGE)"

push:
	$(EXECUTABLE)  push "$(FQN_IMAGE)"

uninstall:
	$(EXECUTABLE)  image rm "$(FQN_IMAGE)"
