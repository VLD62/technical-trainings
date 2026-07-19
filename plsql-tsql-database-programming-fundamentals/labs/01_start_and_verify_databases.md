# Lab 01 - Start and Verify the Databases

## Goal

Start the local environment and prove that the same logical data model exists in both platforms.

## Tasks

1. Create `.env` from `.env.example` and replace the example passwords.
2. Run `make validate`.
3. Run `make up`.
4. Run `make status` and identify the health state of each service.
5. Run `make verify`.
6. Open `make oracle-shell` and query:

```sql
SELECT USER AS current_user FROM dual;
SELECT COUNT(*) AS employee_count FROM employees;
```

7. Open `make mssql-shell` and query:

```sql
SELECT SUSER_SNAME() AS login_name, DB_NAME() AS database_name;
SELECT COUNT(*) AS employee_count FROM dbo.employees;
GO
```

## Review Questions

- What is the Oracle service name?
- What is the SQL Server database name?
- Which client separator submits a PL/SQL unit?
- Is `GO` part of the T-SQL language?
