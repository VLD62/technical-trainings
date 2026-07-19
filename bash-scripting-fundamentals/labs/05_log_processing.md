# Lab 05 - Log Processing

## Goal

Analyze `examples/data/application.log` and create `log_report.sh`.

## Log Format

```text
TIMESTAMP LEVEL COMPONENT MESSAGE
```

## Requirements

- Require a readable log file.
- Count total lines.
- Count `INFO`, `WARN`, and `ERROR` entries.
- Count entries by component.
- Print the first and last timestamp.
- Accept an optional level filter.
- Use `grep` and `awk` intentionally rather than a fragile chain of unnecessary commands.
- Treat no matching lines as a valid result, not a script crash.

## Test Cases

```bash
bash log_report.sh examples/data/application.log
bash log_report.sh examples/data/application.log ERROR
bash log_report.sh missing.log
```

## Extension

Add CSV output without mixing human-readable headings into the data stream.
