.PHONY: all build push clean

IMAGE_NAME = webdav
IMAGE_GROUP = linuxoid69
IMAGE_TAG = 1.26.2-r0
REVISION =
DOCKER_REGISTRY = ghcr.io

all:
	@echo 'DEFAULT:'
	@echo '   make build'
	@echo '   make push'
	@echo '   make getTag'
	@echo '   make clean'

build:
	DOCKER_BUILDKIT=1 docker build \
					-f Dockerfile \
					--platform linux/amd64 \
					--build-arg DAV_VERSION=$(IMAGE_TAG) \
					-t $(DOCKER_REGISTRY)/$(IMAGE_GROUP)/$(IMAGE_NAME):$(IMAGE_TAG)$(REVISION) .

push:
ifeq ($(CI), false)
	docker login https://$(DOCKER_REGISTRY)
endif
	docker push $(DOCKER_REGISTRY)/$(IMAGE_GROUP)/$(IMAGE_NAME):$(IMAGE_TAG)$(REVISION)

getTag:
	@echo $(IMAGE_TAG)

clean:
	docker rmi $(DOCKER_REGISTRY)/$(IMAGE_GROUP)/$(IMAGE_NAME):$(IMAGE_TAG)$(REVISION)
