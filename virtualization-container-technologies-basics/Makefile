ENGINE ?= docker
IMAGE ?= virtualization-training/hello:local
CONTAINER ?= virtualization-training-hello

.PHONY: help list validate check-virtualization build run stop logs compose-up compose-down clean

help:
	@printf '%s\n' \
	  'make list                 List course files' \
	  'make validate             Validate package content and shell syntax' \
	  'make check-virtualization Inspect local virtualization capabilities' \
	  'make build                Build the hello container image' \
	  'make run                  Run the hello container on port 8080' \
	  'make logs                 Show hello container logs' \
	  'make stop                 Remove the hello container' \
	  'make compose-up           Start the Compose example on port 8081' \
	  'make compose-down         Stop the Compose example' \
	  'make clean                Remove local lab containers and image'

list:
	@find slides docs labs examples scripts quizzes -type f | sort

validate:
	@python3 scripts/validate_content.py
	@bash -n scripts/check_virtualization.sh

check-virtualization:
	@bash scripts/check_virtualization.sh

build:
	@$(ENGINE) build -t $(IMAGE) examples/hello-container

run: stop
	@$(ENGINE) run -d --name $(CONTAINER) -p 8080:8080 --memory 128m --cpus 0.50 $(IMAGE)
	@printf 'Open http://localhost:8080\n'

logs:
	@$(ENGINE) logs $(CONTAINER)

stop:
	@$(ENGINE) rm -f $(CONTAINER) >/dev/null 2>&1 || true

compose-up:
	@docker compose -f examples/compose-stack/compose.yaml up -d --build
	@printf 'Open http://localhost:8081\n'

compose-down:
	@docker compose -f examples/compose-stack/compose.yaml down --remove-orphans

clean: stop compose-down
	@$(ENGINE) image rm $(IMAGE) >/dev/null 2>&1 || true
