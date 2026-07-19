# Practical Python Style Guide

## Naming

- Functions and variables: `snake_case`
- Classes: `PascalCase`
- Constants: `UPPER_CASE`
- Internal details: prefix with `_`

## Functions

Prefer small functions with explicit inputs and returned outputs.

```python
def normalize_host(raw: str) -> str:
    return raw.strip().lower()
```

## Imports

Group standard-library, third-party, and local imports. Avoid wildcard imports.

## Errors

Raise specific exceptions, include useful context, and preserve original failures with `raise ... from exc`.

## Type Hints

Use type hints on public functions and important data structures.

## Comments

Explain why the code exists, not what each obvious line does.

## Formatting

```bash
ruff format examples scripts
ruff check examples scripts
```
