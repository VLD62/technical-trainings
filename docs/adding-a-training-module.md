# Adding a Training Module

This guide describes the conventions for a new module and provides a README template.
The goal is consistency without forcing every module into an identical shape — include
only what is meaningful for the subject.

## Conventions

- **Directory name:** lowercase, hyphenated, descriptive, ending in a scope word such
  as `-basics`, `-fundamentals`, or `-first-steps` (for example `redis-caching-basics`).
- **Self-contained:** a learner should be able to work through the module using only
  its own directory.
- **Placeholders only:** no real credentials, endpoints, or organization-specific
  references. Provide a `.env.example` when configuration is needed.
- **Proportional depth:** a short reference module needs less than a full hands-on
  course. Do not create empty directories or filler files.

## Recommended files

| File / directory | When to include |
|---|---|
| `README.md` | Always. |
| `MANIFEST.md` | When the module has structured materials worth summarizing and validating. |
| `LICENSE.md` | When you want the per-module dual-license statement close to the content. |
| `Makefile` | When the module has runnable examples, scripts, or tests to validate. |
| `requirements.txt` | For Python-based modules. |
| `slides/` | Session presentations. |
| `docs/` | Guides, cheat sheets, setup and security notes. |
| `labs/` | Guided hands-on exercises. |
| `examples/` | Runnable, self-contained example code. |
| `scripts/` | Setup and validation helpers. |
| `quizzes/` | Knowledge-check questions. |
| `tests/` | Automated checks for executable examples. |

## Register the module

Add a row to the appropriate category table in the root [README.md](../README.md).
Set the **Automation** column to `` `make` `` if the module ships a `Makefile` with
`validate`/`test` targets, or `—` otherwise.

## README template

Copy [../templates/module-README.md](../templates/module-README.md) into your module
as `README.md` and adapt each section. Remove sections that do not apply rather than
leaving them empty.
