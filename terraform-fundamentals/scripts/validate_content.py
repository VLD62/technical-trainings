#!/usr/bin/env python3
"""Validate required course files and relative Markdown links."""

from __future__ import annotations

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]

REQUIRED = [
    "README.md",
    "MANIFEST.md",
    "LICENSE.md",
    "Makefile",
    ".gitignore",
    "slides/00_course_introduction.md",
    "slides/08_testing_security_automation_and_troubleshooting.md",
    "docs/lab_setup.md",
    "docs/cli_cheat_sheet.md",
    "docs/security_and_secrets.md",
    "labs/README.md",
    "labs/01_first_configuration.md",
    "labs/06_tests_security_and_ci.md",
    "examples/01-local-basics/main.tf",
    "examples/03-local-module/modules/naming/main.tf",
    "examples/06-tests/tests/naming.tftest.hcl",
    "scripts/validate_environment.sh",
    "quizzes/03_final_review.md",
]

LINK_RE = re.compile(r"\[[^\]]+\]\(([^)]+)\)")


def check_required() -> list[str]:
    errors = []
    for relative in REQUIRED:
        if not (ROOT / relative).exists():
            errors.append(f"Missing required file: {relative}")
    return errors


def check_markdown_links() -> list[str]:
    errors = []
    for markdown in ROOT.rglob("*.md"):
        text = markdown.read_text(encoding="utf-8")
        text_without_fences = re.sub(r"```.*?```", "", text, flags=re.DOTALL)
        for target in LINK_RE.findall(text_without_fences):
            if target.startswith(("http://", "https://", "mailto:", "#")):
                continue
            clean_target = target.split("#", 1)[0]
            if not clean_target:
                continue
            destination = (markdown.parent / clean_target).resolve()
            try:
                destination.relative_to(ROOT.resolve())
            except ValueError:
                errors.append(f"Link escapes course root: {markdown.relative_to(ROOT)} -> {target}")
                continue
            if not destination.exists():
                errors.append(f"Broken link: {markdown.relative_to(ROOT)} -> {target}")
    return errors


def main() -> int:
    errors = check_required() + check_markdown_links()
    if errors:
        print("Content validation failed:")
        for error in errors:
            print(f"- {error}")
        return 1

    markdown_count = sum(1 for _ in ROOT.rglob("*.md"))
    terraform_count = sum(1 for _ in ROOT.rglob("*.tf")) + sum(1 for _ in ROOT.rglob("*.tftest.hcl"))
    print(f"Content validation passed: {markdown_count} Markdown files, {terraform_count} Terraform files.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
