#!/usr/bin/env python3
"""Validate the interpreter and repository structure."""

from __future__ import annotations

import argparse
import platform
import sys
from pathlib import Path
from typing import Sequence

MINIMUM_VERSION = (3, 10)

EXPECTED = (
    "README.md",
    "MANIFEST.md",
    "Makefile",
    "slides/00_course_introduction.md",
    "docs/lab_setup.md",
    "labs/09_final_project.md",
    "examples/01_basics/system_report.py",
    "examples/09_project/log_analyzer.py",
    "quizzes/knowledge_check.md",
)


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description="Validate training environment.")
    parser.add_argument("--check-repository", action="store_true")
    return parser


def main(argv: Sequence[str] | None = None) -> int:
    args = build_parser().parse_args(argv)
    repository = Path(__file__).resolve().parents[1]
    errors: list[str] = []

    print(f"Python:     {platform.python_version()}")
    print(f"Executable: {sys.executable}")
    print(f"Platform:   {platform.platform()}")
    print(f"Repository: {repository}")

    if sys.version_info < MINIMUM_VERSION:
        errors.append("Python 3.10 or newer is required")

    if args.check_repository:
        errors.extend(
            f"missing expected path: {path}"
            for path in EXPECTED
            if not (repository / path).exists()
        )

    if errors:
        print("\nValidation failed:")
        for error in errors:
            print(f"- {error}")
        return 1

    print("\nValidation successful.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
