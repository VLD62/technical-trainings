#!/usr/bin/env bash
set -Eeuo pipefail

section() { printf '\n## %s\n' "$1"; }
run_optional() {
  local cmd=$1
  shift
  if command -v "$cmd" >/dev/null 2>&1; then
    "$cmd" "$@" 2>&1 || true
  else
    printf '%s is not available\n' "$cmd"
  fi
}

section "Timestamp"
date --iso-8601=seconds

section "Identity"
printf 'Hostname: %s\n' "$(hostname)"
printf 'User: %s\n' "$(id -un)"
id

section "Operating System"
cat /etc/os-release 2>/dev/null || true
uname -a

section "CPU"
run_optional lscpu

section "Memory"
run_optional free -h

section "Block Devices"
run_optional lsblk -o NAME,SIZE,TYPE,FSTYPE,UUID,MOUNTPOINTS

section "PCI Devices"
run_optional lspci

section "USB Devices"
run_optional lsusb

section "Loaded Modules"
run_optional lsmod

section "Boot and systemd"
if command -v systemctl >/dev/null 2>&1; then
  systemctl get-default 2>&1 || true
  systemctl --failed --no-pager 2>&1 || true
fi

section "Recent Kernel Warnings"
if command -v journalctl >/dev/null 2>&1; then
  journalctl -k -p warning -n 50 --no-pager 2>&1 || true
else
  dmesg 2>&1 | tail -n 50 || true
fi
