#!/usr/bin/env bash
set -u

main() {
    printf 'Hello from Bash %s\n' "${BASH_VERSION}"
    printf 'User: %s\n' "${USER:-unknown}"
    printf 'Working directory: %s\n' "$PWD"
}

main "$@"
