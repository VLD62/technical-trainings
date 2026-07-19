# Instructor Guide

## Recommended Full-Day Flow

| Time | Topic | Demonstration |
|---|---|---|
| 00:00-00:20 | Introduction and shared model | Verify both databases |
| 00:20-01:00 | Relational and SQL foundations | Same query on both platforms |
| 01:00-01:35 | Platform environments | Schema, database, client, and batch boundaries |
| 01:35-02:20 | Blocks and variables | Salary-band anonymous block and batch |
| 02:20-02:30 | Break | |
| 02:30-03:25 | Procedures, functions, packages | Execute raise and annual-salary APIs |
| 03:25-04:05 | Cursors and set-based alternatives | Compare loop and grouped query |
| 04:05-04:35 | Lunch or long break | |
| 04:35-05:30 | Errors and transactions | Force failure and verify rollback |
| 05:30-06:10 | Triggers and audit | Multi-row salary update |
| 06:10-06:40 | Security, performance, testing | Review checklist |
| 06:40-07:30 | Final challenge | Implement transfer workflow |
| 07:30-08:00 | Review and quiz | Discuss trade-offs |

## Demonstration Sequence

1. `make up`
2. `make verify`
3. Show the same tables in both databases.
4. Run the anonymous PL/SQL block and T-SQL batch.
5. Execute stored salary functions.
6. Execute raise procedures inside explicit transactions.
7. Show the Oracle package API.
8. Run a multi-row update and inspect audit rows.
9. Trigger an invalid percentage and compare error output.
10. Roll back and prove that data did not change.

## Teaching Emphasis

- Compare behavior, not only syntax.
- Ask participants to predict row counts and transaction state.
- Explain why SQL Server triggers must handle multiple rows.
- Show that PL/SQL single-row `SELECT INTO` has a strict cardinality contract.
- Prefer set-based solutions before introducing cursors.
- Keep administrative container details secondary to database-programming concepts.

## Compact Delivery

For a 60-minute session:

- Use slides 00, 02, 03, 04, 06, and 07.
- Demonstrate one block, one procedure, one rollback, and one trigger comparison.
- Assign labs 04 and 06 as follow-up practice.
