---
marp: true
paginate: true
---

# Session 4

## Loops, Arrays, and Functions

---

## Loop Over Arguments

```bash
for item in "$@"; do
    printf '<%s>\n' "$item"
done
```

This preserves each original argument exactly.

---

## Loop Over Files Safely

```bash
shopt -s nullglob
files=(./logs/*.log)

for file in "${files[@]}"; do
    printf '%s\n' "$file"
done
```

Without `nullglob`, an unmatched pattern may remain literal.

---

## Read Lines Without Damaging Them

```bash
while IFS= read -r line; do
    printf '%s\n' "$line"
done < input.txt
```

- `IFS=` preserves leading and trailing whitespace
- `-r` prevents backslash interpretation
- Redirection avoids an unnecessary pipeline subshell

---

## Null-Delimited File Processing

```bash
while IFS= read -r -d '' file; do
    printf '%s\n' "$file"
done < <(find . -type f -print0)
```

This handles spaces, tabs, quotes, and newlines in filenames.

---

## Indexed Arrays

```bash
services=(ssh cron docker)
services+=(nginx)

printf 'first=%s\n' "${services[0]}"
printf 'count=%s\n' "${#services[@]}"
printf '%s\n' "${services[@]}"
```

Always quote `"${array[@]}"` when each element must remain a separate argument.

---

## Functions

```bash
log_info() {
    local message=$1
    printf '[INFO] %s\n' "$message"
}
```

- Function arguments are positional parameters
- `local` reduces accidental global state
- `return` communicates status from 0 to 255
- Standard output can communicate data

---

## Status Versus Output

```bash
is_even() {
    local value=$1
    (( value % 2 == 0 ))
}

square() {
    local value=$1
    printf '%d\n' "$((value * value))"
}
```

Use return status for true/false or success/failure. Use output for values.

---

## Executable and Sourceable Files

```bash
main() {
    printf 'running main\n'
}

if [[ ${BASH_SOURCE[0]} == "$0" ]]; then
    main "$@"
fi
```

This allows functions to be tested or reused without automatically running the program body.
