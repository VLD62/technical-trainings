SHELL := /usr/bin/env bash

.PHONY: validate shellcheck list

validate:
	@echo "Checking required files..."
	@test -f README.md
	@test -f docs/lpic1_objectives_mapping.md
	@test -f slides/00_course_introduction.md
	@test -f quizzes/exam_101_questions.md
	@test -f quizzes/exam_102_questions.md
	@echo "Checking Bash syntax..."
	@find scripts examples -type f -name '*.sh' -print0 | xargs -0 -r -n1 bash -n
	@echo "Checking local Markdown links..."
	@python3 scripts/validate_markdown_links.py
	@echo "Validation completed successfully."

shellcheck:
	@command -v shellcheck >/dev/null || { echo "shellcheck is not installed"; exit 1; }
	@find scripts examples -type f -name '*.sh' -print0 | xargs -0 -r shellcheck

list:
	@find . -maxdepth 3 -type f | sort
