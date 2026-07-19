SET PAGESIZE 100
SET LINESIZE 160

PROMPT Oracle training schema verification
SELECT USER AS current_user FROM dual;
SELECT COUNT(*) AS department_count FROM departments;
SELECT COUNT(*) AS employee_count FROM employees;
SELECT employee_api.annual_salary(1) AS annual_salary FROM dual;

SELECT d.department_name,
       COUNT(e.employee_id) AS employee_count,
       SUM(e.salary) AS payroll
FROM departments d
LEFT JOIN employees e ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY d.department_name;
