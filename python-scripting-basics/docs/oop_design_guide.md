# OOP Design Guide

## Use a Class When

- Several values form one domain concept
- Behavior depends on persistent state
- Validation belongs with the data
- Collaborators need interchangeable implementations
- Dependencies should be injected for testing

## Dataclasses

Use `@dataclass` for data-focused objects.

## Composition

A `BackupService` has a `Storage`. Composition is usually clearer than inheriting only to reuse code.

## Inheritance

Use inheritance only for a genuine and stable `is-a` relationship. Avoid deep hierarchies.

## Protocols and ABCs

- Protocol: behavior-based interface without required inheritance
- Abstract base class: explicit base contract and optional shared implementation

## Responsibility Example

- `LogParser`: text to entries
- `LogAnalyzer`: entries to statistics
- `ReportWriter`: statistics to output
- CLI: user interaction and exit codes
