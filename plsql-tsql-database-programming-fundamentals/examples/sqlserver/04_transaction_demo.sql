USE TrainingDB;
GO

DECLARE @before DECIMAL(12,2);
DECLARE @after DECIMAL(12,2);

SELECT @before = salary FROM dbo.employees WHERE employee_id = 1;

BEGIN TRY
  BEGIN TRANSACTION;
  SAVE TRANSACTION before_raise;

  EXEC dbo.usp_give_raise @employee_id = 1, @percent = 5;
  SELECT @after = salary FROM dbo.employees WHERE employee_id = 1;

  SELECT @before AS salary_before, @after AS salary_after;

  ROLLBACK TRANSACTION before_raise;
  COMMIT TRANSACTION;
END TRY
BEGIN CATCH
  IF XACT_STATE() <> 0 ROLLBACK TRANSACTION;
  THROW;
END CATCH;
GO
