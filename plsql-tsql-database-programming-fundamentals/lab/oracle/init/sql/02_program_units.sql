CREATE OR REPLACE PACKAGE employee_api AS
  FUNCTION annual_salary (
    p_employee_id IN employees.employee_id%TYPE
  ) RETURN NUMBER;

  PROCEDURE give_raise (
    p_employee_id IN employees.employee_id%TYPE,
    p_percent     IN NUMBER
  );
END employee_api;
/

CREATE OR REPLACE PACKAGE BODY employee_api AS
  FUNCTION annual_salary (
    p_employee_id IN employees.employee_id%TYPE
  ) RETURN NUMBER AS
    v_salary employees.salary%TYPE;
  BEGIN
    SELECT salary
    INTO v_salary
    FROM employees
    WHERE employee_id = p_employee_id;

    RETURN v_salary * 12;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RAISE_APPLICATION_ERROR(-20001, 'Employee not found');
  END annual_salary;

  PROCEDURE give_raise (
    p_employee_id IN employees.employee_id%TYPE,
    p_percent     IN NUMBER
  ) AS
  BEGIN
    IF p_percent <= 0 OR p_percent > 25 THEN
      RAISE_APPLICATION_ERROR(-20002, 'Raise percent must be greater than 0 and at most 25');
    END IF;

    UPDATE employees
    SET salary = ROUND(salary * (1 + p_percent / 100), 2)
    WHERE employee_id = p_employee_id;

    IF SQL%ROWCOUNT = 0 THEN
      RAISE_APPLICATION_ERROR(-20001, 'Employee not found');
    END IF;
  END give_raise;
END employee_api;
/

CREATE OR REPLACE TRIGGER salary_audit_trg
AFTER UPDATE OF salary ON employees
FOR EACH ROW
WHEN (OLD.salary <> NEW.salary)
BEGIN
  INSERT INTO salary_audit (
    employee_id,
    old_salary,
    new_salary,
    changed_by,
    changed_at
  ) VALUES (
    :NEW.employee_id,
    :OLD.salary,
    :NEW.salary,
    SYS_CONTEXT('USERENV', 'SESSION_USER'),
    SYSTIMESTAMP
  );
END;
/
