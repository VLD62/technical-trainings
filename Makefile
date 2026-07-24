SHELL := /usr/bin/env bash

PY_FILES := $(shell git ls-files '*.py')
SH_FILES := $(shell git ls-files '*.sh')

.PHONY: help validate structure python-syntax shell-syntax modules clean

help:
	@printf '%s\n' \
		'make validate       Run all fast repository-wide checks' \
		'make structure      Validate structure, links, and placeholders' \
		'make python-syntax  Byte-compile every tracked Python file' \
		'make shell-syntax   Run bash -n on every tracked shell script' \
		'make modules        List module directories'

validate: structure python-syntax shell-syntax
	@printf '\nRepository validation complete.\n'

structure:
	@python3 scripts/validate_repo.py

python-syntax:
	@if [ -n "$(PY_FILES)" ]; then \
		python3 -m py_compile $(PY_FILES) && \
		printf 'Python syntax OK (%s files).\n' "$$(printf '%s\n' $(PY_FILES) | wc -l)"; \
	else printf 'No Python files tracked.\n'; fi

shell-syntax:
	@if [ -n "$(SH_FILES)" ]; then \
		set -e; for f in $(SH_FILES); do bash -n "$$f"; done; \
		printf 'Shell syntax OK (%s files).\n' "$$(printf '%s\n' $(SH_FILES) | wc -l)"; \
	else printf 'No shell files tracked.\n'; fi

modules:
	@for d in */; do [ -f "$$d/README.md" ] && printf '%s\n' "$${d%/}"; done

clean:
	@find . -type d -name '__pycache__' -prune -exec rm -rf {} + 2>/dev/null || true
	@find . -type d -name '.ipynb_checkpoints' -prune -exec rm -rf {} + 2>/dev/null || true
	@printf 'Removed Python and Jupyter caches.\n'
