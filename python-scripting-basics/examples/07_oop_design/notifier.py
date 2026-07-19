"""Protocol and notifier implementations."""

from __future__ import annotations

from pathlib import Path
from typing import Protocol


class Notifier(Protocol):
    def send(self, message: str) -> None:
        ...


class ConsoleNotifier:
    def send(self, message: str) -> None:
        print(message)


class FileNotifier:
    def __init__(self, path: Path) -> None:
        self.path = path

    def send(self, message: str) -> None:
        self.path.write_text(f"{message}\n", encoding="utf-8")


class MemoryNotifier:
    def __init__(self) -> None:
        self.messages: list[str] = []

    def send(self, message: str) -> None:
        self.messages.append(message)
