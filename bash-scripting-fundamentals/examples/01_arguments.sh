#!/usr/bin/env bash
set -u

usage() {
    printf 'Usage: %s NAME COUNT\n' "$0"
}

main() {
    if (( $# != 2 )); then
        usage >&2
        return 64
    fi

    local name=$1
    local count=$2

    if [[ -z $name ]]; then
        printf 'ERROR: NAME must not be empty.\n' >&2
        return 65
    fi

    if [[ ! $count =~ ^[0-9]+$ ]] || (( count < 1 )); then
        printf 'ERROR: COUNT must be a positive integer.\n' >&2
        return 65
    fi

    local index
    for ((index = 1; index <= count; index++)); do
        printf '%d: Hello, %s!\n' "$index" "$name"
    done
}

main "$@"
