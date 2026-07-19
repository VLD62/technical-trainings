USE TrainingDB;
GO

BEGIN TRY
  EXEC dbo.usp_give_raise @employee_id = 99999, @percent = 5;
END TRY
BEGIN CATCH
  SELECT
    ERROR_NUMBER() AS error_number,
    ERROR_MESSAGE() AS error_message,
    ERROR_LINE() AS error_line,
    ERROR_PROCEDURE() AS error_procedure;
END CATCH;
GO
