#!/usr/bin/env bash
set -Eeuo pipefail

printf '# User and Access Report\n'
printf 'Generated: %s\n' "$(date --iso-8601=seconds)"
printf 'Host: %s\n\n' "$(hostname)"

printf '## Current Identity\n'
id

printf '\n## Logged-In Users\n'
who || true

printf '\n## Recent Logins\n'
last -n 20 || true

printf '\n## Local Login-Capable Accounts\n'
getent passwd | awk -F: '$7 !~ /(nologin|false)$/ {printf "%-24s uid=%-8s gid=%-8s home=%-30s shell=%s\n", $1,$3,$4,$6,$7}'

printf '\n## Local UID 0 Accounts\n'
getent passwd | awk -F: '$3 == 0 {print}'

printf '\n## SUID and SGID Files in Common Executable Paths\n'
find /usr/bin /usr/sbin /bin /sbin -xdev -type f -perm /6000 -printf '%m %u %g %p\n' 2>/dev/null | sort || true

printf '\n## Sudo Access for Current User\n'
if command -v sudo >/dev/null 2>&1; then
  sudo -n -l 2>/dev/null || printf 'Interactive authentication may be required for sudo -l.\n'
else
  printf 'sudo is not available\n'
fi
