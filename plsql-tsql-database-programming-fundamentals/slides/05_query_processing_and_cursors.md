---
marp: true
paginate: true
title: Query Processing and Cursors
---

# Query Processing and Cursors

Process result sets safely and avoid unnecessary row-by-row work.

---

# Oracle Implicit Cursor

Every DML statement exposes attributes through `SQL`:

```sql
UPDATE employees
SET salary = salary * 1.03
WHERE department_id = 20;

DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT);
```

Useful attributes:

- `SQL%FOUND`
- `SQL%NOTFOUND`
- `SQL%ROWCOUNT`

---

# Oracle Cursor FOR Loop

```sql
FOR r_emp IN (
  SELECT employee_id, full_name, salary
  FROM employees
  ORDER BY employee_id
) LOOP
  DBMS_OUTPUT.PUT_LINE(r_emp.full_name);
END LOOP;
```

The runtime handles open, fetch, and close automatically.

---

# T-SQL Cursor

```sql
DECLARE c CURSOR LOCAL FAST_FORWARD FOR
  SELECT employee_id, full_name
  FROM dbo.employees;

OPEN c;
FETCH NEXT FROM c INTO @id, @name;

WHILE @@FETCH_STATUS = 0
BEGIN
  PRINT @name;
  FETCH NEXT FROM c INTO @id, @name;
END;

CLOSE c;
DEALLOCATE c;
```

---

# The Row-by-Row Cost

Cursors may introduce:

- Repeated statement execution
- More logging and locking
- More network or engine context switches
- Longer transaction duration
- Harder multi-row correctness

Use them only when each row genuinely requires ordered or stateful processing.

---

# Set-Based Rewrite

Instead of looping to calculate payroll:

```sql
SELECT department_id, SUM(salary) AS payroll
FROM employees
GROUP BY department_id;
```

Instead of looping to apply a raise:

```sql
UPDATE employees
SET salary = salary * 1.05
WHERE department_id = 20;
```

---

# Bulk and Table Techniques

Oracle advanced options:

- Collections
- `BULK COLLECT`
- `FORALL`

SQL Server options:

- Table variables
- Temporary tables
- Table-valued parameters
- Set-based joins and `MERGE` with careful review

---

# Decision Rule

1. Can one SQL statement solve it?
2. Can staging data make it set-based?
3. Does order or external side effect require a loop?
4. Can the loop run outside the transaction?
5. Is the cursor tested with realistic row counts?
