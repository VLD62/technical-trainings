#!/usr/bin/env bash
set -euo pipefail

required=(git docker kind kubectl helm python3)
optional=(argocd flux jq yq shellcheck)

missing=0

echo "Required tools:"
for command_name in "${required[@]}"; do
  if command -v "${command_name}" >/dev/null 2>&1; then
    printf '  [OK]      %s\n' "${command_name}"
  else
    printf '  [MISSING] %s\n' "${command_name}"
    missing=1
  fi
done

echo
echo "Optional tools:"
for command_name in "${optional[@]}"; do
  if command -v "${command_name}" >/dev/null 2>&1; then
    printf '  [OK]      %s\n' "${command_name}"
  else
    printf '  [OPTIONAL] %s\n' "${command_name}"
  fi
done

echo
if command -v kubectl >/dev/null 2>&1; then
  current_context="$(kubectl config current-context 2>/dev/null || true)"
  if [[ -n "${current_context}" ]]; then
    echo "Current Kubernetes context: ${current_context}"
    case "${current_context}" in
      *prod*|*production*)
        echo "WARNING: Current context name looks production-related." >&2
        ;;
    esac
  else
    echo "No current Kubernetes context."
  fi
fi

if [[ "${missing}" -ne 0 ]]; then
  echo
  echo "Install missing required tools before the full hands-on labs." >&2
  exit 1
fi

echo
echo "Environment check completed."
