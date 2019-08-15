image-name := hernrup/semantic-release
version := 1.0.0

.PHONY: build
build:
	docker build -t $(image-name):$(version) -t $(image-name):latest .

.PHONY: push
push:
	docker push $(image-name):$(version)
	docker push $(image-name):latest
