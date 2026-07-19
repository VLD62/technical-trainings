SET SERVEROUTPUT ON;

DECLARE
  v_before employees.salary%TYPE;
  v_after  employees.salary%TYPE;
BEGIN
  SELECT salary INTO v_before
  FROM employees
  WHERE employee_id = 1;

  SAVEPOINT before_raise;
  employee_api.give_raise(1, 5);

  SELECT salary INTO v_after
  FROM employees
  WHERE employee_id = 1;

  DBMS_OUTPUT.PUT_LINE('Before: ' || v_before || ', after: ' || v_after);
  ROLLBACK TO before_raise;
  DBMS_OUTPUT.PUT_LINE('Rolled back to savepoint');
END;
/
