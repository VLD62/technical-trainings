SHELL := /usr/bin/env bash

BASH_FILES := $(shell find examples scripts tests -type f -name '*.sh' | sort)

.PHONY: help list check validate syntax lint format-check test demo clean

help:
	@printf '%s\n' \
		'make list          List course files' \
		'make check         Report required and optional tools' \
		'make validate      Validate structure, content, and shell syntax' \
		'make syntax        Run bash -n for every shell script' \
		'make lint          Run ShellCheck when installed' \
		'make format-check  Check formatting with shfmt when installed' \
		'make test          Run dependency-free behavior tests' \
		'make demo          Run safe example demonstrations' \
		'make clean         Remove generated training output'

list:
	@find slides docs labs examples scripts tests quizzes -type f | sort

check:
	@bash scripts/check_environment.sh

validate:
	@python3 scripts/validate_content.py
	@$(MAKE) syntax

syntax:
	@set -e; \
	for file in $(BASH_FILES); do \
		bash -n "$$file"; \
	done; \
	printf 'Bash syntax checks passed for %s files.\n' "$$(printf '%s\n' $(BASH_FILES) | wc -l)"

lint:
	@if command -v shellcheck >/dev/null 2>&1; then \
		shellcheck -x $(BASH_FILES); \
	else \
		printf 'ShellCheck is not installed. See docs/setup_guide.md.\n'; \
	fi

format-check:
	@if command -v shfmt >/dev/null 2>&1; then \
		shfmt -d -i 4 -ci -bn $(BASH_FILES); \
	else \
		printf 'shfmt is not installed. See docs/setup_guide.md.\n'; \
	fi

test:
	@bash tests/run_tests.sh

demo:
	@bash examples/00_hello_bash.sh
	@bash examples/01_arguments.sh Alice 3
	@bash examples/02_file_check.sh README.md
	@bash examples/03_loop_files.sh examples '*.sh'
	@bash examples/04_functions.sh 8 5
	@bash examples/05_log_summary.sh examples/data/application.log
	@tmp_dir="$$(mktemp -d)"; \
	mkdir -p "$$tmp_dir/source" "$$tmp_dir/backups"; \
	printf 'training data\n' > "$$tmp_dir/source/example.txt"; \
	bash examples/06_backup_directory.sh --source "$$tmp_dir/source" --destination "$$tmp_dir/backups"; \
	rm -rf "$$tmp_dir"
	@bash examples/07_system_report.sh --output reports/system-report.txt
	@printf 'Generated reports/system-report.txt\n'

clean:
	@rm -rf reports tmp work
