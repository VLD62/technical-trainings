# Lab 07 - Final Project

## System Health and Inventory Report

Build `system_report.sh` as a reusable operational command-line tool.

## Interface

```text
system_report.sh --output FILE [--verbose]
system_report.sh --help
```

## Required Sections

- Report generation timestamp
- Hostname and kernel
- Operating system information
- Uptime
- CPU count and load
- Memory summary
- Filesystem usage
- Top processes by CPU or memory
- Availability of a configurable command list

## Engineering Requirements

- Use functions for each report section.
- Validate options and output paths.
- Use a temporary file and atomic replacement.
- Clean up on `EXIT`, `INT`, and `TERM`.
- Continue with warnings when optional commands are unavailable.
- Keep report data on stdout or in the output file and logs on stderr.
- Support output paths containing spaces.
- Use stable, documented exit codes.
- Pass syntax checks, ShellCheck, formatting checks, and behavior tests.

## Suggested Functions

```text
usage
log_info
log_warning
die
command_exists
collect_identity
collect_os
collect_cpu
collect_memory
collect_filesystems
collect_processes
write_report
main
```

## Acceptance Tests

1. `--help` exits 0.
2. An unknown option exits non-zero and prints usage guidance.
3. A report is created in a directory containing spaces.
4. The report contains all required headings.
5. An unwritable destination fails without leaving a temporary file.
6. Repeated execution replaces the previous report cleanly.
7. Interrupting the script removes temporary output.
8. `make validate`, `make lint`, and `make test` pass.

## Review

Use `docs/style_guide.md` and `docs/security_and_operations.md` for peer review. Compare with `examples/07_system_report.sh` only after completing your own design.
