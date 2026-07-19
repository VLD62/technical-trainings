#!/usr/bin/env python3
"""Demonstrate composition and protocol-based design."""

from notifier import ConsoleNotifier, MemoryNotifier
from report_service import ReportService


def main() -> int:
    ReportService(ConsoleNotifier()).publish(
        "Deployment Report",
        {"failed": 1, "successful": 12, "total": 13},
    )

    memory = MemoryNotifier()
    ReportService(memory).publish("Test Report", {"checks": 5})
    print(f"captured_messages={len(memory.messages)}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
