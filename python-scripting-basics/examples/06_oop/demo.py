#!/usr/bin/env python3
"""Demonstrate classes, objects, and encapsulation."""

from task import Task
from task_manager import TaskManager


def main() -> int:
    manager = TaskManager()
    manager.add(Task("Validate backup", priority=1))
    manager.add(Task("Update documentation", priority=3))
    manager.add(Task("Review logs", priority=2))
    manager.complete("Validate backup")

    for task in manager.tasks:
        state = "done" if task.completed else "pending"
        print(f"[{state}] P{task.priority} {task.title}")

    print(f"completion={manager.completion_percentage:.1f}%")
    print(f"by_priority={manager.count_by_priority()}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
