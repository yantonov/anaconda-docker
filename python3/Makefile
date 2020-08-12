help:
	@cat Makefile

DOCKER_FILE=Dockerfile
SRC?=$(shell pwd)

IMAGE=yantonov/anaconda3
TAG=2020.07
FQN_IMAGE="$(IMAGE):$(TAG)"

build:
	docker build \
		-t "$(FQN_IMAGE)" \
		-f "$(DOCKER_FILE)" .

ssh:
	docker run --rm -u 0 -t -i "$(FQN_IMAGE)" bash

stop:
	docker stop "$(shell docker ps -a --filter "ancestor=$(FQN_IMAGE)" --format '{{.ID}}' | head -n 1 || echo "")"

pull:
	docker pull "$(FQN_IMAGE)"

uninstall:
	docker image rm "$(FQN_IMAGE)"
