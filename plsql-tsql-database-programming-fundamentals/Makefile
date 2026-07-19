COMPOSE = docker compose -f lab/docker-compose.yml --env-file .env

.PHONY: help list config validate up wait init-mssql verify status logs oracle-shell mssql-shell down reset clean

help:
	@printf '%s\n' \
	  'make list          List course files' \
	  'make config        Create .env from .env.example when missing' \
	  'make validate      Validate package content and shell syntax' \
	  'make up            Start databases, wait, and initialize SQL Server' \
	  'make verify        Run verification queries on both databases' \
	  'make status        Show container status' \
	  'make logs          Follow database logs' \
	  'make oracle-shell  Open SQL*Plus as the Oracle training user' \
	  'make mssql-shell   Open sqlcmd in TrainingDB' \
	  'make down          Stop containers and keep data' \
	  'make reset         Recreate the schema while keeping images' \
	  'make clean         Remove containers and local database volumes'

list:
	@find slides docs labs examples lab scripts quizzes -type f | sort

config:
	@if [ ! -f .env ]; then cp .env.example .env; printf 'Created .env; review the passwords before use.\n'; fi

validate:
	@python3 scripts/validate_content.py
	@bash -n scripts/wait_for_databases.sh
	@bash -n lab/oracle/init/01_initialize_training_schema.sh

up: config
	@$(COMPOSE) up -d
	@$(MAKE) wait
	@$(MAKE) init-mssql
	@printf 'Both training databases are ready.\n'

wait:
	@bash scripts/wait_for_databases.sh

init-mssql:
	@$(COMPOSE) exec -T sqlserver bash -lc '/opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P "$$MSSQL_SA_PASSWORD" -C -b -i /training/init/00_setup.sql'

verify:
	@$(COMPOSE) exec -T oracle bash -lc 'sqlplus -s "$$APP_USER/$$APP_USER_PASSWORD@//localhost:1521/FREEPDB1" @/training/init/sql/99_verify.sql'
	@$(COMPOSE) exec -T sqlserver bash -lc '/opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P "$$MSSQL_SA_PASSWORD" -C -b -d TrainingDB -i /training/init/99_verify.sql'

status:
	@$(COMPOSE) ps

logs:
	@$(COMPOSE) logs -f --tail=100

oracle-shell:
	@$(COMPOSE) exec oracle bash -lc 'sqlplus "$$APP_USER/$$APP_USER_PASSWORD@//localhost:1521/FREEPDB1"'

mssql-shell:
	@$(COMPOSE) exec sqlserver bash -lc '/opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P "$$MSSQL_SA_PASSWORD" -C -d TrainingDB'

down:
	@$(COMPOSE) down --remove-orphans

reset: config
	@$(COMPOSE) down -v --remove-orphans
	@$(MAKE) up

clean: config
	@$(COMPOSE) down -v --remove-orphans
