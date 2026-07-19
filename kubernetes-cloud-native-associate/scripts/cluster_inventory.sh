#!/usr/bin/env bash
set -euo pipefail

if ! command -v kubectl >/dev/null 2>&1; then
  echo 'kubectl is required.' >&2
  exit 1
fi

if ! kubectl cluster-info >/dev/null 2>&1; then
  echo 'The Kubernetes API is not reachable from the current context.' >&2
  exit 1
fi

echo '=== Context ==='
kubectl config current-context

echo
echo '=== Cluster Info ==='
kubectl cluster-info

echo
echo '=== Nodes ==='
kubectl get nodes -o wide

echo
echo '=== Namespaces ==='
kubectl get namespaces

echo
echo '=== API Resource Summary ==='
printf 'Namespaced resources: '
kubectl api-resources --namespaced=true --no-headers | wc -l
printf 'Cluster-scoped resources: '
kubectl api-resources --namespaced=false --no-headers | wc -l

echo
echo '=== Storage Classes ==='
kubectl get storageclass 2>/dev/null || true

echo
echo '=== Ingress Classes ==='
kubectl get ingressclass 2>/dev/null || true

echo
echo '=== System Workloads ==='
kubectl get deployments,daemonsets -n kube-system 2>/dev/null || true
