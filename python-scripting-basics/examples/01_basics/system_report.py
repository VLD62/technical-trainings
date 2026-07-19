#!/usr/bin/env python3
"""Print a small portable system report."""

from __future__ import annotations

import getpass
import os
import platform
import sys
from pathlib import Path


def build_report() -> dict[str, str]:
    """Collect local runtime information."""
    return {
        "user": getpass.getuser(),
        "platform": platform.platform(),
        "python_version": platform.python_version(),
        "python_executable": sys.executable,
        "working_directory": str(Path.cwd()),
        "process_id": str(os.getpid()),
    }


def main() -> int:
    report = build_report()
    print("Python System Report")
    print("-" * 40)
    for key, value in report.items():
        print(f"{key.replace('_', ' ').title():20}: {value}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
