# Quiz 01 - Fundamentals

## Questions

1. What problem do PL/SQL and T-SQL solve beyond standard SQL?
2. Why is a set-based `UPDATE` usually preferred over a cursor loop?
3. What is the difference between Oracle `/` and SQL Server client `GO`?
4. What happens when a PL/SQL `SELECT ... INTO` returns no rows?
5. Does T-SQL variable assignment through `SELECT` provide the same missing-row behavior?
6. What does `%TYPE` provide in PL/SQL?
7. What is the closest organizational alternative to an Oracle package in SQL Server?
8. Why should transaction ownership be documented?
9. What are `inserted` and `deleted` in a SQL Server trigger?
10. Why is `WHEN OTHERS THEN NULL` dangerous?

## Suggested Answers

1. They add variables, control flow, stored program units, error handling, and procedural orchestration close to data.
2. It gives the optimizer a complete operation and avoids repeated row-by-row overhead.
3. `/` submits a completed PL/SQL unit in common Oracle clients; `GO` separates batches in Microsoft clients and is not a T-SQL statement.
4. PL/SQL raises `NO_DATA_FOUND`.
5. No. The variable may remain unchanged or NULL depending on initialization and query behavior.
6. It anchors a variable or parameter type to a database column or other declaration.
7. Schemas, naming conventions, roles, and source organization, though no alternative reproduces every package feature.
8. Hidden commits or rollbacks can break composition and caller expectations.
9. Statement-level logical tables containing all affected row versions.
10. It hides failure and can leave callers believing an operation succeeded.
