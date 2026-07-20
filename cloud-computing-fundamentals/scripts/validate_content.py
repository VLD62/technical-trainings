#!/usr/bin/env python3
from __future__ import annotations

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]

REQUIRED = [
    'README.md',
    'MANIFEST.md',
    'LICENSE.md',
    'Makefile',
    'slides/00_course_introduction.md',
    'slides/01_cloud_concepts_and_service_models.md',
    'slides/02_global_infrastructure_and_reliability.md',
    'slides/03_identity_security_and_governance.md',
    'slides/04_compute_storage_networking_and_databases.md',
    'slides/05_aws_fundamentals.md',
    'slides/06_azure_fundamentals.md',
    'slides/07_google_cloud_fundamentals.md',
    'slides/08_oci_private_hybrid_and_multicloud.md',
    'slides/09_operations_cost_and_cloud_adoption.md',
    'docs/lab_setup.md',
    'docs/provider_service_mapping.md',
    'docs/cloud_architecture_checklist.md',
    'docs/security_and_shared_responsibility.md',
    'docs/cost_management_and_finops.md',
    'docs/glossary.md',
    'docs/useful_links.md',
    'docs/instructor_guide.md',
    'docs/repository_integration.md',
    'labs/README.md',
    'labs/01_cloud_service_classification.md',
    'labs/02_design_a_highly_available_web_application.md',
    'labs/03_identity_and_least_privilege.md',
    'labs/04_provider_service_mapping.md',
    'labs/05_cost_and_tagging_review.md',
    'labs/06_multicloud_architecture_decision.md',
    'examples/workload-requirements.yaml',
    'examples/tagging-policy.yaml',
    'examples/provider-service-map.csv',
    'scripts/validate_environment.sh',
    'scripts/cloud_cli_inventory.sh',
    'quizzes/01_cloud_concepts.md',
    'quizzes/02_security_infrastructure_and_services.md',
    'quizzes/03_provider_comparison_and_operations.md',
    'quizzes/04_final_assessment.md',
]

LINK_RE = re.compile(r'(?<!!)\[[^\]]+\]\(([^)]+)\)')


def validate_required() -> list[str]:
    return [f'Missing required file: {rel}' for rel in REQUIRED if not (ROOT / rel).exists()]


def validate_links() -> list[str]:
    errors: list[str] = []
    for md in ROOT.rglob('*.md'):
        text = md.read_text(encoding='utf-8')
        text = re.sub(r'```.*?```', '', text, flags=re.DOTALL)
        for target in LINK_RE.findall(text):
            target = target.strip().split()[0].strip('<>')
            if target.startswith(('http://', 'https://', 'mailto:', '#')):
                continue
            clean = target.split('#', 1)[0]
            if not clean:
                continue
            resolved = (md.parent / clean).resolve()
            try:
                resolved.relative_to(ROOT.resolve())
            except ValueError:
                errors.append(f'{md.relative_to(ROOT)}: link escapes module: {target}')
                continue
            if not resolved.exists():
                errors.append(f'{md.relative_to(ROOT)}: broken local link: {target}')
    return errors


def validate_no_secrets() -> list[str]:
    suspicious = [
        re.compile(r'AKIA[0-9A-Z]{16}'),
        re.compile(r'-----BEGIN (?:RSA |EC |OPENSSH )?PRIVATE KEY-----'),
        re.compile(r'(?i)client_secret\s*[:=]\s*["\'][^"\']{8,}'),
    ]
    errors: list[str] = []
    for path in ROOT.rglob('*'):
        if not path.is_file() or path.suffix.lower() in {'.png', '.jpg', '.jpeg', '.gif', '.zip'}:
            continue
        text = path.read_text(encoding='utf-8', errors='ignore')
        for pattern in suspicious:
            if pattern.search(text):
                errors.append(f'{path.relative_to(ROOT)}: possible secret or private key material')
                break
    return errors


def main() -> int:
    errors = validate_required() + validate_links() + validate_no_secrets()
    if errors:
        print('Validation failed:')
        for error in errors:
            print(f' - {error}')
        return 1
    md_count = sum(1 for _ in ROOT.rglob('*.md'))
    file_count = sum(1 for p in ROOT.rglob('*') if p.is_file())
    print(f'Validation successful: {file_count} files, including {md_count} Markdown documents.')
    return 0


if __name__ == '__main__':
    sys.exit(main())
