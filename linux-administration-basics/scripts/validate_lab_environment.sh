#!/usr/bin/env bash
set -Eeuo pipefail

required=(bash cat chmod cp cut date df find grep ip lsblk mount ps sed sort ss stat tar uname)
optional=(apt dnf rpm zypper journalctl systemctl nmcli chronyc dig host gpg ssh-keygen shellcheck tmux parted losetup)
missing_required=0

printf '# Linux Administration Lab Validation\n'
printf 'Generated: %s\n' "$(date --iso-8601=seconds)"
printf 'Host: %s\n\n' "$(hostname)"

printf '## Operating System\n'
cat /etc/os-release 2>/dev/null || true
uname -a

printf '\n## Required Commands\n'
for cmd in "${required[@]}"; do
  if command -v "$cmd" >/dev/null 2>&1; then
    printf '[OK]      %s -> %s\n' "$cmd" "$(command -v "$cmd")"
  else
    printf '[MISSING] %s\n' "$cmd"
    missing_required=1
  fi
done

printf '\n## Optional Commands\n'
for cmd in "${optional[@]}"; do
  if command -v "$cmd" >/dev/null 2>&1; then
    printf '[OK]      %s -> %s\n' "$cmd" "$(command -v "$cmd")"
  else
    printf '[OPTIONAL] %s is not installed\n' "$cmd"
  fi
done

printf '\n## Privilege and Init\n'
id
if command -v sudo >/dev/null 2>&1; then
  if sudo -n true 2>/dev/null; then
    printf 'Passwordless or cached sudo is available.\n'
  else
    printf 'sudo is installed; authentication may be required.\n'
  fi
fi
if [[ -d /run/systemd/system ]]; then
  printf 'systemd appears to be the active init system.\n'
else
  printf 'systemd does not appear to be active. Some labs require adaptation.\n'
fi

if (( missing_required )); then
  printf '\nValidation failed: one or more required commands are missing.\n' >&2
  exit 1
fi
printf '\nValidation passed. Optional tools may still be needed for specific labs.\n'
