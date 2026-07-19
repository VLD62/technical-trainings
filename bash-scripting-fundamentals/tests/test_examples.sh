#!/usr/bin/env bash
set -Eeuo pipefail

root_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)
tmp_root=$(mktemp -d)
passed=0
failed=0

cleanup() {
    rm -rf -- "$tmp_root"
}
trap cleanup EXIT

pass() {
    printf 'PASS: %s\n' "$1"
    ((passed += 1))
}

fail() {
    printf 'FAIL: %s\n' "$1" >&2
    ((failed += 1))
}

assert_contains() {
    local value=$1
    local expected=$2
    [[ $value == *"$expected"* ]]
}

test_hello() {
    local output
    output=$(bash "$root_dir/examples/00_hello_bash.sh")
    assert_contains "$output" 'Hello from Bash'
}

test_arguments_success() {
    local output
    output=$(bash "$root_dir/examples/01_arguments.sh" 'Alice Smith' 2)
    assert_contains "$output" '2: Hello, Alice Smith!'
}

test_arguments_failure() {
    if bash "$root_dir/examples/01_arguments.sh" Alice invalid >/dev/null 2>&1; then
        return 1
    fi
}

test_path_with_spaces() {
    local file="$tmp_root/file with spaces.txt"
    printf 'data\n' > "$file"
    local output
    output=$(bash "$root_dir/examples/02_file_check.sh" "$file")
    assert_contains "$output" 'type=regular-file'
}

test_log_summary() {
    local output
    output=$(bash "$root_dir/examples/05_log_summary.sh" "$root_dir/examples/data/application.log")
    assert_contains "$output" 'ERROR=2'
    assert_contains "$output" 'WARN=2'
    assert_contains "$output" 'total=10'
}

test_backup_creation() {
    local source="$tmp_root/source data"
    local destination="$tmp_root/backups"
    mkdir -p -- "$source" "$destination"
    printf 'important\n' > "$source/file.txt"

    local archive
    archive=$(bash "$root_dir/examples/06_backup_directory.sh" --source "$source" --destination "$destination")
    [[ -f $archive ]]
    tar -tzf "$archive" | grep -q 'file.txt'
}

test_system_report() {
    local output_file="$tmp_root/report directory/system report.txt"
    bash "$root_dir/examples/07_system_report.sh" --output "$output_file" >/dev/null 2>&1
    [[ -s $output_file ]]
    grep -q '^## Identity' "$output_file"
    grep -q '^## Filesystems' "$output_file"
}

run_test() {
    local name=$1
    if "$name"; then
        pass "$name"
    else
        fail "$name"
    fi
}

for test_name in \
    test_hello \
    test_arguments_success \
    test_arguments_failure \
    test_path_with_spaces \
    test_log_summary \
    test_backup_creation \
    test_system_report; do
    run_test "$test_name"
done

printf '\nTests passed: %d\n' "$passed"
printf 'Tests failed: %d\n' "$failed"

(( failed == 0 ))
