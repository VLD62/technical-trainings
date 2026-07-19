#!/usr/bin/env bash
set -u

usage() {
    printf 'Usage: %s LOG_FILE [LEVEL]\n' "$0"
}

main() {
    if (( $# < 1 || $# > 2 )); then
        usage >&2
        return 64
    fi

    local log_file=$1
    local level=${2:-}

    if [[ ! -r $log_file ]]; then
        printf 'ERROR: Log file is not readable: %s\n' "$log_file" >&2
        return 66
    fi

    if [[ -n $level ]]; then
        case $level in
            INFO|WARN|ERROR) ;;
            *)
                printf 'ERROR: LEVEL must be INFO, WARN, or ERROR.\n' >&2
                return 65
                ;;
        esac
    fi

    awk -v selected_level="$level" '
        selected_level == "" || $2 == selected_level {
            total++
            level_count[$2]++
            component_count[$3]++
            if (first == "") first = $1
            last = $1
        }
        END {
            printf "total=%d\n", total + 0
            printf "INFO=%d\n", level_count["INFO"] + 0
            printf "WARN=%d\n", level_count["WARN"] + 0
            printf "ERROR=%d\n", level_count["ERROR"] + 0
            if (first != "") {
                printf "first=%s\n", first
                printf "last=%s\n", last
            }
            for (component in component_count) {
                printf "component.%s=%d\n", component, component_count[component]
            }
        }
    ' "$log_file" | sort
}

main "$@"
