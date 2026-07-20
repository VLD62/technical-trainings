SHELL := /bin/bash

.PHONY: help list validate check-environment inventory service-map

help:
	@echo "Cloud Computing: Fundamentals targets:"
	@echo "  make list               List course materials"
	@echo "  make validate           Validate scripts and local Markdown links"
	@echo "  make check-environment  Check local tools and optional cloud CLIs"
	@echo "  make inventory          Print read-only CLI account/context information"
	@echo "  make service-map        Print the provider service comparison"

list:
	@find . -maxdepth 3 -type f | sort

validate:
	@bash -n scripts/validate_environment.sh
	@bash -n scripts/cloud_cli_inventory.sh
	@bash -n examples/cli/aws-read-only.sh
	@bash -n examples/cli/azure-read-only.sh
	@bash -n examples/cli/gcp-read-only.sh
	@bash -n examples/cli/oci-read-only.sh
	@python3 scripts/validate_content.py

check-environment:
	@./scripts/validate_environment.sh

inventory:
	@./scripts/cloud_cli_inventory.sh all

service-map:
	@python3 -c 'import csv; rows=list(csv.reader(open("examples/provider-service-map.csv"))); widths=[max(len(r[i]) for r in rows) for i in range(len(rows[0]))]; [print(" | ".join(v.ljust(widths[i]) for i,v in enumerate(r))) for r in rows]'
