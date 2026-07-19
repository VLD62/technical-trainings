---
marp: true
paginate: true
---

# Session 2

## Variables, Quoting, and Expansion

---

## Variables

```bash
name='Alice'
count=3
readonly course='Bash Fundamentals'
printf '%s attends %s for %d sessions\n' "$name" "$course" "$count"
```

No spaces are allowed around `=` in an assignment.

---

## Environment Variables

```bash
export APP_ENV='training'
APP_ENV='test' bash -c 'printf "%s\n" "$APP_ENV"'
```

- Shell variables belong to the current shell
- Exported variables are inherited by child processes
- Child processes cannot directly modify the parent environment

---

## Positional and Special Parameters

```bash
printf 'script=%s\n' "$0"
printf 'first=%s\n' "${1:-missing}"
printf 'count=%s\n' "$#"
printf 'all=%s\n' "$*"
printf 'pid=%s\n' "$$"
```

Prefer `"$@"` when forwarding arguments:

```bash
some_command "$@"
```

---

## Quoting Rules

```bash
single='$HOME is not expanded'
double="$HOME is expanded"
literal="A quote: \""
```

- Single quotes preserve every character
- Double quotes allow parameter and command expansion
- Backslash escapes selected characters
- Unquoted expansions may split words and expand wildcards

---

## The Safe Default

```bash
file='Quarterly Report.txt'
cat -- "$file"
```

Unsafe:

```bash
cat $file
```

Quote expansions unless splitting or globbing is explicitly required and reviewed.

---

## Parameter Expansion

```bash
name=${1:-guest}
: "${CONFIG_FILE:=./config.env}"
required=${API_URL:?API_URL must be set}
printf '%s\n' "${name^^}" "${name#?}"
```

Common forms:

- `${var:-default}` use a default
- `${var:=default}` assign a default
- `${var:?message}` require a value
- `${#var}` length
- `${var#pattern}` remove shortest prefix
- `${var%pattern}` remove shortest suffix

---

## Other Expansions

```bash
backup="report-$(date +%Y%m%d).txt"
next=$((count + 1))
printf '%s\n' file-{1..3}.txt
printf '%s\n' ./*.md
```

Expansion order matters. Observe the final arguments with:

```bash
printf '<%s>\n' ...
```
