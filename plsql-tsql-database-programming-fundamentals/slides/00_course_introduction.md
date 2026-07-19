---
marp: true
paginate: true
title: PL/SQL and T-SQL Database Programming - Course Introduction
---

# PL/SQL & T-SQL Database Programming

## Course Introduction

A comparative, hands-on introduction to procedural programming inside Oracle Database and Microsoft SQL Server.

---

# Why Learn Both?

- SQL is declarative: describe the result
- PL/SQL and T-SQL add procedural control
- Both platforms support stored procedures, functions, triggers, and transactions
- Similar business requirements often require different syntax and design choices
- Understanding both improves migration, review, and troubleshooting skills

---

# Learning Outcomes

Participants should be able to:

- Read and write basic PL/SQL and T-SQL
- Build stored database APIs
- Handle query results and errors
- Control transactions safely
- Recognize vendor-specific behavior
- Avoid common cursor, trigger, security, and performance mistakes

---

# Shared Training Domain

```text
DEPARTMENTS 1 ───────< EMPLOYEES
                          │
                          └───────< SALARY_AUDIT
```

The same logical model exists in Oracle and SQL Server.

---

# Course Map

1. Relational and SQL foundations
2. Oracle and SQL Server environments
3. Procedural language fundamentals
4. Procedures, functions, and packages
5. Query processing and cursors
6. Exceptions, errors, and transactions
7. Triggers, performance, security, and testing
8. Comparative workshop

---

# Safe Lab Rules

- Use only authorized training databases
- Never paste real credentials into examples
- Review destructive statements before execution
- Keep transactions short
- Never expose local database ports publicly
- Remove training volumes after use

---

# Central Question

> Should this logic live in SQL, procedural database code, or the application?

Consider:

- Data locality
- Atomicity
- Reuse
- Portability
- Observability
- Team ownership
- Testing and deployment
