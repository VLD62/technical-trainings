#!/usr/bin/env python3
"""Create a small Python CLI project scaffold."""

from __future__ import annotations

import argparse
import re
from pathlib import Path
from typing import Sequence

VALID_NAME = re.compile(r"^[a-z][a-z0-9_]*$")


def create_project(parent: Path, name: str) -> Path:
    if not VALID_NAME.fullmatch(name):
        raise ValueError("name must use snake_case")
    target = parent / name
    if target.exists():
        raise FileExistsError(f"target already exists: {target}")

    package = target / name
    tests = target / "tests"
    package.mkdir(parents=True)
    tests.mkdir()

    (target / "README.md").write_text(f"# {name}\n", encoding="utf-8")
    (target / ".gitignore").write_text(".venv/\n__pycache__/\n*.pyc\n", encoding="utf-8")
    (package / "__init__.py").write_text('"""Application package."""\n', encoding="utf-8")
    (package / "__main__.py").write_text(
        "def main() -> int:\n"
        f'    print("Hello from {name}")\n'
        "    return 0\n\n"
        'if __name__ == "__main__":\n'
        "    raise SystemExit(main())\n",
        encoding="utf-8",
    )
    (tests / "test_smoke.py").write_text(
        "import unittest\n\n"
        "class TestSmoke(unittest.TestCase):\n"
        "    def test_true(self) -> None:\n"
        "        self.assertTrue(True)\n",
        encoding="utf-8",
    )
    return target


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description="Create a Python CLI scaffold.")
    parser.add_argument("name")
    parser.add_argument("--directory", type=Path, default=Path.cwd())
    args = parser.parse_args(argv)

    try:
        created = create_project(args.directory, args.name)
    except (ValueError, OSError) as exc:
        print(f"error: {exc}")
        return 1

    print(f"Created project: {created}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
