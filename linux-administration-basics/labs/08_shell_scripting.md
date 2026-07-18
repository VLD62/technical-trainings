# Lab 8 – Shell Environment and Bash Scripting

## Objectives

- Inspect shell startup behavior and environment variables
- Create aliases and functions
- Write a safe administrative report script
- Use tests, loops, input, command substitution, and exit codes

## Environment Review

```bash
printf 'Shell: %s\n' "$SHELL"
printf 'PATH: %s\n' "$PATH"
env | sort | less
set | less
```

Identify which startup files exist for your user and distribution.

## Temporary Customization

```bash
alias ll='ls -alF'
function mkcd() { mkdir -p -- "$1" && cd -- "$1"; }
export LPIC_LAB=enabled
```

Open a child shell and confirm which values are inherited.

## Script Task

Create `health_report.sh` with these requirements:

- Use Bash and a strict-mode strategy
- Accept an optional output directory
- Validate that required commands exist
- Print hostname, timestamp, uptime, memory, filesystems, and listening sockets
- Use `LANG=C` for predictable command output where helpful
- Return non-zero when the output directory is invalid
- Quote every path variable

Start from:

```bash
#!/usr/bin/env bash
set -Eeuo pipefail

output_dir=${1:-./reports}

if [[ -e $output_dir && ! -d $output_dir ]]; then
  printf 'Error: %s is not a directory\n' "$output_dir" >&2
  exit 2
fi

mkdir -p -- "$output_dir"
report="$output_dir/health-$(date +%Y%m%d-%H%M%S).txt"

# Add command checks and report sections here.
```

## Loop Task

Use a loop to check whether these commands exist:

```text
ip
ss
findmnt
journalctl
```

Print `available` or `missing` and return a failure code if any required command is absent.

## Input Task

Write a small script that asks for a username with `read -r`, validates that it is not empty, and uses `getent passwd` to check whether it exists.

## Review

Run:

```bash
bash -n health_report.sh
shellcheck health_report.sh 2>/dev/null || true
./health_report.sh
printf 'Exit: %s\n' "$?"
```

## Validation

- You can explain login vs interactive shell files.
- You can distinguish shell and environment variables.
- Your script handles errors and quoted paths.
- You can explain every exit code used.
