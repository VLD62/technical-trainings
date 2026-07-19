# Lab 06 - Exceptions and Transactions

## Goal

Build a failure-safe salary transfer between two employees.

## Scenario

Move a monthly budget amount from one employee's salary to another while preserving total payroll.

## Requirements

- Reject non-positive amounts.
- Reject missing employees.
- Reject a source salary that would become negative.
- Lock or update rows in a consistent order where practical.
- Apply both changes atomically.
- Roll back all changes on failure.
- Re-raise a meaningful error.

## Oracle Tasks

1. Implement the operation in an anonymous block or procedure.
2. Use a savepoint.
3. Handle expected exceptions.
4. Print `SQLCODE`, `SQLERRM`, and an error backtrace during the exercise.
5. Let the caller decide final commit or rollback.

## SQL Server Tasks

1. Implement the operation in `TRY...CATCH`.
2. Use `BEGIN TRANSACTION` and `SAVE TRANSACTION` intentionally.
3. Inspect `XACT_STATE()` in the catch block.
4. Roll back correctly.
5. Use `THROW` to preserve the original error when appropriate.

## Verification

Record salaries before and after:

- Successful transfer followed by rollback
- Invalid source employee
- Excessive amount
- Forced error after the first update

Total payroll must remain unchanged after every failed attempt.
