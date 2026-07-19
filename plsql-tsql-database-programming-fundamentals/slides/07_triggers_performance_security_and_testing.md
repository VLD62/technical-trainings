---
marp: true
paginate: true
title: Triggers, Performance, Security, and Testing
---

# Triggers, Performance, Security, and Testing

Database code must remain observable, secure, and deployable.

---

# Trigger Use Cases

Reasonable uses:

- Immutable audit metadata
- Compatibility enforcement during controlled migrations
- Cross-table rules that cannot be expressed as constraints

Questionable uses:

- Large workflows
- Network calls
- Hidden business orchestration
- Logic that silently changes user input

---

# Multi-Row Correctness

Oracle row trigger:

```sql
FOR EACH ROW
```

SQL Server trigger:

- `inserted` and `deleted` may contain many rows
- Never assume a single affected row
- Use set-based inserts into audit tables

---

# Performance Basics

- Use bind parameters
- Avoid unnecessary dynamic SQL
- Query only required columns
- Index for access patterns, not every column
- Keep transactions short
- Measure with realistic data volumes
- Review execution plans for expensive statements
- Avoid functions that execute once per row in large result sets

---

# Security Basics

- Dedicated application identities
- Least privilege
- Grant `EXECUTE` on APIs instead of broad table access when appropriate
- Protect dynamic object names with allowlists
- Separate schema deployment from runtime accounts
- Never concatenate untrusted values into SQL

---

# Testing Layers

1. Compile or create object successfully
2. Happy-path unit example
3. Boundary values and NULLs
4. Missing-row and duplicate-row behavior
5. Multi-row DML behavior
6. Rollback verification
7. Permission verification
8. Performance with realistic data volume

---

# Deployment Discipline

- Store every object in source control
- Use deterministic file order
- Stop deployment on errors
- Make scripts repeatable where possible
- Separate schema, data, and programmable objects
- Record database version and compatibility assumptions
- Include rollback or forward-fix strategy

---

# Review Checklist

- Is a constraint better than code?
- Is one SQL statement better than a loop?
- Is transaction ownership explicit?
- Does the trigger handle multiple rows?
- Are errors preserved and meaningful?
- Are permissions minimal?
- Can the object be tested independently?
- Can another engineer deploy it safely?

---

# Final Takeaway

PL/SQL and T-SQL are similar enough to transfer concepts, but different enough that syntax-only translation is unsafe.

Understand:

- Execution model
- Error semantics
- Transaction behavior
- Object organization
- Multi-row behavior
- Tooling and deployment boundaries
