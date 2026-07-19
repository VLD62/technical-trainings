#!/usr/bin/env python3
from __future__ import annotations

import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]

REQUIRED_PATHS = [
    'README.md',
    'MANIFEST.md',
    'LICENSE.md',
    'Makefile',
    'slides/00_course_introduction.md',
    'slides/07_automation_security_and_final_project.md',
    'docs/setup_guide.md',
    'docs/cheat_sheet.md',
    'docs/security_and_operations.md',
    'labs/01_first_script.md',
    'labs/07_final_project.md',
    'examples/00_hello_bash.sh',
    'examples/07_system_report.sh',
    'scripts/check_environment.sh',
    'tests/run_tests.sh',
    'quizzes/01_fundamentals.md',
]

PUBLIC_TEXT_SUFFIXES = {'.md', '.sh', '.py', '.txt', '.log'}
FORBIDDEN_TERMS = ('bosch', 'eng41', 'confidential', 'internal-only')


def fail(message: str) -> None:
    print(f'ERROR: {message}', file=sys.stderr)


def validate_required_paths() -> int:
    failures = 0
    for relative in REQUIRED_PATHS:
        if not (ROOT / relative).exists():
            fail(f'missing required path: {relative}')
            failures += 1
    return failures


def validate_public_content() -> int:
    failures = 0
    for path in ROOT.rglob('*'):
        if path.resolve() == Path(__file__).resolve():
            continue
        if not path.is_file() or path.suffix.lower() not in PUBLIC_TEXT_SUFFIXES:
            continue
        text = path.read_text(encoding='utf-8', errors='replace').lower()
        for term in FORBIDDEN_TERMS:
            if term in text:
                fail(f'forbidden term {term!r} found in {path.relative_to(ROOT)}')
                failures += 1
    return failures


def validate_shell_syntax() -> int:
    failures = 0
    for path in sorted(ROOT.rglob('*.sh')):
        result = subprocess.run(
            ['bash', '-n', str(path)],
            capture_output=True,
            text=True,
            check=False,
        )
        if result.returncode != 0:
            fail(f'Bash syntax error in {path.relative_to(ROOT)}: {result.stderr.strip()}')
            failures += 1
    return failures


def main() -> int:
    failures = 0
    failures += validate_required_paths()
    failures += validate_public_content()
    failures += validate_shell_syntax()

    if failures:
        fail(f'validation failed with {failures} problem(s)')
        return 1

    file_count = sum(1 for path in ROOT.rglob('*') if path.is_file())
    print(f'Content validation passed for {file_count} files.')
    return 0


if __name__ == '__main__':
    raise SystemExit(main())
