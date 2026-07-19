---
marp: true
paginate: true
title: Exceptions, Errors, and Transactions
---

# Exceptions, Errors, and Transactions

Failure handling is part of the API contract.

---

# PL/SQL Exception Section

```sql
BEGIN
  SELECT salary INTO v_salary
  FROM employees
  WHERE employee_id = p_employee_id;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RAISE_APPLICATION_ERROR(-20001, 'Employee not found');
  WHEN TOO_MANY_ROWS THEN
    RAISE_APPLICATION_ERROR(-20002, 'Data integrity error');
END;
/
```

Avoid `WHEN OTHERS THEN NULL`.

---

# T-SQL TRY...CATCH

```sql
BEGIN TRY
  BEGIN TRANSACTION;

  EXEC dbo.usp_give_raise @employee_id = 1, @percent = 5;

  COMMIT TRANSACTION;
END TRY
BEGIN CATCH
  IF XACT_STATE() <> 0
    ROLLBACK TRANSACTION;

  THROW;
END CATCH;
GO
```

---

# Error Information

PL/SQL:

- `SQLCODE`
- `SQLERRM`
- `DBMS_UTILITY.FORMAT_ERROR_BACKTRACE`

T-SQL:

- `ERROR_NUMBER()`
- `ERROR_MESSAGE()`
- `ERROR_LINE()`
- `ERROR_PROCEDURE()`
- `XACT_STATE()`

---

# Transaction Ownership

Choose and document one approach:

- Caller owns commit and rollback
- Stored procedure owns the complete transaction
- Procedure joins an existing transaction and creates a savepoint

Hidden commits make composition and testing difficult.

---

# Savepoints

Oracle:

```sql
SAVEPOINT before_raise;
-- work
ROLLBACK TO before_raise;
```

SQL Server:

```sql
SAVE TRANSACTION before_raise;
-- work
ROLLBACK TRANSACTION before_raise;
```

A savepoint does not replace final commit or rollback ownership.

---

# Common Failure Patterns

- Catching an error and pretending success
- Rolling back a transaction owned by a caller without a contract
- Leaving a transaction open after an error
- Returning inconsistent status codes and exceptions
- Logging sensitive input values
- Committing inside reusable low-level functions

---

# Reliable Pattern

1. Validate input
2. Start or join transaction intentionally
3. Perform set-based work
4. Verify affected rows
5. Commit only at the agreed boundary
6. Roll back on failure
7. Re-raise a meaningful error
8. Record enough context for diagnosis
