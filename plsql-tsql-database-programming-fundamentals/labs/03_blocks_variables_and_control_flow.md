# Lab 03 - Blocks, Variables, and Control Flow

## Goal

Implement salary classification using procedural constructs.

## Oracle Task

Write an anonymous PL/SQL block that:

1. Accepts an employee ID through a local variable.
2. Loads employee name and salary with `SELECT ... INTO`.
3. Classifies salary as `STANDARD`, `MEDIUM`, or `HIGH`.
4. Prints a readable line with `DBMS_OUTPUT.PUT_LINE`.
5. Handles a missing employee.

Use `%TYPE` for at least one variable.

## SQL Server Task

Write a T-SQL batch that:

1. Declares an employee ID.
2. Loads employee name and salary into local variables.
3. Checks explicitly whether a row was found.
4. Uses `IF / ELSE IF / ELSE` to classify salary.
5. Prints or returns the result.

## Extension

Loop from 1 to 5 and print the employee ID. Then explain why a loop is not the preferred way to return all five employee rows.

## Compare

- Variable prefix and assignment syntax
- Missing-row behavior
- Type anchoring
- Output mechanisms
