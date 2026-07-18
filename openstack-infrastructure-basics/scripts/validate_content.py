#!/usr/bin/env python3
"""Validate the reusable OpenStack course package.

The validator checks the required package structure, local Markdown links,
placeholder hygiene, and patterns that should not appear in public material.
It intentionally does not contact external services.
"""

from __future__ import annotations

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SELF = Path(__file__).resolve()

REQUIRED_FILES = [
    'README.md',
    'MANIFEST.md',
    'LICENSE.md',
    'Makefile',
    'slides/00_course_introduction.md',
    'slides/01_fundamentals_and_architecture.md',
    'slides/02_identity_projects_and_cli.md',
    'slides/03_compute_placement_and_images.md',
    'slides/04_networking_with_neutron.md',
    'slides/05_storage_and_ceph.md',
    'slides/06_deployment_with_kolla_ansible.md',
    'slides/07_operations_and_troubleshooting.md',
    'slides/08_high_availability_and_security.md',
    'docs/architecture_notes.md',
    'docs/service_catalog.md',
    'docs/networking_notes.md',
    'docs/storage_notes.md',
    'docs/kolla_ansible_notes.md',
    'docs/operations_runbook.md',
    'docs/security_and_publication_notes.md',
    'docs/glossary.md',
    'docs/instructor_guide.md',
    'docs/useful_links.md',
    'labs/README.md',
    'labs/01_cli_and_authentication.md',
    'labs/02_projects_roles_and_quotas.md',
    'labs/03_images_flavors_and_instances.md',
    'labs/04_network_router_and_floating_ip.md',
    'labs/05_volumes_and_snapshots.md',
    'labs/06_troubleshooting_workflow.md',
    'labs/07_kolla_multinode_design.md',
    'labs/08_ha_validation_scenarios.md',
    'labs/09_optional_kolla_all_in_one.md',
    'examples/clouds.yaml.example',
    'examples/openrc.example',
    'examples/kolla/globals.yml.example',
    'examples/kolla/multinode.example',
    'examples/heat/simple_web_server.yaml',
    'scripts/check_prerequisites.sh',
    'scripts/openstack_health_report.sh',
    'scripts/validate_content.py',
    'quizzes/01_fundamentals.md',
    'quizzes/02_operations_and_architecture.md',
]

# Terms are assembled to keep the validator from matching its own definitions.
FORBIDDEN_TERMS = [
    'bo' + 'sch',
    'rbbg',
    'eng' + '41',
    'docu' + 'pedia',
    'synergy' + 'cloud',
    'ninja' + 'turtle',
    'inside-' + 'docupedia',
]

FORBIDDEN_PATTERNS = [
    re.compile(r'-----BEGIN (?:RSA |OPENSSH |EC )?PRIVATE KEY-----'),
    re.compile(r'(?i)\b(password|passwd|secret|token)\s*[:=]\s*(?!REPLACE_ME|CHANGE_ME|\[REDACTED\]|<[^>]+>|\$\{[^}]+\})[^\s#]{6,}'),
    re.compile(r'(?i)https?://[^\s)\]>]*(?:\.internal|\.local|corp(?:orate)?\.)[^\s)\]>]*'),
    re.compile(r'\b10\.(?:\d{1,3}\.){2}\d{1,3}\b'),
    re.compile(r'\b172\.(?:1[6-9]|2\d|3[01])\.(?:\d{1,3}\.)\d{1,3}\b'),
    re.compile(r'\b192\.168\.(?:\d{1,3}\.)\d{1,3}\b'),
]

MARKDOWN_LINK_RE = re.compile(r'(?<!!)\[[^\]]+\]\(([^)]+)\)')


def text_files() -> list[Path]:
    suffixes = {'.md', '.txt', '.yaml', '.yml', '.example', '.sh', '.py', ''}
    result: list[Path] = []
    for path in ROOT.rglob('*'):
        if not path.is_file() or path.name.startswith('.'):
            continue
        if path.suffix.lower() in suffixes or path.name in {'Makefile'}:
            result.append(path)
    return sorted(result)


def check_required(errors: list[str]) -> None:
    for relative in REQUIRED_FILES:
        path = ROOT / relative
        if not path.is_file():
            errors.append(f'Missing required file: {relative}')
        elif path.stat().st_size == 0:
            errors.append(f'Empty required file: {relative}')


def check_public_safety(errors: list[str]) -> None:
    for path in text_files():
        if path.resolve() == SELF:
            continue
        text = path.read_text(encoding='utf-8', errors='replace')
        lowered = text.lower()
        relative = path.relative_to(ROOT)
        for term in FORBIDDEN_TERMS:
            if term in lowered:
                errors.append(f'Forbidden source-specific term in {relative}: {term}')
        for pattern in FORBIDDEN_PATTERNS:
            match = pattern.search(text)
            if match:
                errors.append(f'Potential sensitive value in {relative}: {match.group(0)[:100]}')


def check_links(errors: list[str]) -> None:
    for path in ROOT.rglob('*.md'):
        text = path.read_text(encoding='utf-8', errors='replace')
        for target in MARKDOWN_LINK_RE.findall(text):
            target = target.strip()
            if not target or target.startswith(('#', 'http://', 'https://', 'mailto:')):
                continue
            target = target.split('#', 1)[0]
            if not target:
                continue
            destination = (path.parent / target).resolve()
            try:
                destination.relative_to(ROOT.resolve())
            except ValueError:
                errors.append(f'Link escapes package in {path.relative_to(ROOT)}: {target}')
                continue
            if not destination.exists():
                errors.append(f'Broken local link in {path.relative_to(ROOT)}: {target}')


def check_shell_modes(errors: list[str]) -> None:
    for relative in ('scripts/check_prerequisites.sh', 'scripts/openstack_health_report.sh'):
        path = ROOT / relative
        if path.is_file() and not path.read_text(encoding='utf-8').startswith('#!/usr/bin/env bash'):
            errors.append(f'Missing bash shebang: {relative}')


def main() -> int:
    errors: list[str] = []
    check_required(errors)
    check_public_safety(errors)
    check_links(errors)
    check_shell_modes(errors)

    if errors:
        print('Validation failed:')
        for error in errors:
            print(f' - {error}')
        return 1

    print(f'Validation passed: {len(REQUIRED_FILES)} required files checked.')
    print('Public-content safety patterns and local Markdown links passed.')
    return 0


if __name__ == '__main__':
    sys.exit(main())
