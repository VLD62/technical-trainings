---
marp: true
paginate: true
---

# Session 5

## Files, Streams, and Text Processing

---

## Standard Streams

- File descriptor `0`: standard input
- File descriptor `1`: standard output
- File descriptor `2`: standard error

```bash
printf 'normal output\n'
printf 'error output\n' >&2
```

Keep machine-readable data on stdout and diagnostics on stderr.

---

## Redirection

```bash
command > output.txt
command >> output.txt
command 2> errors.txt
command > all.txt 2>&1
command < input.txt
```

Order matters:

```bash
command 2>&1 > output.txt
```

This is not equivalent to `> output.txt 2>&1`.

---

## Pipelines

```bash
grep 'ERROR' application.log | awk '{count[$3]++} END {for (k in count) print k, count[k]}'
```

A pipeline connects stdout from one command to stdin of the next.

With `pipefail`, a failing earlier command can make the whole pipeline fail.

---

## Here Documents

```bash
cat <<'EOF'
$HOME is literal because the delimiter is quoted.
EOF
```

```bash
cat <<EOF
Home is expanded: $HOME
EOF
```

Choose the delimiter quoting based on whether expansion is intended.

---

## `grep`, `sed`, and `awk`

```bash
grep -E 'ERROR|WARN' application.log
sed -E 's/password=[^ ]+/password=REDACTED/g' config.log
awk '$3 == "ERROR" {count++} END {print count}' application.log
```

- `grep` selects lines
- `sed` transforms streams
- `awk` processes fields and records

---

## `find` and Safe Actions

```bash
find "$root" -type f -name '*.log' -print
find "$root" -type f -mtime +30 -print0 |
    xargs -0 --no-run-if-empty rm --
```

Always verify a destructive selection with `-print` before adding deletion.

---

## Temporary Directories

```bash
tmp_dir=$(mktemp -d)
cleanup() {
    rm -rf -- "$tmp_dir"
}
trap cleanup EXIT
```

- Avoid predictable temporary names
- Quote the path
- Register cleanup immediately
- Validate that a variable is non-empty before recursive removal

---

## Atomic Output Pattern

```bash
output='report.txt'
tmp_file=$(mktemp "${output}.tmp.XXXXXX")

produce_report > "$tmp_file"
mv -- "$tmp_file" "$output"
```

Readers see either the old complete file or the new complete file, not a partially written result.
