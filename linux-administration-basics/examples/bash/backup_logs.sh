#!/usr/bin/env bash
set -Eeuo pipefail

source_dir=${1:-/var/log}
destination_dir=${2:-./backups}

if [[ ! -d $source_dir ]]; then
  printf 'Source directory does not exist: %s\n' "$source_dir" >&2
  exit 2
fi

mkdir -p -- "$destination_dir"
timestamp=$(date +%Y%m%d-%H%M%S)
archive="$destination_dir/logs-$timestamp.tar.gz"
checksum="$archive.sha256"

tar -czf "$archive" -C "$source_dir" .
sha256sum "$archive" > "$checksum"

printf 'Archive: %s\nChecksum: %s\n' "$archive" "$checksum"
