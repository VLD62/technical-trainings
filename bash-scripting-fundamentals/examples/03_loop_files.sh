#!/usr/bin/env bash
set -u

usage() {
    printf 'Usage: %s DIRECTORY PATTERN\n' "$0"
}

main() {
    if (( $# != 2 )); then
        usage >&2
        return 64
    fi

    local directory=$1
    local pattern=$2

    if [[ ! -d $directory ]]; then
        printf 'ERROR: Directory not found: %s\n' "$directory" >&2
        return 66
    fi

    local count=0
    local file
    while IFS= read -r -d '' file; do
        printf '%s\n' "$file"
        ((count += 1))
    done < <(find "$directory" -maxdepth 1 -type f -name "$pattern" -print0)

    printf 'Matched files: %d\n' "$count" >&2
}

main "$@"
