#!/usr/bin/env bash
set -euo pipefail

provider="${1:-all}"

section() {
  echo
  echo "=== $1 ==="
}

aws_inventory() {
  section "AWS"
  if ! command -v aws >/dev/null 2>&1; then
    echo "AWS CLI not installed"
    return
  fi
  aws --version
  if aws sts get-caller-identity >/dev/null 2>&1; then
    aws sts get-caller-identity --query '{Account:Account,Arn:Arn}' --output table
    echo "Default region: $(aws configure get region || echo not-set)"
  else
    echo "No working AWS authentication context"
  fi
}

azure_inventory() {
  section "Microsoft Azure"
  if ! command -v az >/dev/null 2>&1; then
    echo "Azure CLI not installed"
    return
  fi
  az version --query '"azure-cli"' --output tsv 2>/dev/null || true
  if az account show >/dev/null 2>&1; then
    az account show --query '{Name:name,TenantId:tenantId,State:state}' --output table
  else
    echo "No working Azure authentication context"
  fi
}

gcp_inventory() {
  section "Google Cloud"
  if ! command -v gcloud >/dev/null 2>&1; then
    echo "Google Cloud CLI not installed"
    return
  fi
  gcloud version | head -n 1
  local account project
  account=$(gcloud auth list --filter=status:ACTIVE --format='value(account)' 2>/dev/null | head -n 1 || true)
  project=$(gcloud config get-value project 2>/dev/null || true)
  echo "Active account: ${account:-not-authenticated}"
  echo "Configured project: ${project:-not-set}"
}

oci_inventory() {
  section "Oracle Cloud Infrastructure"
  if ! command -v oci >/dev/null 2>&1; then
    echo "OCI CLI not installed"
    return
  fi
  oci --version
  local profile config_file
  profile="${OCI_CLI_PROFILE:-DEFAULT}"
  config_file="${OCI_CLI_CONFIG_FILE:-$HOME/.oci/config}"
  echo "Profile: $profile"
  if [[ -f "$config_file" ]]; then
    awk -v section="[$profile]" '
      $0 == section { in_section=1; next }
      /^\[/ { in_section=0 }
      in_section && /^(tenancy|region)=/ { print }
    ' "$config_file"
  else
    echo "No OCI configuration file at $config_file"
  fi
}

case "$provider" in
  aws) aws_inventory ;;
  azure|az) azure_inventory ;;
  gcp|gcloud) gcp_inventory ;;
  oci) oci_inventory ;;
  all)
    aws_inventory
    azure_inventory
    gcp_inventory
    oci_inventory
    ;;
  *)
    echo "Usage: $0 [all|aws|azure|gcp|oci]" >&2
    exit 2
    ;;
esac

echo
echo "Inventory commands are read-only. Review output before sharing because identifiers may be sensitive."
