# Instructor Guide

## Audience

The course is suitable for:

- DevOps engineers
- Platform engineers
- Cloud engineers
- System administrators
- Developers who collaborate on infrastructure
- Technical leads and product owners who review infrastructure changes

## Suggested Delivery

### One-Day Workshop

| Time | Topic |
|---|---|
| 09:00–09:30 | Introduction, IaC, and Terraform mental model |
| 09:30–10:30 | HCL, resources, providers, and dependencies |
| 10:45–12:00 | Core workflow and first lab |
| 13:00–14:15 | Variables, collections, expressions, and outputs |
| 14:15–15:15 | State, backends, locking, and workspaces |
| 15:30–16:30 | Modules, lifecycle, import, and refactoring |
| 16:30–17:15 | Tests, security, CI/CD, and troubleshooting |
| 17:15–17:30 | Final quiz and review |

### Two Half-Day Sessions

**Session 1:** Foundations, HCL, workflow, variables, and first two labs.

**Session 2:** State, modules, lifecycle, testing, security, CI/CD, and final labs.

## Demonstration Sequence

1. Show a small `.tf` file
2. Run `terraform fmt`
3. Run `terraform init`
4. Run `terraform validate`
5. Ask learners to predict the plan
6. Run and review `terraform plan`
7. Apply and inspect outputs
8. Inspect `terraform state list` and `state show`
9. Change one input and compare the plan
10. Destroy and verify cleanup

## Key Teaching Messages

- File order does not control resource order; dependencies do.
- A plan is a proposal that must be reviewed.
- State is a critical system component and often sensitive.
- `sensitive = true` is display redaction, not encryption.
- Modules are contracts, not just folders.
- `for_each` with stable keys is usually safer than positional indexes.
- Workspaces do not replace account-level isolation or access control.
- Import binds state; it does not automatically produce ideal configuration.
- `ignore_changes` changes ownership semantics and can hide drift.
- Automation should strengthen review and authorization, not remove them.

## Common Learner Mistakes

- Running from the wrong directory
- Forgetting `terraform init`
- Confusing resource names with remote names
- Committing state or `.tfvars`
- Using `-auto-approve` too early
- Assuming outputs marked sensitive are absent from state
- Renaming resources without a `moved` block
- Using one state for unrelated systems
- Treating validation as proof an apply will succeed

## Assessment

Learners should be able to:

- Explain each core workflow command
- Predict create, update, replace, and destroy actions
- Write typed variables and outputs
- Explain implicit dependency creation
- Describe a safe remote-state design
- Build and call a local module
- Explain import and moved blocks
- Design a minimum CI quality pipeline
- Identify secret and state handling risks

## Classroom Safety

- Use provider-free examples until everyone understands the workflow
- Do not ask learners to paste cloud credentials into shared terminals
- Use dedicated disposable accounts for provider demonstrations
- Set budget and quota controls
- Destroy resources before ending the session
- Verify no state or plan files are committed
