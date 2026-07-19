---
marp: true
paginate: true
---

# Session 1

## Shell and Script Foundations

---

## Terminal, Shell, and Bash

- A **terminal** provides the interactive text interface
- A **shell** reads commands and starts programs
- **Bash** is one shell implementation
- A **shell script** is a file containing commands interpreted by a shell

The terminal is not Bash, and Bash is not the operating system.

---

## Interactive and Non-Interactive Execution

```bash
bash
bash script.sh
bash -c 'printf "%s\n" hello'
./script.sh
```

Non-interactive automation may not load the same profile files, aliases, functions, or PATH as an interactive terminal.

---

## The Shebang

```bash
#!/usr/bin/env bash
```

- Selects Bash through the current `PATH`
- Useful for training and user-managed environments

```bash
#!/bin/bash
```

- Uses a fixed interpreter path
- Often preferred for controlled Linux production systems

Choose deliberately and document the supported environment.

---

## Creating and Running a Script

```bash
cat > hello.sh <<'EOF'
#!/usr/bin/env bash
printf 'Hello from Bash\n'
EOF

chmod +x hello.sh
./hello.sh
```

Alternative:

```bash
bash hello.sh
```

---

## Commands, Builtins, and PATH

```bash
type printf
type cd
type grep
command -v bash
command -v shellcheck
```

- Builtins execute inside the current shell
- External commands are found through `PATH`
- Aliases are mainly interactive conveniences
- Use `command -v` to test command availability

---

## Exit Status

```bash
grep -q 'root' /etc/passwd
printf 'status=%s\n' "$?"
```

- `0` means success
- Non-zero means failure or another documented result
- Conditions in Bash are based on command status

```bash
if grep -q 'root' /etc/passwd; then
    printf 'found\n'
fi
```

---

## Help and Discovery

```bash
help printf
help [[
man bash
man grep
info coreutils
bash --version
```

Use the manual for behavior. Do not rely only on examples copied from unrelated environments.
