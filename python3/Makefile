help:
	@cat Makefile

DOCKER_FILE=Dockerfile
SRC?=$(shell pwd)

IMAGE=yantonov/anaconda3
TAG=2020.02

build:
	docker build \
		-t $(IMAGE):$(TAG) \
		-f $(DOCKER_FILE) .

ssh:
	docker run --rm -u 0 -t -i "$(IMAGE)" bash

stop:
	docker stop "$(shell docker ps -a --filter "ancestor=$(IMAGE)" --format '{{.ID}}' | head -n 1 || echo "")"

pull:
	docker pull "$(IMAGE)"

uninstall:
	docker image rm "$(IMAGE)"
