# Lab 03 - Conditions and Options

## Goal

Create `inspect_path.sh` that reports information about a path.

## Options

```text
inspect_path.sh [-v] PATH
```

## Requirements

- Parse `-v` with `getopts`.
- Distinguish a regular file, directory, symbolic link, and missing path.
- Report readability, writability, and executability.
- For a regular file, report whether it is empty.
- For a directory, report the number of direct entries.
- In verbose mode, print the resolved absolute path.
- Use documented exit codes for missing input and unsupported options.

## Test Cases

Use:

- A normal file
- An empty file
- A directory
- A symbolic link
- A path containing spaces
- A missing path

## Extension

Add `-q` quiet mode that communicates the result only through exit status.
