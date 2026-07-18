#!/usr/bin/env bash
set -Eeuo pipefail

printf '# Filesystem Report\n'
printf 'Generated: %s\n' "$(date --iso-8601=seconds)"
printf 'Host: %s\n\n' "$(hostname)"

printf '## Block Devices\n'
lsblk -o NAME,SIZE,TYPE,FSTYPE,LABEL,UUID,MOUNTPOINTS

printf '\n## Mounted Filesystems\n'
findmnt --real --output TARGET,SOURCE,FSTYPE,OPTIONS

printf '\n## Capacity\n'
df -hT -x tmpfs -x devtmpfs

printf '\n## Inodes\n'
df -i -x tmpfs -x devtmpfs

printf '\n## Largest Top-Level Directories on Root Filesystem\n'
if [[ ${EUID:-$(id -u)} -eq 0 ]]; then
  du -xhd1 / 2>/dev/null | sort -h
else
  printf 'Run with sudo for a complete root-filesystem directory report.\n'
  du -xhd1 "$HOME" 2>/dev/null | sort -h
fi

printf '\n## fstab Active Entries\n'
if [[ -r /etc/fstab ]]; then
  grep -Ev '^[[:space:]]*(#|$)' /etc/fstab || true
fi
