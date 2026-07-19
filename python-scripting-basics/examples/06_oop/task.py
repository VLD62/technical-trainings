"""Task domain object."""

from __future__ import annotations

from dataclasses import dataclass


@dataclass
class Task:
    title: str
    priority: int = 3
    completed: bool = False

    def __post_init__(self) -> None:
        self.title = self.title.strip()
        if not self.title:
            raise ValueError("task title must not be empty")
        if not 1 <= self.priority <= 5:
            raise ValueError("priority must be between 1 and 5")

    def complete(self) -> None:
        self.completed = True

    @classmethod
    def from_dict(cls, data: dict[str, object]) -> "Task":
        return cls(
            title=str(data["title"]),
            priority=int(data.get("priority", 3)),
            completed=bool(data.get("completed", False)),
        )
