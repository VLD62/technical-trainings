#!/usr/bin/env bash
set -euo pipefail

if ! command -v kubectl >/dev/null 2>&1; then
  echo "ERROR: kubectl is not installed." >&2
  exit 1
fi

kubectl create namespace argocd --dry-run=client -o yaml | kubectl apply -f -

# Convenient for a disposable lab. Production should pin and verify a release.
kubectl apply -n argocd --server-side --force-conflicts \
  -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

kubectl wait --for=condition=Available deployment/argocd-server \
  -n argocd --timeout=300s
kubectl wait --for=condition=Available deployment/argocd-repo-server \
  -n argocd --timeout=300s

kubectl get pods -n argocd
echo
echo "Argo CD installed."
echo "Run 'make argocd-password' and 'make argocd-port-forward'."
