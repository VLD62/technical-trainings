INSERT INTO departments (department_id, department_name, location_name)
VALUES (10, 'Engineering', 'Berlin');

INSERT INTO departments (department_id, department_name, location_name)
VALUES (20, 'Operations', 'Sofia');

INSERT INTO departments (department_id, department_name, location_name)
VALUES (30, 'Finance', 'Warsaw');

INSERT INTO employees (
  employee_id, full_name, email, department_id, manager_id, salary, hire_date
) VALUES (
  1, 'Alex Morgan', 'alex.morgan@example.test', 10, NULL, 90000, DATE '2021-02-15'
);

INSERT INTO employees (
  employee_id, full_name, email, department_id, manager_id, salary, hire_date
) VALUES (
  2, 'Maya Chen', 'maya.chen@example.test', 10, 1, 72000, DATE '2022-05-10'
);

INSERT INTO employees (
  employee_id, full_name, email, department_id, manager_id, salary, hire_date
) VALUES (
  3, 'Daniel Novak', 'daniel.novak@example.test', 20, 1, 64000, DATE '2023-01-20'
);

INSERT INTO employees (
  employee_id, full_name, email, department_id, manager_id, salary, hire_date
) VALUES (
  4, 'Sara Ivanova', 'sara.ivanova@example.test', 20, 3, 52000, DATE '2024-03-11'
);

INSERT INTO employees (
  employee_id, full_name, email, department_id, manager_id, salary, hire_date
) VALUES (
  5, 'Noah Smith', 'noah.smith@example.test', 30, 1, 58000, DATE '2022-09-01'
);

COMMIT;
