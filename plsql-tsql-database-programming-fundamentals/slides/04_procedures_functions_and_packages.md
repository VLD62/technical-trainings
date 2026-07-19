---
marp: true
paginate: true
title: Procedures, Functions, and Packages
---

# Procedures, Functions, and Packages

Build a stable database API instead of exposing tables directly.

---

# Stored Procedure Responsibilities

Good candidates:

- Enforce a transactional workflow
- Centralize a data operation
- Validate inputs
- Return a clear success or failure contract
- Restrict direct table permissions

Poor candidates:

- Formatting user-interface text
- Hiding uncontrolled dynamic SQL
- Replacing all application logic

---

# Oracle Procedure

```sql
CREATE OR REPLACE PROCEDURE give_raise (
  p_employee_id IN employees.employee_id%TYPE,
  p_percent     IN NUMBER
) AS
BEGIN
  UPDATE employees
  SET salary = salary * (1 + p_percent / 100)
  WHERE employee_id = p_employee_id;

  IF SQL%ROWCOUNT = 0 THEN
    RAISE NO_DATA_FOUND;
  END IF;
END;
/
```

---

# SQL Server Procedure

```sql
CREATE OR ALTER PROCEDURE dbo.usp_give_raise
  @employee_id INT,
  @percent DECIMAL(5,2)
AS
BEGIN
  SET NOCOUNT ON;

  UPDATE dbo.employees
  SET salary = salary * (1 + @percent / 100.0)
  WHERE employee_id = @employee_id;

  IF @@ROWCOUNT = 0
    THROW 50001, 'Employee not found', 1;
END;
GO
```

---

# Functions

Use functions for calculations that are:

- Deterministic when possible
- Free from hidden transaction control
- Small and focused
- Safe in query execution context

Be cautious with scalar functions in large queries; understand platform-specific optimizer behavior.

---

# Oracle Packages

A package groups a public specification and private implementation:

```sql
CREATE OR REPLACE PACKAGE employee_api AS
  PROCEDURE give_raise(...);
  FUNCTION annual_salary(...) RETURN NUMBER;
END employee_api;
/
```

Benefits:

- Explicit public API
- Encapsulation
- Shared types and constants
- Related operations grouped together

---

# SQL Server Organization

SQL Server does not have a direct package equivalent.

Use:

- Schemas for namespace and permissions
- Naming conventions for related procedures
- Roles for execution permissions
- Source folders and deployment projects for grouping

---

# API Design Checklist

- Validate parameters
- Define NULL behavior
- Define transaction ownership
- Return predictable result shapes
- Raise meaningful errors
- Avoid leaking implementation details
- Document permissions and side effects
- Make scripts repeatable with `CREATE OR ALTER` where supported
