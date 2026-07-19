# Lab 02 - Query the Shared Schema

## Goal

Practice shared relational concepts before writing procedural code.

## Tasks

Run equivalent queries on both platforms.

### 1. Employees and Departments

Return employee ID, employee name, department name, salary, and hire date.

### 2. Department Payroll

Return one row per department with:

- Employee count
- Minimum salary
- Maximum salary
- Total payroll

### 3. Employees Above Department Average

Use a correlated subquery or common table expression.

### 4. NULL Handling

Insert an employee with no manager and explain why `manager_id = NULL` does not work.

### 5. Safe Update Preview

Write a `SELECT` that identifies employees in department 20. Then write, but do not immediately commit, a statement that increases their salaries by 2 percent.

## Compare

- Date literal syntax
- String data types
- Identifier qualification
- Output formatting in the selected client
- Behavior of uncommitted changes in a second session
