#!/usr/bin/env bash
set -euo pipefail

command -v oci >/dev/null 2>&1 || { echo "OCI CLI is not installed." >&2; exit 1; }

echo "OCI CLI version:"
oci --version

echo
echo "Configured regions from the tenancy subscription:"
oci iam region-subscription list --output table

echo
echo "Current region from configuration:"
profile="${OCI_CLI_PROFILE:-DEFAULT}"
config_file="${OCI_CLI_CONFIG_FILE:-$HOME/.oci/config}"
if [[ -f "$config_file" ]]; then
  awk -v section="[$profile]" '
    $0 == section { in_section=1; next }
    /^\[/ { in_section=0 }
    in_section && /^region=/ { print $0 }
  ' "$config_file"
else
  echo "OCI config file not found at $config_file"
fi
