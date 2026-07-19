#!/usr/bin/env bash
set -euo pipefail

missing=0

check_command() {
  local command_name="$1"
  if command -v "$command_name" >/dev/null 2>&1; then
    printf '[OK] %-10s %s\n' "$command_name" "$(command -v "$command_name")"
  else
    printf '[MISSING] %s\n' "$command_name"
    missing=1
  fi
}

check_command kubectl
check_command python3

if command -v kind >/dev/null 2>&1; then
  printf '[OK] %-10s %s\n' kind "$(command -v kind)"
else
  echo '[OPTIONAL] kind is not installed; use minikube, k3d, or an existing test cluster.'
fi

if command -v docker >/dev/null 2>&1; then
  printf '[OK] %-10s %s\n' docker "$(command -v docker)"
elif command -v podman >/dev/null 2>&1; then
  printf '[OK] %-10s %s\n' podman "$(command -v podman)"
else
  echo '[OPTIONAL] Docker or Podman is required only for a local container-based cluster.'
fi

if command -v kubectl >/dev/null 2>&1; then
  echo
  echo 'Current Kubernetes context:'
  kubectl config current-context 2>/dev/null || echo '[INFO] No current Kubernetes context is configured.'

  if kubectl cluster-info >/dev/null 2>&1; then
    echo '[OK] Kubernetes API is reachable.'
    kubectl get nodes -o wide
  else
    echo '[INFO] Kubernetes API is not currently reachable.'
  fi
fi

if [[ "$missing" -ne 0 ]]; then
  echo
  echo 'Install the missing required commands before running the full course.'
  exit 1
fi
