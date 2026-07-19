SET NOCOUNT ON;
GO

IF DB_ID(N'TrainingDB') IS NULL
BEGIN
  CREATE DATABASE TrainingDB;
END;
GO

USE TrainingDB;
GO

IF OBJECT_ID(N'dbo.departments', N'U') IS NULL
BEGIN
  CREATE TABLE dbo.departments (
    department_id INT IDENTITY(1,1) NOT NULL,
    department_name NVARCHAR(100) NOT NULL,
    location_name NVARCHAR(100) NULL,
    CONSTRAINT pk_departments PRIMARY KEY (department_id),
    CONSTRAINT uq_departments_name UNIQUE (department_name)
  );
END;
GO

IF OBJECT_ID(N'dbo.employees', N'U') IS NULL
BEGIN
  CREATE TABLE dbo.employees (
    employee_id INT IDENTITY(1,1) NOT NULL,
    full_name NVARCHAR(100) NOT NULL,
    email NVARCHAR(200) NOT NULL,
    department_id INT NOT NULL,
    manager_id INT NULL,
    salary DECIMAL(12,2) NOT NULL,
    hire_date DATE NOT NULL CONSTRAINT df_employees_hire_date DEFAULT (CONVERT(date, SYSUTCDATETIME())),
    active_flag CHAR(1) NOT NULL CONSTRAINT df_employees_active DEFAULT ('Y'),
    CONSTRAINT pk_employees PRIMARY KEY (employee_id),
    CONSTRAINT uq_employees_email UNIQUE (email),
    CONSTRAINT ck_employees_salary CHECK (salary >= 0),
    CONSTRAINT ck_employees_active CHECK (active_flag IN ('Y', 'N')),
    CONSTRAINT fk_employees_department FOREIGN KEY (department_id)
      REFERENCES dbo.departments (department_id),
    CONSTRAINT fk_employees_manager FOREIGN KEY (manager_id)
      REFERENCES dbo.employees (employee_id)
  );
END;
GO

IF OBJECT_ID(N'dbo.salary_audit', N'U') IS NULL
BEGIN
  CREATE TABLE dbo.salary_audit (
    audit_id BIGINT IDENTITY(1,1) NOT NULL,
    employee_id INT NOT NULL,
    old_salary DECIMAL(12,2) NOT NULL,
    new_salary DECIMAL(12,2) NOT NULL,
    changed_by SYSNAME NOT NULL,
    changed_at DATETIME2(3) NOT NULL CONSTRAINT df_salary_audit_changed_at DEFAULT (SYSUTCDATETIME()),
    CONSTRAINT pk_salary_audit PRIMARY KEY (audit_id),
    CONSTRAINT fk_salary_audit_employee FOREIGN KEY (employee_id)
      REFERENCES dbo.employees (employee_id)
  );
END;
GO

SET IDENTITY_INSERT dbo.departments ON;

IF NOT EXISTS (SELECT 1 FROM dbo.departments WHERE department_id = 10)
  INSERT INTO dbo.departments (department_id, department_name, location_name)
  VALUES (10, N'Engineering', N'Berlin');

IF NOT EXISTS (SELECT 1 FROM dbo.departments WHERE department_id = 20)
  INSERT INTO dbo.departments (department_id, department_name, location_name)
  VALUES (20, N'Operations', N'Sofia');

IF NOT EXISTS (SELECT 1 FROM dbo.departments WHERE department_id = 30)
  INSERT INTO dbo.departments (department_id, department_name, location_name)
  VALUES (30, N'Finance', N'Warsaw');

SET IDENTITY_INSERT dbo.departments OFF;
GO

SET IDENTITY_INSERT dbo.employees ON;

IF NOT EXISTS (SELECT 1 FROM dbo.employees WHERE employee_id = 1)
  INSERT INTO dbo.employees (
    employee_id, full_name, email, department_id, manager_id, salary, hire_date
  ) VALUES (1, N'Alex Morgan', N'alex.morgan@example.test', 10, NULL, 90000, '2021-02-15');

IF NOT EXISTS (SELECT 1 FROM dbo.employees WHERE employee_id = 2)
  INSERT INTO dbo.employees (
    employee_id, full_name, email, department_id, manager_id, salary, hire_date
  ) VALUES (2, N'Maya Chen', N'maya.chen@example.test', 10, 1, 72000, '2022-05-10');

IF NOT EXISTS (SELECT 1 FROM dbo.employees WHERE employee_id = 3)
  INSERT INTO dbo.employees (
    employee_id, full_name, email, department_id, manager_id, salary, hire_date
  ) VALUES (3, N'Daniel Novak', N'daniel.novak@example.test', 20, 1, 64000, '2023-01-20');

IF NOT EXISTS (SELECT 1 FROM dbo.employees WHERE employee_id = 4)
  INSERT INTO dbo.employees (
    employee_id, full_name, email, department_id, manager_id, salary, hire_date
  ) VALUES (4, N'Sara Ivanova', N'sara.ivanova@example.test', 20, 3, 52000, '2024-03-11');

IF NOT EXISTS (SELECT 1 FROM dbo.employees WHERE employee_id = 5)
  INSERT INTO dbo.employees (
    employee_id, full_name, email, department_id, manager_id, salary, hire_date
  ) VALUES (5, N'Noah Smith', N'noah.smith@example.test', 30, 1, 58000, '2022-09-01');

SET IDENTITY_INSERT dbo.employees OFF;
GO

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

CREATE OR ALTER PROCEDURE dbo.usp_give_raise
  @employee_id INT,
  @percent DECIMAL(5,2)
AS
BEGIN
  SET NOCOUNT ON;
  SET XACT_ABORT ON;

  IF @percent <= 0 OR @percent > 25
    THROW 50002, 'Raise percent must be greater than 0 and at most 25', 1;

  UPDATE dbo.employees
  SET salary = ROUND(salary * (1 + @percent / 100.0), 2)
  WHERE employee_id = @employee_id;

  IF @@ROWCOUNT = 0
    THROW 50001, 'Employee not found', 1;
END;
GO

CREATE OR ALTER TRIGGER dbo.tr_salary_audit
ON dbo.employees
AFTER UPDATE
AS
BEGIN
  SET NOCOUNT ON;

  INSERT INTO dbo.salary_audit (
    employee_id,
    old_salary,
    new_salary,
    changed_by,
    changed_at
  )
  SELECT
    i.employee_id,
    d.salary,
    i.salary,
    SUSER_SNAME(),
    SYSUTCDATETIME()
  FROM inserted AS i
  INNER JOIN deleted AS d ON d.employee_id = i.employee_id
  WHERE i.salary <> d.salary;
END;
GO
