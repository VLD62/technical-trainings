# Session 1: Python Script Fundamentals

## Learning Topics

- Executing code in the interactive shell and from `.py` files
- Variables, scalar types, strings, formatting, input, and output
- Dynamic typing does not mean that values have no types
- Using `main()` as an explicit application boundary
- Returning process exit codes and using `raise SystemExit(main())`

## Example

```python
def main() -> int:
    print("Running")
    return 0

if __name__ == "__main__":
    raise SystemExit(main())
```

## Review

- What responsibility is being introduced?
- Which errors should be visible to the caller?
- How can the code remain easy to test?
