# Repository Integration

Extract the archive into the root of `technical-trainings` so the module appears as:

```text
technical-trainings/
└── linux-administration-basics/
```

Add this row to the Training Catalog in the repository root `README.md`:

```markdown
| **Linux Administration: Basics** | Practical, vendor-neutral Linux administration course covering command-line tools, filesystems, users, networking, services, security, shell scripting, and the LPIC-1 101-500 and 102-500 objectives. | [Open training](./linux-administration-basics/) |
```

Add this block to the repository structure section:

```text
├── linux-administration-basics/
│   ├── README.md
│   ├── slides/
│   ├── docs/
│   ├── labs/
│   ├── scripts/
│   ├── examples/
│   └── quizzes/
```

Suggested commit:

```text
feat: add Linux administration basics LPIC-1 training
```

Optional follow-up commit after rendering or adding diagrams:

```text
chore: add rendered Linux training materials
```
