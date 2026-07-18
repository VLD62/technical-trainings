#!/usr/bin/env bash
set -Eeuo pipefail

if (( $# == 0 )); then
  printf 'Usage: %s USER [USER ...]\n' "$0" >&2
  exit 2
fi

status=0
for username in "$@"; do
  if getent passwd "$username" >/dev/null; then
    printf '%-24s exists\n' "$username"
  else
    printf '%-24s missing\n' "$username"
    status=1
  fi
done
exit "$status"
