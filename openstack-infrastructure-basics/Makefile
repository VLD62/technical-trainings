CLOUD ?= training
REPORT_DIR ?= reports

.PHONY: help list validate check health clean

help:
	@printf '%s\n' \
	  'make list                 List course files' \
	  'make validate             Validate package structure and public-content safety' \
	  'make check                Inspect local CLI and optional deployment prerequisites' \
	  'make health CLOUD=name    Generate a read-only OpenStack health report' \
	  'make clean                Remove generated local reports'

list:
	@find slides docs labs examples scripts quizzes -type f | sort

validate:
	@python3 scripts/validate_content.py
	@bash -n scripts/check_prerequisites.sh
	@bash -n scripts/openstack_health_report.sh

check:
	@bash scripts/check_prerequisites.sh

health:
	@mkdir -p $(REPORT_DIR)
	@bash scripts/openstack_health_report.sh --cloud $(CLOUD) --output $(REPORT_DIR)/openstack-health-$$(date +%Y%m%d-%H%M%S).txt

clean:
	@rm -rf $(REPORT_DIR)
