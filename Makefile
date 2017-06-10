gpu: Dockerfile.base.m4 Dockerfile.gpu.m4
	m4 Dockerfile.gpu.m4 > Dockerfile.gpu

cpu: Dockerfile.base.m4 Dockerfile.cpu.m4
	m4 Dockerfile.cpu.m4 > Dockerfile.cpu

.PHONY: build_gpu
build_gpu: gpu
	docker build -t adaitche/tensorflow-gpu-py3-hdfs -f Dockerfile.gpu .

.PHONY: build_cpu
build_cpu: cpu
	docker build -t adaitche/tensorflow-cpu-py3-hdfs -f Dockerfile.cpu .

.PHONY: push_gpu
push_gpu: build_gpu
	docker push adaitche/tensorflow-gpu-py3-hdfs

.PHONY: push_cpu
push_cpu: build_cpu
	docker push adaitche/tensorflow-cpu-py3-hdfs

.PHONY: all
all: push_gpu push_cpu

.PHONY: clean
clean:
	rm -f Docker.gpu Docker.cpu
