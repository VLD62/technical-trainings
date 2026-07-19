#!/usr/bin/env python3
"""Create a read-only backup plan."""

from __future__ import annotations

import argparse
import fnmatch
import logging
from dataclasses import dataclass
from pathlib import Path
from typing import Sequence


@dataclass(frozen=True)
class PlannedFile:
    source: Path
    relative_path: Path
    size_bytes: int


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description="Create a safe backup plan.")
    parser.add_argument("source", type=Path)
    parser.add_argument("destination", type=Path)
    parser.add_argument("--include", default="*")
    parser.add_argument("--exclude", action="append", default=[])
    parser.add_argument("--verbose", action="store_true")
    return parser


def discover_files(
    source: Path,
    include: str,
    exclusions: Sequence[str],
) -> list[PlannedFile]:
    if not source.is_dir():
        raise NotADirectoryError(f"source directory not found: {source}")

    selected: list[PlannedFile] = []
    for path in source.rglob("*"):
        if not path.is_file():
            continue
        if not fnmatch.fnmatch(path.name, include):
            continue
        if any(fnmatch.fnmatch(path.name, pattern) for pattern in exclusions):
            continue
        selected.append(
            PlannedFile(path, path.relative_to(source), path.stat().st_size)
        )
    return sorted(selected, key=lambda item: str(item.relative_path))


def main(argv: Sequence[str] | None = None) -> int:
    args = build_parser().parse_args(argv)
    logging.basicConfig(
        level=logging.DEBUG if args.verbose else logging.INFO,
        format="%(levelname)s %(message)s",
    )

    try:
        files = discover_files(args.source, args.include, args.exclude)
    except OSError as exc:
        logging.error("%s", exc)
        return 1

    print("Backup plan (dry run)")
    print(f"Source: {args.source.resolve()}")
    print(f"Destination: {args.destination.resolve()}")
    print(f"Files: {len(files)}")
    print(f"Bytes: {sum(item.size_bytes for item in files)}")

    for item in files:
        logging.debug("selected %s", item.relative_path)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
