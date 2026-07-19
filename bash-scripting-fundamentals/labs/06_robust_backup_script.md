# Lab 06 - Robust Backup Script

## Goal

Create a safe archive script with cleanup and predictable behavior.

## Interface

```text
backup.sh --source DIR --destination DIR [--dry-run]
```

## Requirements

- Parse long options without `eval`.
- Validate that the source is a readable directory.
- Create the destination when missing.
- Reject a destination located inside the source.
- Use a restrictive `umask`.
- Create the archive through a temporary file.
- Atomically rename the completed archive.
- Remove temporary files through a trap.
- Include a timestamp in the archive name.
- Print diagnostics to stderr and the final archive path to stdout.
- In dry-run mode, make no filesystem changes.

## Test Cases

- Source path containing spaces
- Empty source directory
- Missing source
- Read-only destination
- Repeated runs
- Controlled interruption during archive creation

## Extension

Add `--exclude PATTERN` using a command array.
