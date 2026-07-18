#!/usr/bin/env bash
set -Eeuo pipefail

limit=${1:-15}
if ! [[ $limit =~ ^[1-9][0-9]*$ ]]; then
  printf 'Usage: %s [positive-result-limit]\n' "$0" >&2
  exit 2
fi

printf '# Process Report\n'
printf 'Generated: %s\n' "$(date --iso-8601=seconds)"
printf 'Host: %s\n\n' "$(hostname)"

printf '## Uptime and Load\n'
uptime

printf '\n## Memory\n'
free -h

printf '\n## Top CPU Consumers\n'
ps -eo pid,ppid,user,stat,ni,%cpu,%mem,etime,comm --sort=-%cpu | head -n "$((limit + 1))"

printf '\n## Top Memory Consumers\n'
ps -eo pid,ppid,user,stat,ni,%cpu,%mem,etime,comm --sort=-%mem | head -n "$((limit + 1))"

printf '\n## Zombie Processes\n'
ps -eo pid,ppid,user,stat,comm | awk 'NR==1 || $4 ~ /^Z/'

printf '\n## Failed systemd Units\n'
if command -v systemctl >/dev/null 2>&1; then
  systemctl --failed --no-pager || true
else
  printf 'systemctl is not available\n'
fi
