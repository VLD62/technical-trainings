---
marp: true
paginate: true
title: Relational and SQL Foundations
---

# Relational and SQL Foundations

Shared concepts before vendor-specific procedural code.

---

# Relational Model

- Tables represent entity sets
- Rows represent records
- Columns represent attributes
- Primary keys identify rows
- Foreign keys protect relationships
- Constraints protect data quality near the data

---

# SQL Command Groups

| Group | Examples |
|---|---|
| DDL | `CREATE`, `ALTER`, `DROP` |
| DML | `INSERT`, `UPDATE`, `DELETE`, `MERGE` |
| Query | `SELECT` |
| Transaction control | `COMMIT`, `ROLLBACK`, savepoints |
| Security | `GRANT`, `REVOKE` |

---

# Set-Based Thinking

Prefer one operation over a loop when possible:

```sql
UPDATE employees
SET salary = salary * 1.05
WHERE department_id = 20;
```

Benefits:

- Less procedural code
- Better optimizer visibility
- Fewer context switches
- Correct multi-row behavior

---

# NULL Is Not a Value

- `NULL = NULL` is not true
- Use `IS NULL` and `IS NOT NULL`
- Expressions containing NULL often produce NULL
- Aggregates usually ignore NULL values
- `COALESCE` is portable; `NVL` and `ISNULL` are vendor-specific

---

# Data-Type Differences

| Concept | Oracle | SQL Server |
|---|---|---|
| Variable text | `VARCHAR2` | `VARCHAR` / `NVARCHAR` |
| General numeric | `NUMBER` | `DECIMAL`, `INT`, `BIGINT` |
| Date and time | `DATE`, `TIMESTAMP` | `DATE`, `DATETIME2` |
| Boolean in procedural code | `BOOLEAN` | `BIT` convention |
| Generated key | identity or sequence | `IDENTITY` or sequence |

---

# Query Before Modify

Before:

```sql
DELETE FROM employees WHERE department_id = 30;
```

Run:

```sql
SELECT * FROM employees WHERE department_id = 30;
```

Then confirm transaction boundaries and backup expectations.

---

# Constraints First

Use database constraints for invariants:

- `NOT NULL`
- `CHECK`
- `UNIQUE`
- `PRIMARY KEY`
- `FOREIGN KEY`

Procedural validation supplements constraints; it should not replace them.
