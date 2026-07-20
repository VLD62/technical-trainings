#!/usr/bin/env bash
set -euo pipefail

command -v az >/dev/null 2>&1 || { echo "Azure CLI is not installed." >&2; exit 1; }

echo "Azure CLI version:"
az version --output table

echo
echo "Current account context:"
az account show --output table

echo
echo "Visible subscriptions:"
az account list --query '[].{Name:name,State:state,TenantId:tenantId}' --output table
