build:
	docker build -t "ghcr.io/avkosme/hugo-dev:latest" .
push:
	docker push ghcr.io/avkosme/hugo-dev:latest
build.arm:
	docker build -t "ghcr.io/avkosme/hugo-dev:arm" .
push.arm:
	docker push ghcr.io/avkosme/hugo-dev:arm


