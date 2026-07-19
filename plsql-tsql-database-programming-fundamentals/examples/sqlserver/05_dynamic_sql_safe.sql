USE TrainingDB;
GO

CREATE OR ALTER PROCEDURE dbo.usp_add_fixed_bonus
  @employee_id INT,
  @amount DECIMAL(12,2)
AS
BEGIN
  SET NOCOUNT ON;

  DECLARE @sql NVARCHAR(MAX) = N'
    UPDATE dbo.employees
    SET salary = salary + @amount
    WHERE employee_id = @employee_id;';

  EXEC sys.sp_executesql
    @sql,
    N'@amount DECIMAL(12,2), @employee_id INT',
    @amount = @amount,
    @employee_id = @employee_id;

  IF @@ROWCOUNT = 0
    THROW 50001, 'Employee not found', 1;
END;
GO
