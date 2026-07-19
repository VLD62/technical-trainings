# Session 0: Course Introduction

## Learning Topics

- Why Python is useful when shell commands become difficult to maintain
- Common automation scenarios: files, reports, validation, APIs, CI/CD helpers
- Python interpreter, terminal, editor, Git, and virtual environment
- Course progression from one script to a tested OOP command-line tool
- Principles: predictable, safe, observable, testable, and readable automation

## Example

```bash
python3 --version
python3 -m venv .venv
source .venv/bin/activate
python scripts/validate_environment.py
```

## Review

- What responsibility is being introduced?
- Which errors should be visible to the caller?
- How can the code remain easy to test?
