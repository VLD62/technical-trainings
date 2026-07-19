# Session 7: OOP Design and Composition

## Learning Topics

- Composition models a `has-a` relationship
- Inheritance should represent a genuine and stable `is-a` relationship
- Abstract base classes define explicit contracts
- Protocols describe required behavior without forcing inheritance
- Dependency injection reduces coupling and improves testability

## Example

```python
class ReportService:
    def __init__(self, writer: ReportWriter) -> None:
        self.writer = writer
```

## Review

- What responsibility is being introduced?
- Which errors should be visible to the caller?
- How can the code remain easy to test?
