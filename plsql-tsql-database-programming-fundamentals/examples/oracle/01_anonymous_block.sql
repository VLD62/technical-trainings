SET SERVEROUTPUT ON;

DECLARE
  v_employee_id employees.employee_id%TYPE := 1;
  v_name        employees.full_name%TYPE;
  v_salary      employees.salary%TYPE;
  v_band        VARCHAR2(20);
BEGIN
  SELECT full_name, salary
  INTO v_name, v_salary
  FROM employees
  WHERE employee_id = v_employee_id;

  IF v_salary >= 80000 THEN
    v_band := 'HIGH';
  ELSIF v_salary >= 50000 THEN
    v_band := 'MEDIUM';
  ELSE
    v_band := 'STANDARD';
  END IF;

  DBMS_OUTPUT.PUT_LINE(v_name || ': ' || v_band);
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Employee not found');
END;
/
