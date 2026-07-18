#!/usr/bin/env bash
set -Eeuo pipefail

target=${1:-example.org}

section() { printf '\n## %s\n' "$1"; }
run_optional() {
  local cmd=$1
  shift
  if command -v "$cmd" >/dev/null 2>&1; then
    timeout 15 "$cmd" "$@" 2>&1 || true
  else
    printf '%s is not available\n' "$cmd"
  fi
}

printf '# Network Diagnostics\n'
printf 'Generated: %s\n' "$(date --iso-8601=seconds)"
printf 'Host: %s\n' "$(hostname)"
printf 'Target: %s\n' "$target"

section "Interfaces"
run_optional ip -brief link
run_optional ip -brief address

section "Routes"
run_optional ip route
run_optional ip -6 route

section "NetworkManager"
run_optional nmcli device status
run_optional nmcli connection show --active

section "Listening Sockets"
run_optional ss -lntup

section "Resolver Configuration"
grep '^hosts:' /etc/nsswitch.conf 2>/dev/null || true
cat /etc/resolv.conf 2>/dev/null || true

section "Name Resolution"
run_optional getent ahosts "$target"
run_optional host "$target"
run_optional dig +short "$target"

section "Reachability"
run_optional ping -c 3 "$target"
run_optional tracepath "$target"

section "HTTPS Port Test"
run_optional nc -vz "$target" 443
