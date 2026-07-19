# Lab 07 - Triggers and Final Challenge

## Goal

Verify audit behavior and design a small database API on both platforms.

## Part 1 - Audit Trigger

1. Clear or record the current audit-row count.
2. Update one employee salary.
3. Update all employees in one department with one statement.
4. Query the audit table.
5. Roll back or reset the lab.

Explain:

- Why the Oracle trigger uses `FOR EACH ROW`.
- Why the SQL Server trigger reads from `inserted` and `deleted` as sets.
- What would break if the SQL Server trigger assumed one row.

## Part 2 - Final Challenge

Create an API called `change_department` that moves an employee to another department.

Requirements:

- Validate source employee and target department.
- Reject a move to the current department.
- Record old and new department values in a new audit table.
- Return or print a useful result.
- Participate in the caller's transaction.
- Provide tests for success, missing employee, missing department, and rollback.

Oracle implementation:

- Add the procedure to a package.
- Use anchored parameter or variable types.
- Raise application errors in the `-20000` range.

SQL Server implementation:

- Use `CREATE OR ALTER PROCEDURE`.
- Use `THROW` with custom error numbers.
- Ensure the audit logic handles multi-row statements if implemented as a trigger.

## Review

Complete `quizzes/02_scenarios.md` and compare the two implementations by contract, not line count.
