# Course Manifest

This file summarizes the reusable materials included in the course.

## Core Files

| Path | Purpose |
|---|---|
| `README.md` | Course overview, objectives, structure, prerequisites, and quick start |
| `Makefile` | Short commands for validation and local database lifecycle |
| `.env.example` | Example local lab configuration without real credentials |
| `LICENSE.md` | Licensing summary for educational content and executable examples |

## Slides

| Path | Topic |
|---|---|
| `slides/00_course_introduction.md` | Scope, outcomes, architecture, and delivery options |
| `slides/01_relational_and_sql_foundations.md` | Relational modeling and shared SQL foundations |
| `slides/02_oracle_and_sql_server_environments.md` | Platform architecture, tools, schemas, and batch execution |
| `slides/03_procedural_language_fundamentals.md` | Blocks, variables, types, conditions, loops, and scope |
| `slides/04_procedures_functions_and_packages.md` | Stored APIs, parameters, functions, packages, and schemas |
| `slides/05_query_processing_and_cursors.md` | Cursors, result processing, and set-based alternatives |
| `slides/06_exceptions_errors_and_transactions.md` | Error handling, transaction boundaries, and rollback strategies |
| `slides/07_triggers_performance_security_and_testing.md` | Triggers, performance, security, deployment, and testing |

## Documentation

| Path | Purpose |
|---|---|
| `docs/setup_guide.md` | Detailed Docker and client setup instructions |
| `docs/plsql_vs_tsql.md` | Side-by-side language and platform comparison |
| `docs/cheat_sheet.md` | Frequently used syntax and commands |
| `docs/glossary.md` | Key relational and procedural database terms |
| `docs/instructor_guide.md` | Delivery plan, demonstrations, and timing |
| `docs/security_and_operations.md` | Practical operational and security guidance |
| `docs/troubleshooting.md` | Common lab problems and diagnostic commands |
| `docs/useful_links.md` | Official and primary reference material |

## Labs and Examples

| Path | Purpose |
|---|---|
| `labs/` | Seven guided comparative exercises and final challenge |
| `examples/oracle/` | Focused PL/SQL examples |
| `examples/sqlserver/` | Focused T-SQL examples |
| `examples/comparison/` | Same tasks shown side by side |
| `lab/docker-compose.yml` | Optional local two-database environment |
| `lab/oracle/init/` | Oracle schema, sample data, and stored program units |
| `lab/sqlserver/init/` | SQL Server schema, sample data, and stored program units |
| `scripts/wait_for_databases.sh` | Readiness checks for the local containers |
| `scripts/validate_content.py` | Package and public-content validation |
| `quizzes/` | Fundamentals and scenario-based knowledge checks |
