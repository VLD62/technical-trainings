---
marp: true
paginate: true
title: Procedural Language Fundamentals
---

# Procedural Language Fundamentals

Blocks, batches, variables, conditions, loops, and scope.

---

# PL/SQL Block

```sql
DECLARE
  v_name employees.full_name%TYPE;
BEGIN
  SELECT full_name INTO v_name
  FROM employees
  WHERE employee_id = 1;

  DBMS_OUTPUT.PUT_LINE(v_name);
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Not found');
END;
/
```

---

# T-SQL Batch

```sql
DECLARE @name NVARCHAR(100);

SELECT @name = full_name
FROM dbo.employees
WHERE employee_id = 1;

IF @name IS NULL
  PRINT 'Not found';
ELSE
  PRINT @name;
GO
```

A `SELECT` assignment with no matching row does not raise an automatic `NO_DATA_FOUND` equivalent.

---

# Type Anchoring

Oracle:

```sql
v_salary employees.salary%TYPE;
v_employee employees%ROWTYPE;
```

Benefits:

- Follows column type changes
- Documents data origin
- Reduces duplicated type declarations

T-SQL does not provide direct `%TYPE` or `%ROWTYPE` equivalents.

---

# Conditions

Oracle:

```sql
IF v_salary >= 80000 THEN
  v_band := 'HIGH';
ELSIF v_salary >= 50000 THEN
  v_band := 'MEDIUM';
ELSE
  v_band := 'STANDARD';
END IF;
```

SQL Server:

```sql
IF @salary >= 80000
  SET @band = 'HIGH';
ELSE IF @salary >= 50000
  SET @band = 'MEDIUM';
ELSE
  SET @band = 'STANDARD';
```

---

# Loops

PL/SQL supports:

- Basic `LOOP`
- `WHILE`
- Numeric `FOR`
- Cursor `FOR`

T-SQL commonly uses:

- `WHILE`
- Cursors when unavoidable
- Set-based queries as the preferred alternative

---

# Scope and Naming

Recommended prefixes in teaching examples:

- `p_` parameter
- `v_` local variable
- `c_` constant or cursor
- `r_` record

Production teams may choose different conventions; consistency matters more than the exact prefix.

---

# Avoid Procedural SQL When

- A single `INSERT ... SELECT` works
- A single `UPDATE` can modify the set
- A window function solves ranking or running totals
- A join or aggregate replaces repeated lookups
- The loop only transforms rows independently
