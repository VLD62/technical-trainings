# Python Scripting Patterns

## Explicit Entry Point

```python
def main() -> int:
    return 0

if __name__ == "__main__":
    raise SystemExit(main())
```

## Functional Core, Imperative Shell

Keep transformations and calculations in testable functions. Keep filesystem access, environment variables, logging, and printing near the application boundary.

## Validate Early

Check paths, argument combinations, required fields, and value ranges before making changes.

## Use `pathlib`

Use `Path` objects instead of manual path string concatenation.

## Output and Logging

- Standard output: intentional program result
- Logging: diagnostics and operational information

## Safe Automation

For destructive actions, add dry-run behavior, explicit confirmation, narrow targets, and idempotent logic.

## Configuration Precedence

```text
CLI argument > environment variable > configuration file > default
```
