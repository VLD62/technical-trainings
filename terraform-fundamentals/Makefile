SHELL := /bin/bash
.DEFAULT_GOAL := help

TF ?= terraform
DEMO_DIR := examples/01-local-basics
TEST_DIR := examples/06-tests
VALIDATE_DIRS := \
	examples/01-local-basics \
	examples/02-variables-and-collections \
	examples/03-local-module \
	examples/04-lifecycle-and-conditions \
	examples/05-refactoring \
	examples/06-tests

.PHONY: help list check-environment content-check fmt fmt-check validate test \
	demo-init demo-plan demo-apply demo-output demo-destroy clean

help:
	@printf '%s\n' \
	  'Terraform: Fundamentals' \
	  '' \
	  'make list               List course materials' \
	  'make check-environment  Check local tools and versions' \
	  'make content-check      Validate required files and Markdown links' \
	  'make fmt                Format all Terraform files' \
	  'make fmt-check          Check canonical Terraform formatting' \
	  'make validate           Initialize without backends and validate examples' \
	  'make test               Run native Terraform tests' \
	  'make demo-init          Initialize the provider-free demo' \
	  'make demo-plan          Create an execution plan for the demo' \
	  'make demo-apply         Apply the demo interactively' \
	  'make demo-output        Show demo outputs' \
	  'make demo-destroy       Destroy the demo interactively' \
	  'make clean              Remove generated local Terraform files'

list:
	@find slides docs labs examples scripts quizzes -maxdepth 3 -type f | sort

check-environment:
	@./scripts/validate_environment.sh

content-check:
	@python3 scripts/validate_content.py

fmt:
	@$(TF) fmt -recursive

fmt-check:
	@$(TF) fmt -check -recursive

validate:
	@set -e; \
	for dir in $(VALIDATE_DIRS); do \
	  echo "==> Validating $$dir"; \
	  $(TF) -chdir=$$dir init -backend=false -input=false >/dev/null; \
	  $(TF) -chdir=$$dir validate; \
	done

test:
	@$(TF) -chdir=$(TEST_DIR) init -backend=false -input=false >/dev/null
	@$(TF) -chdir=$(TEST_DIR) test

demo-init:
	@$(TF) -chdir=$(DEMO_DIR) init

demo-plan:
	@$(TF) -chdir=$(DEMO_DIR) plan -out=training.tfplan

demo-apply:
	@$(TF) -chdir=$(DEMO_DIR) apply

demo-output:
	@$(TF) -chdir=$(DEMO_DIR) output

demo-destroy:
	@$(TF) -chdir=$(DEMO_DIR) destroy

clean:
	@find examples -type d -name .terraform -prune -exec rm -rf {} +
	@find examples -type f \( -name '*.tfstate' -o -name '*.tfstate.*' -o -name '*.tfplan' -o -name '*.plan' \) -delete
	@echo 'Generated Terraform files removed.'
