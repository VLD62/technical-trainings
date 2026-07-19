# Lab 05 - Cursors and Set-Based Processing

## Goal

Understand cursor mechanics and replace unnecessary loops.

## Tasks

### 1. Cursor Output

Run the supplied Oracle cursor loop and SQL Server cursor example. Confirm that both print every employee.

### 2. Cursor Lifecycle

For SQL Server, identify:

- Declaration
- Open
- First fetch
- Fetch loop
- Close
- Deallocate

For Oracle, explain which steps the cursor `FOR` loop handles automatically.

### 3. Set-Based Rewrite

Replace a cursor that calculates department payroll with one grouped query.

### 4. Bulk Raise

Implement a 3 percent raise for all employees hired before a chosen date using one `UPDATE` statement.

### 5. Performance Thought Experiment

Discuss how the cursor and set-based forms behave with:

- 5 rows
- 50,000 rows
- An audit trigger
- A long-running transaction

## Extension

Research Oracle `BULK COLLECT` and `FORALL`, and SQL Server table-valued parameters. Explain when each is useful without adding them to the basic solution.
