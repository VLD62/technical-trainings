USE TrainingDB;
GO

DECLARE @employee_id INT = 1;
DECLARE @name NVARCHAR(100);
DECLARE @salary DECIMAL(12,2);
DECLARE @band VARCHAR(20);

SELECT
  @name = full_name,
  @salary = salary
FROM dbo.employees
WHERE employee_id = @employee_id;

IF @name IS NULL
BEGIN
  PRINT 'Employee not found';
END
ELSE
BEGIN
  IF @salary >= 80000 SET @band = 'HIGH';
  ELSE IF @salary >= 50000 SET @band = 'MEDIUM';
  ELSE SET @band = 'STANDARD';

  PRINT CONCAT(@name, ': ', @band);
END;
GO
