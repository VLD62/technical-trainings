#!/usr/bin/env bash
set -u

usage() {
    printf 'Usage: %s PATH\n' "$0"
}

main() {
    if (( $# != 1 )); then
        usage >&2
        return 64
    fi

    local path=$1

    if [[ -L $path ]]; then
        printf 'type=symbolic-link\n'
    elif [[ -f $path ]]; then
        printf 'type=regular-file\n'
    elif [[ -d $path ]]; then
        printf 'type=directory\n'
    elif [[ -e $path ]]; then
        printf 'type=other\n'
    else
        printf 'ERROR: Path does not exist: %s\n' "$path" >&2
        return 66
    fi

    [[ -r $path ]] && printf 'readable=yes\n' || printf 'readable=no\n'
    [[ -w $path ]] && printf 'writable=yes\n' || printf 'writable=no\n'
    [[ -x $path ]] && printf 'executable=yes\n' || printf 'executable=no\n'
}

main "$@"
