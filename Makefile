build:
	docker build -t "ghcr.io/avkosme/hugo-dev" .
push:
	docker push ghcr.io/avkosme/hugo-dev:latest


