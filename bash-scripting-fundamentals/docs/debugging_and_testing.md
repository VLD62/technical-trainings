# Debugging and Testing

## Debugging Workflow

1. Reproduce the problem with the smallest safe input.
2. Run a syntax check.
3. Inspect the exact interpreter and environment.
4. Add targeted logs around assumptions.
5. Enable tracing only for the relevant section when possible.
6. Confirm command statuses and actual argument boundaries.
7. Add a regression test before or with the fix.

## Syntax Checking

```bash
bash -n script.sh
```

This parses the script but does not validate external commands, runtime paths, or logical behavior.

## Execution Tracing

```bash
bash -x script.sh
```

Improve trace context:

```bash
export PS4='+${BASH_SOURCE}:${LINENO}:${FUNCNAME[0]}: '
bash -x script.sh
```

Trace output contains expanded values and may expose secrets.

A narrow trace section is safer:

```bash
set -x
critical_function
set +x
```

## Inspecting Arguments

```bash
printf 'argc=%d\n' "$#"
printf 'arg=<%q>\n' "$@"
```

`%q` produces a shell-escaped representation useful for debugging Bash arguments.

## ShellCheck

```bash
shellcheck -x examples/*.sh scripts/*.sh tests/*.sh
```

Use suppressions only after understanding the warning:

```bash
# shellcheck disable=SC1091  # file path is resolved relative to the script directory
source "$script_dir/lib/logging.sh"
```

Keep suppressions close to the affected line and explain the reason.

## shfmt

```bash
shfmt -d -i 4 -ci -bn examples scripts tests
```

Use `-w` only when you intend to modify files:

```bash
shfmt -w -i 4 -ci -bn examples scripts tests
```

## Dependency-Free Tests

The included tests use Bash functions for assertions. They check:

- Exit status
- Expected output fragments
- Invalid argument behavior
- Paths containing spaces
- Archive creation
- Report generation

Run them with:

```bash
make test
```

## Optional Bats Tests

Bats can provide clearer test case organization for larger projects:

```bash
@test "help exits successfully" {
    run bash examples/07_system_report.sh --help
    [ "$status" -eq 0 ]
    [[ "$output" == *"Usage:"* ]]
}
```

## CI Quality Gate

A simple CI job should run:

```bash
make validate
make lint
make format-check
make test
```

Pin or document tool versions when formatting and lint output must be reproducible.
