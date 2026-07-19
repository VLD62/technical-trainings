# Session 6: OOP — Classes and Objects

## Learning Topics

- Classes combine related state and behavior
- Instances hold their own state
- Constructors, instance methods, properties, and class methods
- Dataclasses reduce repetitive data-oriented code
- Encapsulation uses a small public interface and private-by-convention details

## Example

```python
from dataclasses import dataclass

@dataclass
class Task:
    title: str
    completed: bool = False
```

## Review

- What responsibility is being introduced?
- Which errors should be visible to the caller?
- How can the code remain easy to test?
