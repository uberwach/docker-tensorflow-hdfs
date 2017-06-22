IMAGE_NAME=uberwach/tensorflow-gpu-py3-hdfs

docker_file: Dockerfile.base

.PHONY: build
build: docker_file
	docker build -t $(IMAGE_NAME) -f Dockerfile.base .

.PHONY: push
push: build
	docker tag $(IMAGE_NAME) smesosphere05.emea.company.newyorker.de:10005/$(IMAGE_NAME)
	docker push smesosphere05.emea.company.newyorker.de:10005/$(IMAGE_NAME)

.PHONY: all
all: push

.PHONY: clean
clean:
	rm -f Docker
