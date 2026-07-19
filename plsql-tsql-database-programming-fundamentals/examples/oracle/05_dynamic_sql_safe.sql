CREATE OR REPLACE PROCEDURE add_fixed_bonus (
  p_employee_id IN employees.employee_id%TYPE,
  p_amount      IN NUMBER
) AS
BEGIN
  EXECUTE IMMEDIATE
    'UPDATE employees SET salary = salary + :amount WHERE employee_id = :employee_id'
    USING p_amount, p_employee_id;

  IF SQL%ROWCOUNT = 0 THEN
    RAISE_APPLICATION_ERROR(-20001, 'Employee not found');
  END IF;
END;
/
