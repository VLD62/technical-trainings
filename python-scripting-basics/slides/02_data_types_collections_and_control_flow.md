# Session 2: Data Types, Collections, and Control Flow

## Learning Topics

- Lists for ordered mutable values
- Tuples for ordered immutable values
- Dictionaries for key-value records
- Sets for uniqueness and membership tests
- Conditions, loops, truthiness, comprehensions, `enumerate`, and `zip`

## Example

```python
active_names = [
    server["name"]
    for server in servers
    if server["active"]
]
```

## Review

- What responsibility is being introduced?
- Which errors should be visible to the caller?
- How can the code remain easy to test?
