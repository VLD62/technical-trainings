# Session 3: Functions, Modules, and Packages

## Learning Topics

- Functions with one clear responsibility
- Positional, default, and keyword-only parameters
- Returning values instead of mixing calculations and output
- Every `.py` file is a module; packages group related modules
- Explicit imports, scope, type hints, and avoiding mutable global state

## Example

```python
def average(values: list[float]) -> float:
    if not values:
        raise ValueError("values must not be empty")
    return sum(values) / len(values)
```

## Review

- What responsibility is being introduced?
- Which errors should be visible to the caller?
- How can the code remain easy to test?
