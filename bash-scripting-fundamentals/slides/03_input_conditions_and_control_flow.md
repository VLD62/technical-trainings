---
marp: true
paginate: true
---

# Session 3

## Input, Conditions, and Control Flow

---

## Validate Early

```bash
if (( $# < 1 )); then
    printf 'Usage: %s FILE\n' "$0" >&2
    exit 64
fi

file=$1
```

Good scripts reject invalid input before changing state.

---

## `[ ]` and `[[ ]]`

```bash
if [[ -f $file && -r $file ]]; then
    printf 'Readable file: %s\n' "$file"
fi
```

For Bash scripts, `[[ ... ]]` usually provides clearer string and pattern behavior than `[ ... ]`.

---

## String and Numeric Conditions

```bash
[[ -n $name ]]
[[ $env == production ]]
[[ $file == *.log ]]
(( retries > 0 ))
(( value % 2 == 0 ))
```

Use arithmetic contexts for integers instead of string comparison operators.

---

## File Conditions

```bash
[[ -e $path ]]  # exists
[[ -f $path ]]  # regular file
[[ -d $path ]]  # directory
[[ -r $path ]]  # readable
[[ -w $path ]]  # writable
[[ -x $path ]]  # executable
[[ $a -nt $b ]] # newer than
```

A successful test can become false between the check and the later operation. Handle operation failures too.

---

## `if` and Command Status

```bash
if output=$(some_command 2>&1); then
    printf 'success: %s\n' "$output"
else
    status=$?
    printf 'failed with %d: %s\n' "$status" "$output" >&2
fi
```

Test the command itself rather than testing `$?` in a separate statement.

---

## `case`

```bash
case ${1:-} in
    start|stop|status)
        action=$1
        ;;
    -h|--help)
        show_help
        exit 0
        ;;
    *)
        printf 'Unknown action\n' >&2
        exit 64
        ;;
esac
```

`case` is ideal for command modes, extensions, and pattern-based dispatch.

---

## Short-Circuit Operators

```bash
mkdir -p -- "$destination" && printf 'ready\n'
command -v jq >/dev/null 2>&1 || printf 'jq is missing\n' >&2
```

Use short forms for simple logic. Prefer `if` when error handling needs explanation or multiple steps.

---

## `getopts`

```bash
verbose=false
output='report.txt'

while getopts ':vo:' option; do
    case $option in
        v) verbose=true ;;
        o) output=$OPTARG ;;
        :) printf 'Option -%s requires a value\n' "$OPTARG" >&2; exit 64 ;;
        \?) printf 'Unknown option: -%s\n' "$OPTARG" >&2; exit 64 ;;
    esac
done
shift $((OPTIND - 1))
```

`getopts` handles short options. Long options require a custom parser or another tool.
