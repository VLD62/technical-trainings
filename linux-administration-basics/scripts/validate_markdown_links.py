#!/usr/bin/env python3
from pathlib import Path
import re
import sys

root = Path(__file__).resolve().parents[1]
link_pattern = re.compile(r'\[[^\]]*\]\(([^)#]+)(?:#[^)]*)?\)')
fence_pattern = re.compile(r'```.*?```', re.DOTALL)
errors = []

for markdown in root.rglob('*.md'):
    text = markdown.read_text(encoding='utf-8')
    text = fence_pattern.sub('', text)
    for target in link_pattern.findall(text):
        if re.match(r'^[a-z]+://', target):
            continue
        resolved = (markdown.parent / target).resolve()
        if not resolved.exists():
            errors.append(f'{markdown.relative_to(root)}: {target}')

if errors:
    print('Broken local Markdown links:', file=sys.stderr)
    print('\n'.join(errors), file=sys.stderr)
    raise SystemExit(1)

print('Local Markdown links are valid.')
