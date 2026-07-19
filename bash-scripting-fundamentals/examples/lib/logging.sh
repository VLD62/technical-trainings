#!/usr/bin/env bash

log_timestamp() {
    date -u '+%Y-%m-%dT%H:%M:%SZ'
}

log_info() {
    printf '%s [INFO] %s\n' "$(log_timestamp)" "$*" >&2
}

log_warning() {
    printf '%s [WARN] %s\n' "$(log_timestamp)" "$*" >&2
}

log_error() {
    printf '%s [ERROR] %s\n' "$(log_timestamp)" "$*" >&2
}
