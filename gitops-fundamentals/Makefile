SHELL := /usr/bin/env bash
ROOT := $(CURDIR)

.PHONY: help list check-environment content-check yaml-check shell-check \
        cluster-create argocd-install argocd-password argocd-port-forward \
        render helm-lint apply-dev delete-dev clean-lab package

help:
	@echo "GitOps: Fundamentals"
	@echo
	@echo "make list              List course materials"
	@echo "make check-environment Check local CLI prerequisites"
	@echo "make content-check     Validate course structure, links, YAML, and scripts"
	@echo "make cluster-create    Create a disposable kind cluster"
	@echo "make argocd-install    Install Argo CD in the current cluster"
	@echo "make argocd-password   Print the initial Argo CD admin password"
	@echo "make argocd-port-forward  Forward Argo CD UI to https://localhost:8080"
	@echo "make render            Render all Kustomize overlays"
	@echo "make helm-lint         Lint and template the included Helm chart"
	@echo "make apply-dev         Apply the development overlay directly for comparison"
	@echo "make delete-dev        Delete the directly applied development overlay"
	@echo "make clean-lab         Remove course namespaces and the kind cluster"
	@echo "make package           Create a zip archive of this module"

list:
	@find slides docs labs examples scripts quizzes -type f | sort

check-environment:
	@bash scripts/validate_environment.sh

content-check:
	@python3 scripts/validate_content.py
	@$(MAKE) shell-check

yaml-check:
	@python3 scripts/validate_content.py --yaml-only

shell-check:
	@for file in scripts/*.sh; do bash -n "$$file"; done
	@echo "Shell syntax: OK"

cluster-create:
	@bash scripts/create_kind_cluster.sh

argocd-install:
	@bash scripts/install_argocd.sh

argocd-password:
	@kubectl -n argocd get secret argocd-initial-admin-secret \
		-o jsonpath="{.data.password}" | base64 -d; echo

argocd-port-forward:
	@kubectl -n argocd port-forward svc/argocd-server 8080:443

render:
	@rm -rf .rendered
	@mkdir -p .rendered
	@for env in dev staging prod; do \
		kubectl kustomize examples/app/overlays/$$env > .rendered/$$env.yaml; \
		echo "Rendered .rendered/$$env.yaml"; \
	done

helm-lint:
	@helm lint examples/helm/demo-app
	@helm template demo-app examples/helm/demo-app \
		--namespace gitops-helm-demo > /tmp/gitops-demo-app.yaml
	@echo "Helm template written to /tmp/gitops-demo-app.yaml"

apply-dev:
	@kubectl apply -k examples/app/overlays/dev

delete-dev:
	@kubectl delete -k examples/app/overlays/dev --ignore-not-found

clean-lab:
	@bash scripts/uninstall_lab.sh

package:
	@cd .. && zip -qr gitops-fundamentals.zip gitops-fundamentals \
		-x "gitops-fundamentals/.rendered/*" \
		-x "gitops-fundamentals/__pycache__/*"
	@echo "Created ../gitops-fundamentals.zip"
