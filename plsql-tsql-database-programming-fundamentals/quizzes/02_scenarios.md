# Quiz 02 - Scenarios

## Scenario 1

A developer loops through 100,000 employees and executes one update per employee.

- What should be reviewed first?
- When might a cursor still be justified?

## Scenario 2

A SQL Server trigger reads one scalar value from `inserted` and works in tests that update one row.

- What happens during a multi-row update?
- How should the trigger be redesigned?

## Scenario 3

An Oracle procedure catches `WHEN OTHERS`, logs only `SQLERRM`, and returns normally.

- What information is lost?
- What should the procedure do after logging?

## Scenario 4

A reusable procedure commits after every successful update.

- Why can this be a problem for callers?
- Which component should own the transaction?

## Scenario 5

Dynamic SQL concatenates a user-provided department name into a query.

- What is the risk?
- How can values and object names be handled safely?

## Scenario 6

A migration translates Oracle package functions into individual SQL Server scalar functions.

- Which package features may be lost?
- Why must each function's query performance be retested?

## Discussion Guide

Strong answers should mention set-based rewrites, multi-row semantics, backtraces and re-raising, explicit transaction contracts, parameterization and allowlists, package encapsulation, permissions, shared state, overloads, and platform-specific optimizer behavior.
