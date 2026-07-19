#!/usr/bin/env python3
from __future__ import annotations

import re
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]

REQUIRED = [
    "README.md",
    "MANIFEST.md",
    "LICENSE.md",
    "Makefile",
    "slides/00_course_introduction.md",
    "slides/07_exam_review.md",
    "docs/kcna_objectives_mapping.md",
    "docs/exam_checklist.md",
    "labs/README.md",
    "examples/kind-config.yaml",
    "examples/manifests/deployment.yaml",
    "scripts/validate_environment.sh",
    "scripts/cluster_inventory.sh",
    "quizzes/03_mock_exam.md",
]

MARKDOWN_LINK = re.compile(r"\[[^\]]+\]\(([^)]+)\)")


def check_required() -> list[str]:
    errors: list[str] = []
    for relative in REQUIRED:
        if not (ROOT / relative).exists():
            errors.append(f"Missing required path: {relative}")
    return errors


def check_markdown_links() -> list[str]:
    errors: list[str] = []
    for path in ROOT.rglob("*.md"):
        text = path.read_text(encoding="utf-8")
        # Ignore fenced code examples, which may intentionally contain paths
        # relative to a parent repository rather than to this module.
        text = re.sub(r"```.*?```", "", text, flags=re.DOTALL)
        for target in MARKDOWN_LINK.findall(text):
            target = target.strip()
            if target.startswith(("http://", "https://", "mailto:", "#")):
                continue
            target = target.split("#", 1)[0]
            if not target:
                continue
            resolved = (path.parent / target).resolve()
            if not resolved.exists():
                errors.append(f"Broken local link in {path.relative_to(ROOT)}: {target}")
    return errors


def check_manifests() -> list[str]:
    errors: list[str] = []
    for path in (ROOT / "examples").rglob("*.yaml"):
        text = path.read_text(encoding="utf-8")
        if "apiVersion:" not in text or "kind:" not in text:
            errors.append(f"Manifest lacks apiVersion or kind: {path.relative_to(ROOT)}")
        if "\t" in text:
            errors.append(f"Tab found in YAML: {path.relative_to(ROOT)}")
    return errors


def check_shell() -> list[str]:
    errors: list[str] = []
    for path in (ROOT / "scripts").glob("*.sh"):
        result = subprocess.run(["bash", "-n", str(path)], capture_output=True, text=True)
        if result.returncode:
            errors.append(f"Shell syntax error in {path.relative_to(ROOT)}: {result.stderr.strip()}")
    return errors


def main() -> int:
    errors = []
    errors.extend(check_required())
    errors.extend(check_markdown_links())
    errors.extend(check_manifests())
    errors.extend(check_shell())

    if errors:
        print("Validation failed:")
        for error in errors:
            print(f"- {error}")
        return 1

    md_count = len(list(ROOT.rglob("*.md")))
    yaml_count = len(list(ROOT.rglob("*.yaml")))
    print(f"Validation passed: {md_count} Markdown files and {yaml_count} YAML files checked.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
