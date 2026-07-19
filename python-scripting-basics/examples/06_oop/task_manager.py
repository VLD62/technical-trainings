"""Task collection service."""

from __future__ import annotations

from collections import Counter

from task import Task


class TaskManager:
    def __init__(self) -> None:
        self._tasks: list[Task] = []

    def add(self, task: Task) -> None:
        if any(item.title.casefold() == task.title.casefold() for item in self._tasks):
            raise ValueError(f"duplicate task title: {task.title}")
        self._tasks.append(task)

    def complete(self, title: str) -> None:
        for task in self._tasks:
            if task.title.casefold() == title.casefold():
                task.complete()
                return
        raise KeyError(f"task not found: {title}")

    @property
    def tasks(self) -> tuple[Task, ...]:
        return tuple(self._tasks)

    @property
    def completion_percentage(self) -> float:
        if not self._tasks:
            return 0.0
        return sum(task.completed for task in self._tasks) / len(self._tasks) * 100

    def count_by_priority(self) -> dict[int, int]:
        return dict(sorted(Counter(task.priority for task in self._tasks).items()))
