# Same Task Side by Side

## Calculate Annual Salary

### Oracle PL/SQL

```sql
CREATE OR REPLACE FUNCTION annual_salary (
  p_employee_id IN employees.employee_id%TYPE
) RETURN NUMBER AS
  v_salary employees.salary%TYPE;
BEGIN
  SELECT salary INTO v_salary
  FROM employees
  WHERE employee_id = p_employee_id;

  RETURN v_salary * 12;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RAISE_APPLICATION_ERROR(-20001, 'Employee not found');
END;
/
```

### SQL Server T-SQL

```sql
CREATE OR ALTER FUNCTION dbo.fn_annual_salary (
  @employee_id INT
)
RETURNS DECIMAL(14,2)
AS
BEGIN
  DECLARE @annual_salary DECIMAL(14,2);

  SELECT @annual_salary = salary * 12
  FROM dbo.employees
  WHERE employee_id = @employee_id;

  RETURN @annual_salary;
END;
GO
```

## Discussion

- PL/SQL raises an exception when `SELECT INTO` returns no row.
- The T-SQL function returns NULL for a missing employee in this implementation.
- Decide whether both APIs should have identical contracts before migrating.
- SQL Server user-defined functions have restrictions on side effects and error raising.
- A query or view may be a better choice when calculating annual salary for many employees.
