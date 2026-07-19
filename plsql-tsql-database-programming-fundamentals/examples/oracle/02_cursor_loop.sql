SET SERVEROUTPUT ON;

BEGIN
  FOR r_emp IN (
    SELECT employee_id, full_name, salary
    FROM employees
    ORDER BY employee_id
  ) LOOP
    DBMS_OUTPUT.PUT_LINE(
      r_emp.employee_id || ' | ' || r_emp.full_name || ' | ' || r_emp.salary
    );
  END LOOP;
END;
/
