#!/usr/bin/env bash
set -u

usage() {
  cat <<'EOF'
Usage: openstack_health_report.sh --cloud CLOUD [--output FILE]

Generates a read-only OpenStack health and inventory report.
The available sections depend on cloud policy and installed client plugins.
EOF
}

cloud=""
output=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --cloud)
      cloud="${2:-}"
      shift 2
      ;;
    --output)
      output="${2:-}"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      printf 'Unknown argument: %s\n' "$1" >&2
      usage >&2
      exit 2
      ;;
  esac
done

if [[ -z "$cloud" ]]; then
  printf 'Error: --cloud is required.\n' >&2
  exit 2
fi

if ! command -v openstack >/dev/null 2>&1; then
  printf 'Error: openstack CLI is not installed.\n' >&2
  exit 1
fi

if [[ -z "$output" ]]; then
  output="openstack-health-$(date +%Y%m%d-%H%M%S).txt"
fi

mkdir -p "$(dirname "$output")"

run_section() {
  local title="$1"
  shift
  {
    printf '\n===== %s =====\n' "$title"
    printf '$'
    printf ' %q' "$@"
    printf '\n'
    "$@" 2>&1 || printf '[Section unavailable or command failed with status %s]\n' "$?"
  } >> "$output"
}

{
  printf 'OpenStack Read-Only Health Report\n'
  printf 'Generated: %s\n' "$(date --iso-8601=seconds 2>/dev/null || date)"
  printf 'Cloud: %s\n' "$cloud"
  printf 'Host: %s\n' "$(hostname)"
  printf 'User: %s\n' "${USER:-unknown}"
  printf '\nThis report intentionally avoids printing token values or credential files.\n'
} > "$output"

run_section 'Client Version' openstack --version
run_section 'Token Scope' openstack --os-cloud "$cloud" token issue -f yaml
run_section 'Service Catalog' openstack --os-cloud "$cloud" catalog list
run_section 'Endpoints' openstack --os-cloud "$cloud" endpoint list
run_section 'Quotas' openstack --os-cloud "$cloud" quota show
run_section 'Absolute Limits' openstack --os-cloud "$cloud" limits show --absolute
run_section 'Compute Services' openstack --os-cloud "$cloud" compute service list
run_section 'Hypervisors' openstack --os-cloud "$cloud" hypervisor list
run_section 'Servers' openstack --os-cloud "$cloud" server list --long
run_section 'Images' openstack --os-cloud "$cloud" image list
run_section 'Flavors' openstack --os-cloud "$cloud" flavor list
run_section 'Networks' openstack --os-cloud "$cloud" network list
run_section 'Subnets' openstack --os-cloud "$cloud" subnet list
run_section 'Routers' openstack --os-cloud "$cloud" router list
run_section 'Network Agents' openstack --os-cloud "$cloud" network agent list
run_section 'Floating IPs' openstack --os-cloud "$cloud" floating ip list
run_section 'Volumes' openstack --os-cloud "$cloud" volume list --long
run_section 'Volume Services' openstack --os-cloud "$cloud" volume service list
run_section 'Resource Providers' openstack --os-cloud "$cloud" resource provider list

# Remove token values from the token section while keeping scope metadata.
python3 - "$output" <<'PY'
from pathlib import Path
import re
import sys

path = Path(sys.argv[1])
text = path.read_text(encoding='utf-8', errors='replace')
text = re.sub(r'(?im)^(id|token):\s*.+$', r'\1: [REDACTED]', text)
secret_label = 'pass' + 'word'
text = re.sub(r'(?im)^\s*' + secret_label + r':\s*.+$', secret_label + ': [REDACTED]', text)
path.write_text(text, encoding='utf-8')
PY

printf 'Report written to %s\n' "$output"
