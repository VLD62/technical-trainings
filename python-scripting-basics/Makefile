PYTHON ?= python3

.PHONY: help setup validate test lint format run-final clean

help:
	@echo "setup      Create .venv and install optional tools"
	@echo "validate   Check environment, expected files, and Python syntax"
	@echo "test       Run unit tests"
	@echo "lint       Run Ruff when installed"
	@echo "format     Format Python files with Ruff when installed"
	@echo "run-final  Run the final project against the sample log"
	@echo "clean      Remove generated cache and report files"

setup:
	$(PYTHON) -m venv .venv
	.venv/bin/python -m pip install --upgrade pip
	.venv/bin/python -m pip install -r requirements.txt

validate:
	$(PYTHON) scripts/validate_environment.py --check-repository
	$(PYTHON) -m compileall -q examples scripts

test:
	$(PYTHON) -m unittest discover -s examples/08_testing -p "test_*.py" -v
	$(PYTHON) -m unittest discover -s examples/09_project -p "test_*.py" -v

lint:
	@command -v ruff >/dev/null 2>&1 && ruff check examples scripts || echo "Ruff is not installed"

format:
	@command -v ruff >/dev/null 2>&1 && ruff format examples scripts || echo "Ruff is not installed"

run-final:
	$(PYTHON) examples/09_project/log_analyzer.py examples/09_project/sample.log --level ERROR --format json

clean:
	find . -type d -name "__pycache__" -prune -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete
	rm -f examples/09_project/report.json examples/09_project/report.txt
