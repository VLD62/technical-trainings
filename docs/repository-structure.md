# Repository Structure

Each training is a self-contained module. Modules share a common layout but only
include the directories that are meaningful for their subject — see
[Adding a training module](./adding-a-training-module.md) for the conventions.

## Top level

```text
technical-trainings/
├── README.md                     # Catalog and getting started
├── LICENSE                       # MIT — code, scripts, and executable examples
├── LICENSE-CONTENT.md            # CC BY-NC-SA 4.0 — educational content
├── CONTRIBUTING.md               # How to propose changes
├── Makefile                      # Repository-wide validation entry points
├── .github/                      # CI workflow and PR template
├── docs/                         # Repository-level documentation
├── scripts/                      # Repository-level validation tooling
└── <training-module>/            # One directory per training
```

## A full training module

Not every module contains every directory. A mature, hands-on module may include:

```text
<training-module>/
├── README.md          # Overview, prerequisites, agenda, getting started
├── MANIFEST.md        # Machine-readable summary and material counts
├── LICENSE.md         # Per-module dual-license statement
├── Makefile           # validate / test / clean targets
├── requirements.txt   # Language dependencies (where applicable)
├── slides/            # Session presentations (Markdown)
├── docs/              # Guides, cheat sheets, setup and security notes
├── labs/              # Guided hands-on exercises
├── examples/          # Runnable, self-contained example code
├── scripts/           # Setup and validation helpers
├── quizzes/           # Knowledge-check questions
└── tests/             # Automated checks for the executable examples
```

## Per-module structure

Every module's own `README.md` documents its exact structure. `MANIFEST.md`
(where present) lists the module directory, level, dependencies, and material
counts, and is used by repository-wide validation.
