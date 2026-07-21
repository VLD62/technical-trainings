#!/usr/bin/env bash
set -euo pipefail

cluster_name="${KIND_CLUSTER_NAME:-gitops-lab}"

echo "Deleting course Applications and namespaces from the current context."
kubectl delete applications.argoproj.io --all -n argocd \
  --ignore-not-found --wait=false 2>/dev/null || true
kubectl delete applicationsets.argoproj.io --all -n argocd \
  --ignore-not-found --wait=false 2>/dev/null || true
kubectl delete appprojects.argoproj.io training -n argocd \
  --ignore-not-found --wait=false 2>/dev/null || true

for namespace in \
  gitops-demo-dev \
  gitops-demo-staging \
  gitops-demo-prod \
  gitops-demo-qa \
  gitops-demo-plain \
  gitops-helm-demo \
  argocd; do
  kubectl delete namespace "${namespace}" --ignore-not-found --wait=false \
    2>/dev/null || true
done

if command -v kind >/dev/null 2>&1 &&
   kind get clusters | grep -qx "${cluster_name}"; then
  kind delete cluster --name "${cluster_name}"
else
  echo "kind cluster '${cluster_name}' not found; namespace cleanup attempted only."
fi
