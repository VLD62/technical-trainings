# Practical Final Exam

Build a command-line utility named `service_inventory`.

## Input

A JSON array of services with:

- `name`
- `environment`
- `port`
- `enabled`

## Requirements

- Accept a JSON path as a positional argument
- Validate required fields and port ranges
- Reject duplicate service names
- Create a `Service` dataclass and `Inventory` class
- Support text and JSON report writers
- Add `--environment`, `--enabled-only`, `--format`, `--output`, and `--verbose`
- Report totals, enabled state, environments, and used ports
- Use type hints, `pathlib`, logging, and explicit exit codes
- Include at least eight unit tests
- Include setup and usage documentation

## Scoring

| Area | Points |
|---|---:|
| Input and validation | 20 |
| Functions and modules | 15 |
| OOP design | 20 |
| CLI and errors | 15 |
| Testing | 20 |
| Documentation and readability | 10 |
| **Total** | **100** |
