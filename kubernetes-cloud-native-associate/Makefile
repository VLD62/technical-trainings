SHELL := /bin/bash
CLUSTER_NAME ?= kcna-lab
KUBECTL ?= kubectl
KIND ?= kind

.PHONY: help list validate check-environment cluster-create cluster-delete inventory demo-apply demo-delete

help:
	@echo "KCNA training targets:"
	@echo "  make list              List course materials"
	@echo "  make validate          Validate scripts, manifests, and local links"
	@echo "  make check-environment Check local tools and cluster access"
	@echo "  make cluster-create    Create a local kind cluster"
	@echo "  make cluster-delete    Delete the local kind cluster"
	@echo "  make inventory         Print a read-only cluster inventory"
	@echo "  make demo-apply        Apply the example manifests"
	@echo "  make demo-delete       Delete the training namespace"

list:
	@find . -maxdepth 3 -type f | sort

validate:
	@bash -n scripts/validate_environment.sh
	@bash -n scripts/cluster_inventory.sh
	@python3 scripts/validate_content.py

check-environment:
	@./scripts/validate_environment.sh

cluster-create:
	@$(KIND) get clusters | grep -qx '$(CLUSTER_NAME)' && echo "Cluster $(CLUSTER_NAME) already exists" || \
		$(KIND) create cluster --name '$(CLUSTER_NAME)' --config examples/kind-config.yaml

cluster-delete:
	@$(KIND) delete cluster --name '$(CLUSTER_NAME)'

inventory:
	@./scripts/cluster_inventory.sh

demo-apply:
	@$(KUBECTL) apply -f examples/manifests/namespace.yaml
	@$(KUBECTL) apply -f examples/manifests/configmap.yaml
	@$(KUBECTL) apply -f examples/manifests/secret-example.yaml
	@$(KUBECTL) apply -f examples/manifests/deployment.yaml
	@$(KUBECTL) apply -f examples/manifests/service.yaml
	@$(KUBECTL) apply -f examples/manifests/cronjob.yaml
	@$(KUBECTL) apply -f examples/manifests/probes-deployment.yaml
	@echo "PVC example is not applied automatically because a default StorageClass may not exist."

demo-delete:
	@$(KUBECTL) delete namespace kcna-lab --ignore-not-found
