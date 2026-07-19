# Quiz 02 - Scenarios

## Scenario 1

A script contains:

```bash
for file in $(find "$directory" -type f); do
    rm $file
done
```

Identify at least four problems and propose a safer design.

## Scenario 2

A deployment script works in the author's terminal but fails from cron with `command not found`. Explain likely causes and remediation.

## Scenario 3

A script uses:

```bash
set -e
result=$(grep ERROR application.log)
printf '%s\n' "$result"
```

The script exits when there are no errors in the log. Explain why and redesign the logic.

## Scenario 4

A script builds this command:

```bash
cmd="tar -czf $archive $source"
eval "$cmd"
```

Explain the quoting and injection risks. Rewrite it using an array.

## Scenario 5

A report is written directly to its final path. Another process sometimes reads a partial report. Propose an atomic output pattern.

## Scenario 6

A cleanup handler contains:

```bash
rm -rf $tmp_dir
```

Explain the possible failure modes and write a safer cleanup function.

## Scenario 7

A function prints progress messages and a calculated value to stdout. A caller captures it with command substitution and receives all lines. Redesign the output interface.

## Suggested Answers

<details>
<summary>Show discussion points</summary>

1. Command substitution splits filenames; newline and whitespace are unsafe; unquoted removal is unsafe; a leading dash may become an option; deletion has no dry run or boundary validation. Use `find ... -print0`, a null-delimited read loop, quoted paths, `rm --`, and a verified selection or `-delete` after review.
2. Cron commonly has a minimal PATH, different working directory, no profile files, and missing environment variables. Set PATH explicitly, use absolute or script-relative paths, define required environment, and redirect logs.
3. `grep` returns 1 when no lines match, and `errexit` can treat that expected condition as failure. Put `grep` in an `if`, append an explicit allowed fallback, or use `awk` to produce a count while handling real read failures separately.
4. The string loses argument boundaries and `eval` parses attacker-controlled content as shell code. Use `args=(tar -czf "$archive" -- "$source")` and execute `"${args[@]}"`.
5. Write to a temporary file in the same filesystem, validate success, then use `mv` to replace the final path atomically.
6. Empty or split values can turn the command into an unintended deletion. Quote the variable, confirm it is non-empty and an expected temporary directory, use `rm -rf -- "$tmp_dir"`, and register cleanup immediately after creation.
7. Send progress and diagnostics to stderr and print only the calculated value to stdout, or use a global/output variable only when clearly documented.

</details>
