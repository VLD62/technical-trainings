---
marp: true
paginate: true
---

# Session 7

## Automation, Security, and Final Project

---

## Treat Inputs as Untrusted

Inputs include:

- Arguments and options
- Environment variables
- Filenames and directory entries
- Configuration files
- Command output
- Network responses
- User-supplied patterns

Validate format and allowed values before use.

---

## Avoid Command Construction as Strings

Unsafe:

```bash
command="grep $pattern $file"
eval "$command"
```

Safer:

```bash
args=(grep -F -- "$pattern" "$file")
"${args[@]}"
```

Arrays preserve argument boundaries and avoid another parsing pass.

---

## Credentials

- Do not hard-code secrets
- Avoid passing secrets in process arguments
- Prefer protected files, secret stores, or inherited file descriptors
- Restrict permissions with `umask`
- Never enable full trace logging around secrets

```bash
umask 077
```

---

## Privilege Boundaries

- Run as a normal user by default
- Check explicitly when root is required
- Keep privileged operations small and auditable
- Do not trust caller-controlled `PATH`
- Use absolute paths in highly controlled privileged scripts

---

## Non-Interactive Environments

Cron, systemd, containers, and CI runners may have:

- A minimal PATH
- A different working directory
- No terminal
- No profile scripts
- Different locale and timezone
- Read-only or ephemeral filesystems

Set required assumptions explicitly.

---

## Operational Interface

A reusable script should provide:

- `--help`
- Clear required and optional arguments
- Stable exit codes
- Diagnostics on stderr
- Machine-readable output when useful
- Dry-run mode for changes
- Version information for distributed tools

---

## Final Project Acceptance Criteria

The system report script must:

1. Parse `--output`, `--verbose`, and `--help`
2. Validate the output directory
3. Collect host, OS, uptime, CPU, memory, disk, and process data
4. Continue with a warning when an optional command is missing
5. Write through a temporary file and atomically replace the report
6. Clean temporary files on exit
7. Pass `bash -n`, project tests, and ShellCheck
8. Be safe for a path containing spaces

---

## Review Checklist

- Are all expansions intentionally quoted or unquoted?
- Can a filename be interpreted as an option?
- Are failure paths and exit codes clear?
- Is cleanup safe after partial initialization?
- Does the script work outside the author's terminal profile?
- Are logs free of credentials and sensitive data?
- Can another engineer operate and modify it confidently?
