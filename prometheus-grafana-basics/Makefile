SHELL := /bin/bash
COMPOSE := docker compose --env-file .env -f lab/docker-compose.yml

.PHONY: help init validate up down restart ps logs generate-load clean

help:
	@echo "Targets:"
	@echo "  make init           Create .env from .env.example"
	@echo "  make validate       Validate Compose, Prometheus, rules, and JSON"
	@echo "  make up             Start the training stack"
	@echo "  make down           Stop the training stack"
	@echo "  make restart        Restart the training stack"
	@echo "  make ps             Show service status"
	@echo "  make logs           Follow service logs"
	@echo "  make generate-load  Generate sample application traffic"
	@echo "  make clean          Stop the stack and remove named volumes"

init:
	@test -f .env || cp .env.example .env
	@echo ".env is ready"

validate: init
	@lab/scripts/validate.sh

up: init
	@$(COMPOSE) up -d --build
	@echo "Prometheus: http://localhost:9090"
	@echo "Grafana:    http://localhost:3000"
	@echo "Sample app: http://localhost:8000"

down: init
	@$(COMPOSE) down

restart: down up

ps: init
	@$(COMPOSE) ps

logs: init
	@$(COMPOSE) logs -f

generate-load:
	@for i in $$(seq 1 20); do \
		curl -fsS http://localhost:8000/ >/dev/null || true; \
		curl -fsS http://localhost:8000/slow >/dev/null || true; \
		curl -sS http://localhost:8000/error >/dev/null || true; \
	done
	@echo "Sample traffic generated"

clean: init
	@$(COMPOSE) down -v --remove-orphans
