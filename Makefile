SHELL=/bin/bash
.PHONY: up

up:
	docker-compose run --rm --entrypoint /bin/sh terraform