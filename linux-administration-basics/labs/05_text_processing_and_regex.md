# Lab 5 – Text Processing, Streams, Regex, and vi

## Objectives

- Build text-processing pipelines
- Redirect stdout and stderr independently
- Use basic and extended regular expressions
- Perform essential vi operations

## Setup

```bash
LAB_DIR=$(mktemp -d /tmp/lpic-text.XXXXXX)
cd "$LAB_DIR"
cat > access.log <<'EOF'
2026-07-18 INFO 10.0.0.10 GET /health 200 12
2026-07-18 WARN 10.0.0.11 GET /api 429 31
2026-07-18 ERROR 10.0.0.12 POST /login 500 88
2026-07-18 INFO 10.0.0.10 GET /api 200 25
2026-07-18 ERROR 10.0.0.13 GET /data 503 102
EOF
```

## Filters

```bash
cut -d' ' -f2 access.log | sort | uniq -c | sort -nr
awk '{sum += $7} END {print sum}' access.log
tr '[:lower:]' '[:upper:]' < access.log | head
wc -l -w -c access.log
```

Repeat the aggregation without `awk` by combining `cut`, `paste`, or shell arithmetic where practical. Discuss tool choice.

## Streams and Redirection

```bash
{ cat access.log; cat missing.log; } >stdout.log 2>stderr.log
wc -l stdout.log stderr.log
{ cat access.log; cat missing.log; } 2>&1 | tee combined.log
```

Explain the ordering difference between `2>&1 >file` and `>file 2>&1`.

## Regular Expressions

```bash
grep '^2026-07-18' access.log
grep -E ' (WARN|ERROR) ' access.log
grep -E ' [45][0-9]{2} ' access.log
grep -Eo '10\.0\.0\.[0-9]+' access.log | sort -u
sed -E 's/10\.0\.0\.[0-9]+/[REDACTED]/g' access.log
```

Create a regex that matches only GET requests returning 5xx status codes.

## Safe xargs

```bash
mkdir files
touch 'files/normal.txt' 'files/with space.txt'
find files -type f -print0 | xargs -0 sha256sum
```

## vi Practice

Open a copy:

```bash
cp access.log edit.log
vi edit.log
```

Practice:

- Move using `h`, `j`, `k`, and `l`
- Search for `ERROR`
- Copy and paste a line with `yy` and `p`
- Delete a line with `dd`
- Open a new line with `o`
- Save with `:w`
- Quit with `:q`

## Cleanup

```bash
cd /
rm -rf "$LAB_DIR"
```

## Validation

- You can explain descriptors 0, 1, and 2.
- You can distinguish basic and extended regex syntax.
- You can handle null-delimited filenames.
- You can edit and save a file in vi without using arrow keys.
