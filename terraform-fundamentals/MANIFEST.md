# Course Manifest

This file summarizes the reusable materials included in the **Terraform: Fundamentals** course.

## Core Files

| Path | Purpose |
|---|---|
| `README.md` | Course overview, learning objectives, prerequisites, and setup |
| `Makefile` | Short commands for validation, examples, tests, and cleanup |
| `.gitignore` | Terraform-specific generated and sensitive file exclusions |
| `LICENSE.md` | Licensing summary and third-party attribution guidance |

## Slides

| Path | Topic |
|---|---|
| `slides/00_course_introduction.md` | Course scope, learning flow, setup, and safety |
| `slides/01_iac_and_terraform_foundations.md` | Infrastructure as Code, desired state, and Terraform architecture |
| `slides/02_hcl_providers_resources_and_data.md` | HCL blocks, providers, resources, data sources, and dependencies |
| `slides/03_core_workflow.md` | Init, format, validate, plan, apply, inspect, and destroy |
| `slides/04_variables_expressions_and_outputs.md` | Variables, locals, outputs, types, expressions, and iteration |
| `slides/05_state_backends_and_workspaces.md` | State, locking, backends, drift, and CLI workspaces |
| `slides/06_modules_and_reuse.md` | Root modules, child modules, interfaces, and versioning |
| `slides/07_lifecycle_import_and_refactoring.md` | Lifecycle rules, imports, moved blocks, and safe refactoring |
| `slides/08_testing_security_automation_and_troubleshooting.md` | Tests, security, CI/CD, policy, and diagnostics |

## Documentation

| Path | Purpose |
|---|---|
| `docs/lab_setup.md` | Terraform CLI installation and editor setup |
| `docs/cli_cheat_sheet.md` | High-value Terraform CLI commands |
| `docs/hcl_cheat_sheet.md` | HCL syntax, types, expressions, and block patterns |
| `docs/state_and_backends.md` | State model, locking, remote backends, and recovery guidance |
| `docs/modules_best_practices.md` | Module design, contracts, composition, and versioning |
| `docs/testing_and_validation.md` | Formatting, validation, native tests, linting, and checks |
| `docs/security_and_secrets.md` | Credentials, secret handling, state security, and supply chain |
| `docs/ci_cd_workflow.md` | Pull-request and protected-apply pipeline design |
| `docs/troubleshooting.md` | Common errors and a structured diagnostic workflow |
| `docs/glossary.md` | Concise definitions of Terraform and IaC terms |
| `docs/useful_links.md` | Official learning and reference resources |
| `docs/instructor_guide.md` | Suggested delivery plan and demonstrations |
| `docs/repository_integration.md` | Main repository catalog and tree update snippets |

## Labs and Examples

| Path | Purpose |
|---|---|
| `labs/` | Six guided practical labs from first apply to CI design |
| `examples/01-local-basics/` | Provider-free first configuration and workflow |
| `examples/02-variables-and-collections/` | Variables, locals, outputs, `for_each`, and validation |
| `examples/03-local-module/` | Root module and reusable local child module |
| `examples/04-lifecycle-and-conditions/` | Dependencies, lifecycle, preconditions, and replacement triggers |
| `examples/05-refactoring/` | Resource address refactoring with a `moved` block |
| `examples/06-tests/` | Native Terraform test example |
| `examples/07-docker-optional/` | Optional real-provider Docker container example |
| `scripts/validate_environment.sh` | Read-only local tool and version checks |
| `scripts/validate_content.py` | Required-file and Markdown-link validation |
| `quizzes/` | Topic reviews and a final assessment |
