USE TrainingDB;
GO

DECLARE @employee_id INT;
DECLARE @name NVARCHAR(100);
DECLARE @salary DECIMAL(12,2);

DECLARE employee_cursor CURSOR LOCAL FAST_FORWARD FOR
  SELECT employee_id, full_name, salary
  FROM dbo.employees
  ORDER BY employee_id;

OPEN employee_cursor;
FETCH NEXT FROM employee_cursor INTO @employee_id, @name, @salary;

WHILE @@FETCH_STATUS = 0
BEGIN
  PRINT CONCAT(@employee_id, ' | ', @name, ' | ', @salary);
  FETCH NEXT FROM employee_cursor INTO @employee_id, @name, @salary;
END;

CLOSE employee_cursor;
DEALLOCATE employee_cursor;
GO
