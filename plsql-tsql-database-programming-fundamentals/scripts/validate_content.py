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
    "LICENSE.md",
    "Makefile",
    ".env.example",
    "slides/00_course_introduction.md",
    "slides/01_relational_and_sql_foundations.md",
    "slides/02_oracle_and_sql_server_environments.md",
    "slides/03_procedural_language_fundamentals.md",
    "slides/04_procedures_functions_and_packages.md",
    "slides/05_query_processing_and_cursors.md",
    "slides/06_exceptions_errors_and_transactions.md",
    "slides/07_triggers_performance_security_and_testing.md",
    "docs/setup_guide.md",
    "docs/plsql_vs_tsql.md",
    "docs/cheat_sheet.md",
    "docs/glossary.md",
    "docs/useful_links.md",
    "labs/README.md",
    "labs/01_start_and_verify_databases.md",
    "labs/07_triggers_and_final_challenge.md",
    "examples/oracle/01_anonymous_block.sql",
    "examples/sqlserver/01_variables_control_flow.sql",
    "lab/docker-compose.yml",
    "lab/oracle/init/01_initialize_training_schema.sh",
    "lab/oracle/init/sql/01_schema.sql",
    "lab/oracle/init/sql/02_program_units.sql",
    "lab/sqlserver/init/00_setup.sql",
    "scripts/wait_for_databases.sh",
    "quizzes/01_fundamentals.md",
]

FORBIDDEN_PATTERNS = {
    "internal company branding": re.compile(r"\bBo" + r"sch\b", re.IGNORECASE),
    "internal organization code": re.compile(r"\b(?:RB" + r"BG|EN" + r"G4|EN" + r"G41)\b", re.IGNORECASE),
    "internal documentation URL": re.compile(r"inside[-.]?docu" + r"pedia", re.IGNORECASE),
}

TEXT_SUFFIXES = {
    ".md", ".py", ".sh", ".yaml", ".yml", ".sql", ".txt", ".example"
}


def main() -> int:
    errors: list[str] = []

    for rel in REQUIRED:
        path = ROOT / rel
        if not path.is_file():
            errors.append(f"missing required file: {rel}")

    for path in sorted(ROOT.rglob("*")):
        if not path.is_file():
            continue
        if path.suffix not in TEXT_SUFFIXES and path.name not in {"Makefile", ".gitignore"}:
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

        if path.suffix == ".sql":
            if "DROP DATABASE MASTER" in text.upper():
                errors.append(f"dangerous database command found in {rel}")

    compose = (ROOT / "lab/docker-compose.yml").read_text(encoding="utf-8")
    for port in ("127.0.0.1:1433:1433", "127.0.0.1:1521:1521"):
        if port not in compose:
            errors.append(f"lab port is not restricted to localhost: {port}")

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
