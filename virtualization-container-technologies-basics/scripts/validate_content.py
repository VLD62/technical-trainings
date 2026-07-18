#!/usr/bin/env python3
"""Validate the public training package without external dependencies."""

from __future__ import annotations

from pathlib import Path
import re
import sys

ROOT = Path(__file__).resolve().parent.parent

REQUIRED = [
    "README.md",
    "MANIFEST.md",
    "Makefile",
    "slides/00_course_introduction.md",
    "slides/01_virtualization_fundamentals.md",
    "slides/02_containerization_fundamentals.md",
    "slides/03_virtual_machines_vs_containers.md",
    "slides/04_use_cases_and_architecture_patterns.md",
    "slides/05_practical_container_workflows.md",
    "slides/06_operations_security_and_next_steps.md",
    "docs/glossary.md",
    "docs/useful_links.md",
    "labs/README.md",
    "examples/hello-container/Dockerfile",
    "examples/hello-container/app.py",
    "examples/compose-stack/compose.yaml",
]

FORBIDDEN_PATTERNS = {
    "company branding": re.compile(rf"\b{'Bo' + 'sch'}\b", re.IGNORECASE),
    "internal organization code": re.compile(
        rf"\b(?:{'RB' + 'BG'}|{'EN' + 'G4'}|{'EN' + 'G41'})\b",
        re.IGNORECASE,
    ),
    "internal documentation URL": re.compile(
        "inside" + r"[-.]?" + "docu" + "pedia",
        re.IGNORECASE,
    ),
    "internal classification footer": re.compile(
        "all rights " + "reserved, also regarding",
        re.IGNORECASE,
    ),
}

TEXT_SUFFIXES = {".md", ".py", ".sh", ".yaml", ".yml", ".xml", ".conf", ".txt"}


def main() -> int:
    errors: list[str] = []

    for rel in REQUIRED:
        path = ROOT / rel
        if not path.is_file():
            errors.append(f"missing required file: {rel}")

    for path in sorted(ROOT.rglob("*")):
        if not path.is_file() or path.suffix not in TEXT_SUFFIXES and path.name not in {"Dockerfile", "Makefile"}:
            continue

        rel = path.relative_to(ROOT)
        text = path.read_text(encoding="utf-8")
        if not text.strip():
            errors.append(f"empty file: {rel}")
            continue

        for label, pattern in FORBIDDEN_PATTERNS.items():
            if pattern.search(text):
                errors.append(f"{label} found in {rel}")

        if path.suffix == ".md" and "\t" in text:
            errors.append(f"tab character found in Markdown: {rel}")

    if errors:
        print("Validation failed:")
        for error in errors:
            print(f"- {error}")
        return 1

    file_count = sum(1 for path in ROOT.rglob("*") if path.is_file())
    print(f"Validation passed: {file_count} files checked")
    return 0


if __name__ == "__main__":
    sys.exit(main())
