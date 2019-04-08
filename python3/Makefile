help:
	@cat Makefile

DOCKER_FILE=Dockerfile
SRC?=$(shell pwd)

IMAGE=yantonov/anaconda3

build:
	docker build \
		-t $(IMAGE) \
		-f $(DOCKER_FILE) .

ssh:
	docker run --rm -u 0 -t -i "$(IMAGE)" bash

stop:
	docker stop "$(shell docker ps -a --filter "ancestor=$(IMAGE)" --format '{{.ID}}' | head -n 1 || echo "")"

pull:
	docker pull "$(IMAGE)"

uninstall:
	docker image rm "$(IMAGE)"
