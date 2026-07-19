# Troubleshooting

## `Permission denied` When Running `./script.sh`

Check permissions and filesystem mount options:

```bash
ls -l script.sh
chmod +x script.sh
bash script.sh
```

The explicit `bash script.sh` form does not require the executable bit, but the file still needs to be readable.

## `/usr/bin/env: 'bash\r': No such file or directory`

The file has Windows CRLF line endings. Convert it to LF using the editor, `dos2unix`, or an approved equivalent.

Inspect hidden characters:

```bash
sed -n '1l' script.sh
```

## Script Works in Terminal but Fails in Cron or CI

Check:

- PATH
- Working directory
- Environment variables
- Credentials
- Locale and timezone
- File permissions
- Interactive aliases or functions

Use explicit paths and derive the script directory:

```bash
script_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
```

## `unbound variable`

The script is using `set -u` and referenced an unset variable.

Use an intentional default or validation:

```bash
value=${OPTIONAL_VALUE:-}
required=${REQUIRED_VALUE:?REQUIRED_VALUE is required}
```

## Pipeline Failure Is Hidden

Without `pipefail`, a pipeline normally reports the status of its last command.

```bash
set -o pipefail
```

Then handle expected non-zero statuses explicitly, such as `grep` returning 1 when no lines match.

## Filenames With Spaces Break a Loop

Unsafe:

```bash
for file in $(find . -type f); do
    ...
done
```

Safer:

```bash
while IFS= read -r -d '' file; do
    ...
done < <(find . -type f -print0)
```

## Variable Changes Disappear After a Pipeline

A loop in a pipeline may execute in a subshell:

```bash
count=0
producer | while read -r line; do
    ((count++))
done
```

Prefer redirection or process substitution when the updated variable is needed afterward.

## `set -e` Exits Unexpectedly or Does Not Exit

`errexit` has context-dependent rules. Do not treat it as exception handling. Add explicit checks around commands whose failure is expected or important.

## ShellCheck Cannot Find a Sourced File

Run ShellCheck from the repository root with `-x`, use a stable source path, and add a narrow documented directive only when necessary.

## Cleanup Removed the Wrong Path

Stop immediately and inspect how the path was built. Recursive deletion must validate that the path is non-empty, expected, and inside the intended boundary. Use disposable lab data while developing cleanup logic.
