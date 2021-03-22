REPO ?= alb42/crossamigalazarus
TAG ?= latest
VOLUMES ?= -v "${PWD}":/sources
WORKSPACE ?= -w /sources
NAME ?= crossamigalazarus
PORT ?= 5901:5901

.PHONY: build buildnc run push logs clean release

default: build

build:
	docker build -t $(REPO):$(TAG) .

buildnc:
	docker build --no-cache -t $(REPO):$(TAG) .

run:
	docker run -it --rm --name $(NAME) -p $(PORT) $(REPO):$(TAG) /bin/bash

push:
	docker push $(REPO):$(TAG)

logs:
	docker logs $(NAME)

clean:
	-docker rm -f $(NAME)

release: buildnc push
