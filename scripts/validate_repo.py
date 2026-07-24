#!/usr/bin/env python3
"""Repository-wide validation for the technical-trainings repository.

Runs fast, dependency-light checks that do not require cloud credentials or paid
services:

  * required top-level files exist
  * every module directory has a README.md
  * no unresolved placeholders (for example ``<repository-url>``)
  * no accidental organization-specific terms
  * relative Markdown links resolve to real files

Only Git-tracked files are inspected, so local build artifacts are ignored.

Exit code is 0 when all checks pass and 1 otherwise.
"""

from __future__ import annotations

import re
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]

REQUIRED_TOP_LEVEL = [
    "README.md",
    "LICENSE",
    "LICENSE-CONTENT.md",
    "CONTRIBUTING.md",
    "docs/repository-structure.md",
    "docs/adding-a-training-module.md",
    "templates/module-README.md",
]

# Unresolved placeholders that must never ship in tracked content.
PLACEHOLDER_PATTERNS = [
    re.compile(r"<repository-url>"),
    re.compile(r"<repo-url>"),
    re.compile(r"<your-repo[^>]*>"),
    re.compile(r"python-scripting-oop-basics"),
]

# Kept intentionally narrow to avoid false positives on legitimate technical terms
# (for example AWS "ECS" or a data-classification value of "confidential").
FORBIDDEN_TERMS = ("bosch", "eng41")

LINK_RE = re.compile(r"(?<!\!)\[[^\]]*\]\(([^)]+)\)")
IMAGE_RE = re.compile(r"\!\[[^\]]*\]\(([^)]+)\)")
FENCE_RE = re.compile(r"^\s*```")


def strip_code_fences(text: str) -> str:
    """Blank out fenced code blocks so paste-ready snippets are not link-checked."""
    out: list[str] = []
    in_fence = False
    for line in text.splitlines():
        if FENCE_RE.match(line):
            in_fence = not in_fence
            out.append("")
            continue
        out.append("" if in_fence else line)
    return "\n".join(out)


def tracked_files() -> list[Path]:
    result = subprocess.run(
        ["git", "-C", str(ROOT), "ls-files"],
        capture_output=True,
        text=True,
        check=True,
    )
    return [ROOT / line for line in result.stdout.splitlines() if line]


def module_dirs() -> list[Path]:
    return sorted(
        p
        for p in ROOT.iterdir()
        if p.is_dir() and not p.name.startswith(".") and p.name not in {"docs", "scripts", "templates"}
    )


def check_required_files() -> list[str]:
    return [
        f"missing required top-level file: {rel}"
        for rel in REQUIRED_TOP_LEVEL
        if not (ROOT / rel).exists()
    ]


def check_module_readmes() -> list[str]:
    return [
        f"module without README.md: {d.name}/"
        for d in module_dirs()
        if not (d / "README.md").exists()
    ]


def check_placeholders_and_terms(files: list[Path]) -> list[str]:
    errors: list[str] = []
    self_path = Path(__file__).resolve()
    for path in files:
        if path.suffix.lower() not in {".md", ".txt"}:
            continue
        if path.resolve() == self_path:
            continue
        try:
            text = path.read_text(encoding="utf-8")
        except (OSError, UnicodeDecodeError):
            continue
        rel = path.relative_to(ROOT)
        for pattern in PLACEHOLDER_PATTERNS:
            if pattern.search(text):
                errors.append(f"unresolved placeholder {pattern.pattern!r} in {rel}")
        lowered = text.lower()
        for term in FORBIDDEN_TERMS:
            if term in lowered:
                errors.append(f"forbidden term {term!r} in {rel}")
    return errors


def _is_external(target: str) -> bool:
    return (
        target.startswith("#")
        or target.startswith("http://")
        or target.startswith("https://")
        or target.startswith("mailto:")
        or "://" in target
    )


def check_links(files: list[Path]) -> list[str]:
    errors: list[str] = []
    for path in files:
        if path.suffix.lower() != ".md":
            continue
        try:
            text = path.read_text(encoding="utf-8")
        except (OSError, UnicodeDecodeError):
            continue
        rel = path.relative_to(ROOT)
        text = strip_code_fences(text)
        for match in list(LINK_RE.finditer(text)) + list(IMAGE_RE.finditer(text)):
            target = match.group(1).strip()
            # Drop an optional "title" component: (path "Title").
            target = target.split()[0] if target else target
            if not target or _is_external(target):
                continue
            local = target.split("#", 1)[0]
            if not local:  # pure in-page anchor
                continue
            resolved = (path.parent / local).resolve()
            if not resolved.exists():
                errors.append(f"broken link in {rel}: {target}")
    return errors


def main() -> int:
    files = tracked_files()
    checks = [
        ("required top-level files", check_required_files()),
        ("module READMEs", check_module_readmes()),
        ("placeholders and terms", check_placeholders_and_terms(files)),
        ("relative links", check_links(files)),
    ]

    total = 0
    for name, errors in checks:
        if errors:
            total += len(errors)
            print(f"[FAIL] {name}: {len(errors)} issue(s)")
            for error in errors:
                print(f"  - {error}")
        else:
            print(f"[ OK ] {name}")

    if total:
        print(f"\nValidation failed with {total} issue(s).")
        return 1
    print("\nAll repository checks passed.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
