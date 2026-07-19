#!/usr/bin/env bash
set -Eeuo pipefail

usage() {
    cat <<'EOF'
Usage: backup_directory.sh --source DIR --destination DIR [--dry-run]
EOF
}

die() {
    local message=$1
    local status=${2:-1}
    printf 'ERROR: %s\n' "$message" >&2
    exit "$status"
}

source_dir=''
destination_dir=''
dry_run=false
tmp_archive=''

cleanup() {
    local status=$?
    if [[ -n $tmp_archive && -e $tmp_archive ]]; then
        rm -f -- "$tmp_archive"
    fi
    exit "$status"
}

trap cleanup EXIT INT TERM

while (( $# > 0 )); do
    case $1 in
        --source)
            (( $# >= 2 )) || die '--source requires a value.' 64
            source_dir=$2
            shift 2
            ;;
        --destination)
            (( $# >= 2 )) || die '--destination requires a value.' 64
            destination_dir=$2
            shift 2
            ;;
        --dry-run)
            dry_run=true
            shift
            ;;
        -h|--help)
            usage
            exit 0
            ;;
        *)
            die "Unknown option: $1" 64
            ;;
    esac
done

[[ -n $source_dir ]] || die '--source is required.' 64
[[ -n $destination_dir ]] || die '--destination is required.' 64
[[ -d $source_dir && -r $source_dir ]] || die "Source is not a readable directory: $source_dir" 66

source_abs=$(cd -- "$source_dir" && pwd -P)
mkdir_parent=$(dirname -- "$destination_dir")
[[ -d $mkdir_parent ]] || die "Destination parent does not exist: $mkdir_parent" 73

destination_abs=$(cd -- "$mkdir_parent" && pwd -P)/$(basename -- "$destination_dir")
case $destination_abs/ in
    "$source_abs"/*) die 'Destination must not be inside the source directory.' 65 ;;
esac

archive_name="$(basename -- "$source_abs")-$(date -u +%Y%m%dT%H%M%SZ).tar.gz"
final_archive="$destination_abs/$archive_name"

if [[ $dry_run == true ]]; then
    printf 'Would create: %s\n' "$final_archive"
    exit 0
fi

umask 077
mkdir -p -- "$destination_abs"
tmp_archive=$(mktemp "$destination_abs/.backup.tmp.XXXXXX")

tar -czf "$tmp_archive" -C "$(dirname -- "$source_abs")" -- "$(basename -- "$source_abs")"
mv -- "$tmp_archive" "$final_archive"
tmp_archive=''

printf '%s\n' "$final_archive"
