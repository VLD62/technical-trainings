---
marp: true
paginate: true
---

# Session 6

## Robust Scripts, Debugging, and Testing

---

## Strict Mode Is a Tool, Not a Guarantee

```bash
set -Eeuo pipefail
```

- `-e`: exit after selected unhandled failures
- `-E`: inherit `ERR` traps in functions and subshell contexts
- `-u`: fail on unset variables
- `pipefail`: pipeline status reflects the rightmost failure

Understand exceptions and test the actual script behavior.

---

## Explicit Error Functions

```bash
die() {
    local message=$1
    local status=${2:-1}
    printf 'ERROR: %s\n' "$message" >&2
    exit "$status"
}

[[ -d $source ]] || die "Source directory not found: $source" 66
```

Explicit checks make the intended failure path visible.

---

## Cleanup and Signals

```bash
cleanup() {
    local status=$?
    [[ -n ${tmp_dir:-} && -d $tmp_dir ]] && rm -rf -- "$tmp_dir"
    exit "$status"
}

trap cleanup EXIT INT TERM
```

Preserve the original status and make cleanup safe when initialization is incomplete.

---

## Syntax and Trace Debugging

```bash
bash -n script.sh
bash -x script.sh arg1
PS4='+${BASH_SOURCE}:${LINENO}:${FUNCNAME[0]}: ' bash -x script.sh
```

Trace output may expose secrets. Use it only in controlled environments and redact logs.

---

## Targeted Debug Logging

```bash
DEBUG=${DEBUG:-false}

debug() {
    [[ $DEBUG == true ]] || return 0
    printf '[DEBUG] %s\n' "$*" >&2
}
```

Targeted logs are often more useful and safer than tracing every expanded command.

---

## Static Analysis and Formatting

```bash
shellcheck -x examples/*.sh
shfmt -d -i 4 -ci -bn examples scripts tests
```

- ShellCheck detects many quoting, portability, and logic problems
- `shfmt` enforces predictable formatting
- Neither replaces tests or code review

---

## Test the Interface

Test:

- Success status and output
- Invalid options and missing arguments
- Missing files and command failures
- Paths containing spaces
- Empty input
- Repeated execution
- Cleanup after interruption or failure

---

## Idempotency

An idempotent automation can be run repeatedly without creating unintended additional changes.

Prefer:

```bash
mkdir -p -- "$directory"
```

Over:

```bash
mkdir "$directory"
```

But still validate that an existing object has the expected type and ownership.
