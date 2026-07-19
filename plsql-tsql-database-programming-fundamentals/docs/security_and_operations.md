# Security and Operations

## Identity and Permissions

- Use separate deployment and runtime identities.
- Avoid application use of `SYS`, `SYSTEM`, or `sa`.
- Grant only required object and execution permissions.
- Prefer execution through reviewed stored APIs when it reduces direct table privileges.
- Review ownership chaining, definer rights, invoker rights, and cross-schema access deliberately.

## Secrets

- Keep `.env` out of source control.
- Use secret stores for shared environments.
- Avoid passwords in process arguments and shell history.
- Rotate all credentials copied from examples.
- Do not log full connection strings or sensitive procedure inputs.

## SQL Injection

Static SQL with bind parameters is preferred.

When dynamic SQL is required:

- Parameterize values.
- Allowlist object names that cannot be bound.
- Use `EXECUTE IMMEDIATE ... USING` in PL/SQL.
- Use `sp_executesql` with typed parameters in T-SQL.
- Never concatenate untrusted text directly.

## Transaction Operations

- Define who owns commit and rollback.
- Keep transactions as short as possible.
- Avoid user interaction or network calls inside transactions.
- Handle deadlocks and transient failures at an appropriate caller layer.
- Verify transaction state after errors.
- Test rollback behavior, not only success paths.

## Trigger Operations

- Document every trigger next to its table.
- Keep trigger work small and set-based.
- Avoid external calls and long-running queries.
- Test multi-row inserts, updates, and deletes.
- Monitor recursion and cascading behavior.
- Prefer explicit APIs when hidden side effects would surprise callers.

## Performance

- Use realistic data volumes for tests.
- Review query plans and indexes for important statements.
- Avoid row-by-row loops when a set operation exists.
- Minimize repeated SQL-to-procedural context switches.
- Watch scalar function use in large result sets.
- Keep statistics and maintenance policies appropriate to the environment.

## Deployment

- Store all database objects in source control.
- Use ordered, repeatable scripts.
- Stop deployments on compilation or execution errors.
- Record target database versions.
- Separate schema changes, reference data, and programmable objects.
- Use backups and tested recovery procedures for real environments.
