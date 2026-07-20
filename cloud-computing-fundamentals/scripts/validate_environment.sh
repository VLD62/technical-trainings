#!/usr/bin/env bash
set -euo pipefail

printf '%-18s %-10s %s\n' "Tool" "Status" "Details"
printf '%-18s %-10s %s\n' "------------------" "----------" "------------------------------"

check_tool() {
  local name="$1"
  local command_name="$2"
  local version_command="$3"
  if command -v "$command_name" >/dev/null 2>&1; then
    local details
    details=$(bash -lc "$version_command" 2>&1 | head -n 1 || true)
    printf '%-18s %-10s %s\n' "$name" "available" "$details"
  else
    printf '%-18s %-10s %s\n' "$name" "optional" "not installed"
  fi
}

check_tool "Git" "git" "git --version"
check_tool "Python" "python3" "python3 --version"
check_tool "Bash" "bash" "bash --version"
check_tool "Make" "make" "make --version"
check_tool "AWS CLI" "aws" "aws --version"
check_tool "Azure CLI" "az" "az version --output json"
check_tool "Google Cloud CLI" "gcloud" "gcloud version"
check_tool "OCI CLI" "oci" "oci --version"

echo
if command -v python3 >/dev/null 2>&1; then
  python3 - <<'PY2'
import sys
required=(3,10)
status='OK' if sys.version_info >= required else 'Upgrade recommended'
print(f'Python runtime: {sys.version.split()[0]} — {status}')
PY2
fi

echo "Core labs require only Git, Bash, Python, and a text editor. Cloud CLIs are optional."
