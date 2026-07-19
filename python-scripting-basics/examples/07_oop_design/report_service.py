"""A service depending on notifier behavior."""

from __future__ import annotations

from notifier import Notifier


class ReportService:
    def __init__(self, notifier: Notifier) -> None:
        self._notifier = notifier

    def publish(self, title: str, metrics: dict[str, int]) -> str:
        lines = [title, "=" * len(title)]
        lines.extend(f"{key}: {value}" for key, value in sorted(metrics.items()))
        report = "\n".join(lines)
        self._notifier.send(report)
        return report
