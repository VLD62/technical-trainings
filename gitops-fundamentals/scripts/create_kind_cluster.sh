#!/usr/bin/env bash
set -euo pipefail

cluster_name="${KIND_CLUSTER_NAME:-gitops-lab}"

if ! command -v kind >/dev/null 2>&1; then
  echo "ERROR: kind is not installed." >&2
  exit 1
fi

if kind get clusters | grep -qx "${cluster_name}"; then
  echo "kind cluster '${cluster_name}' already exists."
else
  kind create cluster --name "${cluster_name}" --wait 120s
fi

kubectl config use-context "kind-${cluster_name}" >/dev/null
kubectl get nodes
