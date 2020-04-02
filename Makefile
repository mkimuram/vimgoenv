REGISTRY := mkimuram
IMAGE_NAME := vimgoenv
TAG := 0.1

build-image:
	docker build -t $(REGISTRY)/$(IMAGE_NAME):$(TAG) -f Dockerfile .
push-image:
	docker push $(REGISTRY)/$(IMAGE_NAME):$(TAG)
