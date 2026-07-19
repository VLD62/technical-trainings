# Bash Cheat Sheet

## Script Header

```bash
#!/usr/bin/env bash
set -Eeuo pipefail
```

Use strict options deliberately; they do not replace explicit validation.

## Output

```bash
printf 'Hello %s\n' "$name"
printf 'ERROR: %s\n' "$message" >&2
```

Prefer `printf` over `echo` for predictable formatting.

## Variables and Defaults

```bash
name='Alice'
readonly name
value=${1:-default}
: "${CONFIG_FILE:=./config.env}"
required=${API_URL:?API_URL must be set}
```

## Arguments

```bash
$0      # script name
$1      # first argument
$#      # argument count
"$@"    # all arguments, preserving boundaries
shift   # discard first positional argument
```

## Conditions

```bash
[[ -n $value ]]
[[ $value == pattern* ]]
[[ -f $file && -r $file ]]
(( count >= 3 ))
```

## Control Flow

```bash
if command; then
    :
elif other_command; then
    :
else
    :
fi
```

```bash
case $action in
    start) start_service ;;
    stop) stop_service ;;
    *) usage >&2; exit 64 ;;
esac
```

## Loops

```bash
for arg in "$@"; do
    printf '%s\n' "$arg"
done
```

```bash
while IFS= read -r line; do
    printf '%s\n' "$line"
done < file.txt
```

## Arrays

```bash
items=(one 'two words' three)
items+=(four)
printf '%s\n' "${items[@]}"
printf '%s\n' "${#items[@]}"
```

## Functions

```bash
log_info() {
    local message=$1
    printf '[INFO] %s\n' "$message" >&2
}
```

## Redirection

```bash
command > file
command >> file
command 2> errors
command > all 2>&1
command < input
```

## Temporary Directory and Cleanup

```bash
tmp_dir=$(mktemp -d)
cleanup() {
    local status=$?
    [[ -d ${tmp_dir:-} ]] && rm -rf -- "$tmp_dir"
    exit "$status"
}
trap cleanup EXIT INT TERM
```

## Debugging and Quality

```bash
bash -n script.sh
bash -x script.sh
shellcheck -x script.sh
shfmt -d -i 4 -ci -bn script.sh
```

## Common Exit Codes

There is no universal requirement for application-specific statuses, but these conventional values are useful when documented consistently:

- `0`: success
- `1`: general failure
- `2`: shell misuse or common command-specific error
- `64`: command-line usage error
- `65`: invalid data
- `66`: missing input
- `69`: unavailable service or dependency
- `70`: internal software error
- `73`: cannot create output
- `77`: permission problem
