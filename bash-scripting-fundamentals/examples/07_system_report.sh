#!/usr/bin/env bash
set -Eeuo pipefail

script_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
# shellcheck source=examples/lib/logging.sh
source "$script_dir/lib/logging.sh"

usage() {
    cat <<'EOF'
Usage: system_report.sh --output FILE [--verbose]
       system_report.sh --help
EOF
}

die() {
    local message=$1
    local status=${2:-1}
    log_error "$message"
    exit "$status"
}

command_exists() {
    command -v "$1" >/dev/null 2>&1
}

output=''
verbose=false
tmp_file=''

cleanup() {
    local status=$?
    if [[ -n $tmp_file && -e $tmp_file ]]; then
        rm -f -- "$tmp_file"
    fi
    exit "$status"
}

trap cleanup EXIT INT TERM

collect_identity() {
    printf '## Identity\n'
    printf 'generated_utc=%s\n' "$(date -u '+%Y-%m-%dT%H:%M:%SZ')"
    printf 'hostname=%s\n' "$(hostname)"
    printf 'kernel=%s\n' "$(uname -srmo)"
    printf '\n'
}

collect_os() {
    printf '## Operating System\n'
    if [[ -r /etc/os-release ]]; then
        grep -E '^(NAME|VERSION|ID|VERSION_ID)=' /etc/os-release
    else
        printf 'os_release=unavailable\n'
    fi
    printf '\n'
}

collect_uptime() {
    printf '## Uptime and Load\n'
    if command_exists uptime; then
        uptime
    else
        printf 'uptime=unavailable\n'
    fi
    printf '\n'
}

collect_cpu() {
    printf '## CPU\n'
    if command_exists nproc; then
        printf 'logical_cpus=%s\n' "$(nproc)"
    else
        printf 'logical_cpus=unavailable\n'
    fi
    printf '\n'
}

collect_memory() {
    printf '## Memory\n'
    if command_exists free; then
        free -h
    else
        printf 'memory=unavailable\n'
    fi
    printf '\n'
}

collect_filesystems() {
    printf '## Filesystems\n'
    df -hP
    printf '\n'
}

collect_processes() {
    printf '## Top Processes by CPU\n'
    if command_exists ps; then
        ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 11
    else
        printf 'processes=unavailable\n'
    fi
    printf '\n'
}

collect_commands() {
    local commands=(bash grep sed awk find tar shellcheck shfmt)
    local item

    printf '## Command Availability\n'
    for item in "${commands[@]}"; do
        if command_exists "$item"; then
            printf '%s=available\n' "$item"
        else
            printf '%s=missing\n' "$item"
            [[ $verbose == true ]] && log_warning "Optional command is missing: $item"
        fi
    done
    printf '\n'
}

write_report() {
    collect_identity
    collect_os
    collect_uptime
    collect_cpu
    collect_memory
    collect_filesystems
    collect_processes
    collect_commands
}

while (( $# > 0 )); do
    case $1 in
        --output)
            (( $# >= 2 )) || die '--output requires a value.' 64
            output=$2
            shift 2
            ;;
        --verbose)
            verbose=true
            shift
            ;;
        -h|--help)
            usage
            exit 0
            ;;
        *)
            usage >&2
            die "Unknown option: $1" 64
            ;;
    esac
done

[[ -n $output ]] || die '--output is required.' 64

output_dir=$(dirname -- "$output")
mkdir -p -- "$output_dir" || die "Cannot create output directory: $output_dir" 73
[[ -w $output_dir ]] || die "Output directory is not writable: $output_dir" 73

umask 077
tmp_file=$(mktemp "$output.tmp.XXXXXX")
[[ $verbose == true ]] && log_info "Collecting system information."
write_report > "$tmp_file"
mv -- "$tmp_file" "$output"
tmp_file=''
log_info "Report created: $output"
