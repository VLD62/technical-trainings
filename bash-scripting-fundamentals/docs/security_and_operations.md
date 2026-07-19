# Security and Operations

## Input Validation

Validate values against an allowlist or expected format where possible:

```bash
case $environment in
    dev|test|prod) ;;
    *) die "Unsupported environment: $environment" 64 ;;
esac
```

A value being non-empty does not make it safe or correct.

## Quoting and Argument Boundaries

```bash
command -- "$user_path"
```

Unquoted expansion can cause word splitting and pathname expansion. A path beginning with `-` may be treated as an option unless `--` is used.

## Avoid `eval`

`eval` performs another shell parsing pass. Input that reaches it can become code. Prefer arrays, `case`, explicit functions, or configuration data that is parsed without shell evaluation.

## Temporary Files

Use `mktemp` and a restrictive umask:

```bash
umask 077
tmp_dir=$(mktemp -d)
```

Register cleanup immediately and guard recursive deletion carefully.

## Secrets

Do not store secrets in:

- Source files
- Git history
- Command-line arguments
- Debug traces
- World-readable environment dumps
- Temporary files with broad permissions

Use an approved secret-management mechanism and minimize how long secret values remain available.

## Privileges

- Avoid running entire scripts as root
- Isolate the smallest privileged command
- Reset or control `PATH` in privileged contexts
- Validate file ownership and permissions
- Avoid writing through symlinks in attacker-controlled directories
- Use least privilege for service accounts and CI runners

## Destructive Actions

Before deletion or replacement:

1. Normalize and validate the target boundary.
2. Reject empty or root-like paths.
3. Show a dry run.
4. Use a dedicated working directory.
5. Test recovery or backup behavior.
6. Log what changed without exposing secrets.

## Cron

Cron jobs should use:

- Explicit interpreter
- Explicit PATH
- Absolute working paths
- Redirected logs
- Locking when overlapping runs are unsafe
- Clear ownership and permissions

Example crontab entry:

```cron
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
15 2 * * * /opt/tools/report.sh --output /var/lib/reports/daily.txt >>/var/log/report.log 2>&1
```

## systemd Timers

Systemd can provide environment isolation, logs, dependency ordering, resource limits, and failure handling. Keep the script independently runnable and place service-specific policy in the unit where appropriate.

## CI/CD

- Do not assume an interactive shell
- Use repository-relative paths derived from `BASH_SOURCE`
- Fail clearly when tools are missing
- Keep generated output in the job workspace
- Mask secrets and avoid trace mode
- Publish test and lint results when supported

## Operational Handover

Document:

- Purpose and owner
- Supported systems and Bash version
- Required commands and permissions
- Inputs, outputs, and exit codes
- Scheduling and concurrency behavior
- Logs and monitoring
- Failure recovery and rollback
- Test and deployment procedure
