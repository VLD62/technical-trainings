USE TrainingDB;
GO

PRINT 'SQL Server training schema verification';
SELECT SUSER_SNAME() AS login_name, DB_NAME() AS database_name;
SELECT COUNT(*) AS department_count FROM dbo.departments;
SELECT COUNT(*) AS employee_count FROM dbo.employees;
SELECT dbo.fn_annual_salary(1) AS annual_salary;

SELECT
  d.department_name,
  COUNT(e.employee_id) AS employee_count,
  SUM(e.salary) AS payroll
FROM dbo.departments AS d
LEFT JOIN dbo.employees AS e ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY d.department_name;
GO
