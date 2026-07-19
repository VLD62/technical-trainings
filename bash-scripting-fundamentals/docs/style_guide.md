# Bash Style Guide

## Scope

This guide favors Bash-specific clarity, defensive input handling, predictable interfaces, and maintainability. It is not a POSIX `sh` portability guide.

## File Structure

A medium-sized executable script should usually contain:

1. Shebang
2. Shell options
3. Readonly constants
4. Utility and logging functions
5. Usage text
6. Argument parsing
7. Domain functions
8. `main`
9. Guard that calls `main "$@"`

```bash
main() {
    parse_args "$@"
    validate_args
    run_task
}

if [[ ${BASH_SOURCE[0]} == "$0" ]]; then
    main "$@"
fi
```

## Naming

- Functions and local variables: `lower_snake_case`
- Environment variables and constants: `UPPER_SNAKE_CASE`
- Boolean values: use explicit strings such as `true` and `false`
- Functions should describe actions: `create_archive`, `validate_input`
- Predicates should read as questions: `is_readable_file`, `command_exists`

## Quoting

Quote expansions by default:

```bash
cp -- "$source" "$destination"
```

Intentional exceptions include arithmetic contexts, the right side of `[[ ... == pattern ]]`, and controlled array expansion.

## Options and Filenames

Use `--` before caller-controlled filenames when the command supports it:

```bash
rm -- "$file"
grep -F -- "$pattern" "$file"
```

This prevents a filename beginning with `-` from being treated as an option.

## Output

- Use stdout for requested data
- Use stderr for logs, warnings, and errors
- Prefer `printf` over `echo`
- Do not mix decorative messages into machine-readable output
- Add `--quiet`, `--verbose`, or structured output only when the use case requires it

## Functions

- Keep functions focused
- Declare local variables with `local`
- Use return status for success/failure
- Use stdout for returned data only when command substitution is appropriate
- Avoid hidden dependencies on global mutable variables
- Pass important inputs explicitly

## Command Construction

Use arrays instead of strings:

```bash
command_args=(tar -czf "$archive")
command_args+=(-- "$source")
"${command_args[@]}"
```

Do not use `eval` to execute dynamically assembled text.

## Error Handling

- Validate required input near the start
- Check commands that may fail for expected reasons
- Add context to errors
- Preserve useful exit statuses
- Make cleanup safe after partial initialization
- Test the failure path, not only the happy path

## Destructive Operations

- Provide a dry-run mode
- Print the selected targets before modification
- Require explicit confirmation only for interactive tools, not unattended jobs
- Use backups or atomic replacement when appropriate
- Check that critical path variables are non-empty and expected

## Review Checklist

- Does `bash -n` pass?
- Does ShellCheck pass or have documented, narrow suppressions?
- Are all caller-controlled expansions safe?
- Are arrays used for argument lists?
- Are temporary files created with `mktemp`?
- Are success and failure statuses tested?
- Does the script run with a minimal environment?
- Is the script documented well enough for operational ownership?
