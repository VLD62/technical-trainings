# PL/SQL vs T-SQL

This comparison focuses on practical concepts. Similar-looking constructs can have different runtime semantics.

| Concept | Oracle PL/SQL | SQL Server T-SQL |
|---|---|---|
| Procedural unit | Anonymous block or stored program unit | Batch or stored program unit |
| Local variable | `v_name VARCHAR2(100);` | `DECLARE @name NVARCHAR(100);` |
| Assignment | `v_name := 'A';` | `SET @name = N'A';` |
| Query into variables | `SELECT ... INTO ... FROM ...` | `SELECT @var = ... FROM ...` |
| Output | `DBMS_OUTPUT.PUT_LINE` | `PRINT` or result set |
| Conditional | `IF ... THEN ... END IF;` | `IF ... BEGIN ... END` |
| General loop | `LOOP`, `WHILE`, numeric `FOR` | `WHILE` |
| Cursor loop | Cursor `FOR` loop | Explicit cursor lifecycle |
| Missing single-row query | `NO_DATA_FOUND` | Variable remains unchanged or NULL depending on initialization |
| Too many single-row results | `TOO_MANY_ROWS` | Variable assignment can consume multiple rows; final assignment wins unless explicitly constrained |
| Procedure replacement | `CREATE OR REPLACE` | `CREATE OR ALTER` |
| Function return | `RETURN datatype` | `RETURNS datatype` |
| Package | Native specification and body | No direct equivalent; use schemas and conventions |
| Error handler | `EXCEPTION` section | `TRY...CATCH` |
| Raise custom error | `RAISE_APPLICATION_ERROR` | `THROW` |
| Current DML row count | `SQL%ROWCOUNT` | `@@ROWCOUNT` |
| Savepoint | `SAVEPOINT name` | `SAVE TRANSACTION name` |
| Trigger row images | `:OLD`, `:NEW` | `deleted`, `inserted` tables |
| Batch terminator | `/` in common Oracle clients | `GO` in common Microsoft clients |
| Dynamic SQL | `EXECUTE IMMEDIATE` | `sp_executesql` preferred over `EXEC()` |
| Type anchoring | `%TYPE`, `%ROWTYPE` | No direct equivalent |

## Important Semantic Differences

### Single-Row Query Assignment

PL/SQL `SELECT ... INTO` expects exactly one row and raises predefined exceptions for zero or multiple rows.

T-SQL variable assignment through `SELECT` does not provide the same contract. Validate row counts or design the query so cardinality is explicit.

### Trigger Granularity

Oracle supports row-level triggers with `FOR EACH ROW`. SQL Server DML triggers execute once per statement and expose all changed rows in `inserted` and `deleted` tables.

### Transaction Nesting

SQL Server increments `@@TRANCOUNT` for nested `BEGIN TRANSACTION` calls, but an inner commit does not independently make changes durable. Oracle transaction handling is session-based and PL/SQL subprograms normally participate in the caller's transaction unless autonomous transactions are explicitly used.

### Packages

Oracle packages provide an explicit public specification, body, shared state, private objects, and overloads. SQL Server has no direct package construct. Schemas and naming conventions help organization but do not reproduce all package semantics.

### Boolean Values

PL/SQL supports `BOOLEAN` in procedural code, though SQL interoperability varies by database version and context. T-SQL commonly uses `BIT` or predicates rather than a full procedural Boolean type.

## Translation Rule

Do not translate line by line. Translate the contract:

1. Inputs and outputs
2. Expected cardinality
3. Transaction ownership
4. Error behavior
5. Concurrency behavior
6. Permission model
7. Performance expectation
