#!/usr/bin/env bash
set -u

required=(bash python3 grep sed awk find tar mktemp)
optional=(make shellcheck shfmt bats git)
missing_required=0

printf 'Bash training environment check\n\n'
printf 'Bash version: %s\n\n' "$BASH_VERSION"

printf 'Required tools:\n'
for tool in "${required[@]}"; do
    if command -v "$tool" >/dev/null 2>&1; then
        printf '  [OK]      %s\n' "$tool"
    else
        printf '  [MISSING] %s\n' "$tool"
        ((missing_required += 1))
    fi
done

printf '\nOptional tools:\n'
for tool in "${optional[@]}"; do
    if command -v "$tool" >/dev/null 2>&1; then
        printf '  [OK]      %s\n' "$tool"
    else
        printf '  [OPTIONAL] %s\n' "$tool"
    fi
done

if (( BASH_VERSINFO[0] < 4 || (BASH_VERSINFO[0] == 4 && BASH_VERSINFO[1] < 4) )); then
    printf '\nERROR: Bash 4.4 or newer is required.\n' >&2
    exit 1
fi

if (( missing_required > 0 )); then
    printf '\nERROR: %d required tool(s) are missing.\n' "$missing_required" >&2
    exit 1
fi

printf '\nEnvironment is ready for the core course.\n'
