#!/usr/bin/env bash
set -u

is_integer() {
    [[ $1 =~ ^-?[0-9]+$ ]]
}

add() {
    local left=$1
    local right=$2
    printf '%d\n' "$((left + right))"
}

subtract() {
    local left=$1
    local right=$2
    printf '%d\n' "$((left - right))"
}

main() {
    if (( $# != 2 )); then
        printf 'Usage: %s INTEGER INTEGER\n' "$0" >&2
        return 64
    fi

    if ! is_integer "$1" || ! is_integer "$2"; then
        printf 'ERROR: Both arguments must be integers.\n' >&2
        return 65
    fi

    printf 'sum=%s\n' "$(add "$1" "$2")"
    printf 'difference=%s\n' "$(subtract "$1" "$2")"
}

if [[ ${BASH_SOURCE[0]} == "$0" ]]; then
    main "$@"
fi
