# Setup Guide

## Option A: Local Docker Compose Lab

### Requirements

- Docker Engine and Docker Compose
- At least 6 GB available memory
- At least 15 GB free disk space
- Local ports `1433` and `1521` available
- An x86-64 host for the supported SQL Server Linux container setup

### Start

```bash
cp .env.example .env
```

Change the example passwords, then run:

```bash
make validate
make up
make verify
```

`make up` performs these actions:

1. Starts Oracle Database Free and SQL Server containers.
2. Waits until both report healthy.
3. Lets the Oracle image run its first-start schema script.
4. Runs the repeatable SQL Server initialization script.

### Connect to Oracle

```bash
make oracle-shell
```

External clients can use:

```text
Host: localhost
Port: 1521
Service: FREEPDB1
User: value of ORACLE_APP_USER
Password: value of ORACLE_APP_PASSWORD
```

### Connect to SQL Server

```bash
make mssql-shell
```

External clients can use:

```text
Host: localhost
Port: 1433
Database: TrainingDB
User: sa
Password: value of MSSQL_SA_PASSWORD
Encrypt: enabled; trust the local development certificate when required
```

### Stop and Clean

Keep data:

```bash
make down
```

Delete all local training data:

```bash
make clean
```

## Option B: Existing Databases

Use an existing Oracle or SQL Server environment only when you have explicit authorization.

Recommended approach:

1. Create a dedicated training database or schema.
2. Create a least-privileged training account.
3. Review the scripts under `lab/*/init/`.
4. Remove container-specific assumptions.
5. Execute schema scripts before program-unit scripts.
6. Run the verification scripts.
7. Drop the training objects after the course.

## Suggested Client Tools

- Oracle SQL Developer or SQLcl for Oracle
- VS Code with appropriate database extensions
- SQL Server Management Studio on supported platforms
- `sqlcmd` for scriptable SQL Server execution
- DBeaver or another authorized cross-platform client

Client behavior matters. SQL*Plus and SQLcl recognize `/`; `sqlcmd` and Microsoft tools recognize `GO` as a batch separator.
