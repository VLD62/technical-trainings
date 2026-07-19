---
marp: true
paginate: true
title: Oracle and SQL Server Environments
---

# Oracle and SQL Server Environments

Understand where code executes and how objects are organized.

---

# Oracle Mental Model

```text
Oracle instance
└── Container database
    └── Pluggable database: FREEPDB1
        └── Schema/user: TRAINING
            ├── tables
            ├── procedures
            ├── functions
            ├── packages
            └── triggers
```

A schema is closely associated with a database user.

---

# SQL Server Mental Model

```text
SQL Server instance
└── Database: TrainingDB
    └── Schema: dbo
        ├── tables
        ├── procedures
        ├── functions
        └── triggers
```

Logins authenticate to the instance; database users and schemas organize access and objects.

---

# Common Clients

## Oracle

- SQL*Plus
- SQLcl
- Oracle SQL Developer
- VS Code database extensions

## SQL Server

- `sqlcmd`
- SQL Server Management Studio
- Azure Data Studio legacy installations
- VS Code MSSQL extension

---

# Statement Terminators

## Oracle

```sql
BEGIN
  NULL;
END;
/
```

The semicolon ends statements inside the PL/SQL unit. `/` asks the client to submit the completed unit.

## SQL Server

```sql
PRINT 'Hello';
GO
```

`GO` is a client batch separator, not a T-SQL statement.

---

# Naming and Qualification

Prefer qualified object names:

```sql
-- Oracle, current schema is usually enough
SELECT * FROM training.employees;

-- SQL Server
SELECT * FROM dbo.employees;
```

Qualification improves clarity and can avoid name-resolution surprises.

---

# Local Lab Ports

| Platform | Port | Target |
|---|---:|---|
| Oracle | 1521 | `FREEPDB1` |
| SQL Server | 1433 | `TrainingDB` |

Bind ports to localhost only in shared or untrusted environments.

---

# Tooling Principle

Use the client that makes execution boundaries visible:

- Show current database or service
- Show current user and schema
- Stop on errors during deployments
- Capture output and version information
- Do not rely on implicit client defaults
