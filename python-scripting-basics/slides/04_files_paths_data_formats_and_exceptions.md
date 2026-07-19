# Session 4: Files, Paths, Data Formats, and Exceptions

## Learning Topics

- Portable filesystem operations with `pathlib.Path`
- Reading and writing UTF-8 text files
- JSON objects and arrays with the `json` module
- CSV processing with `csv.DictReader` and `csv.DictWriter`
- Specific exception handling, context managers, and error chaining

## Example

```python
from pathlib import Path

content = Path("input.txt").read_text(encoding="utf-8")
```

## Review

- What responsibility is being introduced?
- Which errors should be visible to the caller?
- How can the code remain easy to test?
