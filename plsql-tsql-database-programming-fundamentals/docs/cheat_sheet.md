# PL/SQL and T-SQL Cheat Sheet

## Anonymous Code

### Oracle

```sql
SET SERVEROUTPUT ON;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Hello');
END;
/
```

### SQL Server

```sql
PRINT 'Hello';
GO
```

## Variables

### Oracle

```sql
DECLARE
  v_count NUMBER := 0;
  v_name employees.full_name%TYPE;
BEGIN
  NULL;
END;
/
```

### SQL Server

```sql
DECLARE @count INT = 0;
DECLARE @name NVARCHAR(100);
```

## Procedure Execution

### Oracle

```sql
BEGIN
  employee_api.give_raise(1, 5);
END;
/
```

### SQL Server

```sql
EXEC dbo.usp_give_raise @employee_id = 1, @percent = 5;
GO
```

## Function Use

### Oracle

```sql
SELECT employee_api.annual_salary(1) FROM dual;
```

### SQL Server

```sql
SELECT dbo.fn_annual_salary(1);
```

## Row Count

### Oracle

```sql
DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT);
```

### SQL Server

```sql
SELECT @@ROWCOUNT AS affected_rows;
```

## Error Handling

### Oracle

```sql
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RAISE_APPLICATION_ERROR(-20001, 'Not found');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
    RAISE;
```

### SQL Server

```sql
BEGIN CATCH
  SELECT ERROR_NUMBER(), ERROR_MESSAGE(), ERROR_LINE();
  THROW;
END CATCH;
```

## Transactions

### Oracle

```sql
SAVEPOINT before_change;
UPDATE employees SET salary = salary * 1.05;
ROLLBACK TO before_change;
COMMIT;
```

### SQL Server

```sql
BEGIN TRANSACTION;
SAVE TRANSACTION before_change;
UPDATE dbo.employees SET salary = salary * 1.05;
ROLLBACK TRANSACTION before_change;
COMMIT TRANSACTION;
```

## Dynamic SQL

### Oracle

```sql
EXECUTE IMMEDIATE
  'UPDATE employees SET salary = salary + :1 WHERE employee_id = :2'
  USING p_amount, p_employee_id;
```

### SQL Server

```sql
EXEC sys.sp_executesql
  N'UPDATE dbo.employees SET salary = salary + @amount WHERE employee_id = @id',
  N'@amount DECIMAL(12,2), @id INT',
  @amount = @amount,
  @id = @employee_id;
```

Never concatenate untrusted input into dynamic SQL.
