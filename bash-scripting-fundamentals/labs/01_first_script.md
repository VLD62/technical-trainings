# Lab 01 - First Script

## Goal

Create an executable Bash script named `welcome.sh`.

## Requirements

- Use a Bash shebang.
- Print the current user, hostname, working directory, and current date.
- Use `printf`, not `echo`.
- Return exit status 0.
- Run both as `bash welcome.sh` and `./welcome.sh`.

## Starter

```bash
#!/usr/bin/env bash

# Add your implementation here.
```

## Verification

```bash
bash -n welcome.sh
chmod +x welcome.sh
./welcome.sh
printf 'status=%s\n' "$?"
```

## Extension

Print the Bash version and determine whether the script is running interactively.
