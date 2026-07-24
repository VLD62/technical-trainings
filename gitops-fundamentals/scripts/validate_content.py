#!/usr/bin/env python3
"""Validate the GitOps Fundamentals course without requiring a live cluster."""

from __future__ import annotations

import argparse
import ast
import re
import subprocess
import sys
from pathlib import Path
from typing import Iterable

ROOT = Path(__file__).resolve().parents[1]

REQUIRED_PATHS = [
    "README.md",
    "MANIFEST.md",
    "LICENSE.md",
    "Makefile",
    "slides/00_course_introduction.md",
    "slides/08_flux_observability_and_final_design.md",
    "docs/lab_setup.md",
    "docs/security_and_secrets.md",
    "labs/01_cluster_and_argocd_setup.md",
    "labs/10_final_project.md",
    "examples/app/base/kustomization.yaml",
    "examples/app/overlays/dev/kustomization.yaml",
    "examples/argocd/applications/kustomize-dev.yaml",
    "examples/argocd/projects/training-project.yaml",
    "examples/argocd/applicationsets/demo-environments.yaml",
    "examples/helm/demo-app/Chart.yaml",
    "examples/flux/git-repository.yaml",
    "examples/ci/Jenkinsfile",
    "scripts/validate_environment.sh",
    "quizzes/04_final_assessment.md",
]

MARKDOWN_LINK = re.compile(r"(?<!!)\[[^\]]+\]\(([^)]+)\)")


def iter_files(suffixes: Iterable[str]) -> Iterable[Path]:
    for path in ROOT.rglob("*"):
        if path.is_file() and path.suffix.lower() in suffixes:
            yield path


def check_required_paths() -> list[str]:
    errors: list[str] = []
    for rel in REQUIRED_PATHS:
        if not (ROOT / rel).exists():
            errors.append(f"Missing required path: {rel}")
    return errors


def check_markdown_links() -> list[str]:
    errors: list[str] = []
    fenced_block = re.compile(r"```.*?```", re.DOTALL)
    for path in iter_files({".md"}):
        text = path.read_text(encoding="utf-8")
        text_without_code = fenced_block.sub("", text)
        for raw_target in MARKDOWN_LINK.findall(text_without_code):
            target = raw_target.strip().split("#", 1)[0]
            if not target or target.startswith(("http://", "https://", "mailto:")):
                continue
            if target.startswith("<") and target.endswith(">"):
                target = target[1:-1]
            resolved = (path.parent / target).resolve()
            try:
                resolved.relative_to(ROOT.resolve())
            except ValueError:
                errors.append(
                    f"{path.relative_to(ROOT)}: link escapes module root: {raw_target}"
                )
                continue
            if not resolved.exists():
                errors.append(
                    f"{path.relative_to(ROOT)}: broken relative link: {raw_target}"
                )
    return errors


def check_placeholders() -> list[str]:
    errors: list[str] = []
    allowed_roots = {
        Path("examples"),
        Path("docs"),
        Path("labs"),
        Path("slides"),
    }
    for path in ROOT.rglob("*"):
        if not path.is_file():
            continue
        if path.name == "validate_content.py":
            continue
        if "__pycache__" in path.parts or ".rendered" in path.parts:
            continue
        text = path.read_text(encoding="utf-8", errors="ignore")
        if "REPLACE_ME" in text:
            rel = path.relative_to(ROOT)
            if rel.parts and Path(rel.parts[0]) not in allowed_roots:
                errors.append(f"Unexpected REPLACE_ME placeholder in {rel}")
    return errors


def check_python() -> list[str]:
    errors: list[str] = []
    for path in iter_files({".py"}):
        try:
            ast.parse(path.read_text(encoding="utf-8"), filename=str(path))
        except SyntaxError as exc:
            errors.append(f"{path.relative_to(ROOT)}: Python syntax error: {exc}")
    return errors


def check_shell() -> list[str]:
    errors: list[str] = []
    for path in iter_files({".sh"}):
        result = subprocess.run(
            ["bash", "-n", str(path)],
            capture_output=True,
            text=True,
            check=False,
        )
        if result.returncode != 0:
            errors.append(
                f"{path.relative_to(ROOT)}: shell syntax error: {result.stderr.strip()}"
            )
    return errors


def check_yaml() -> tuple[list[str], str]:
    try:
        import yaml  # type: ignore
    except ImportError:
        return [], "PyYAML not installed; YAML parser check skipped."

    errors: list[str] = []
    for path in iter_files({".yaml", ".yml"}):
        if "templates" in path.parts:
            continue
        text = path.read_text(encoding="utf-8")
        try:
            list(yaml.safe_load_all(text))
        except Exception as exc:  # PyYAML uses several exception types
            errors.append(f"{path.relative_to(ROOT)}: YAML parse error: {exc}")
    return errors, "YAML parser check completed with PyYAML."


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--yaml-only",
        action="store_true",
        help="Run only the YAML parser check.",
    )
    args = parser.parse_args()

    yaml_errors, yaml_message = check_yaml()

    if args.yaml_only:
        errors = yaml_errors
    else:
        errors = []
        errors.extend(check_required_paths())
        errors.extend(check_markdown_links())
        errors.extend(check_placeholders())
        errors.extend(check_python())
        errors.extend(check_shell())
        errors.extend(yaml_errors)

    print(yaml_message)

    if errors:
        print("\nValidation failed:")
        for error in errors:
            print(f"- {error}")
        return 1

    print("Content validation: OK")
    return 0


if __name__ == "__main__":
    sys.exit(main())
