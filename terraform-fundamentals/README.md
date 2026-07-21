# Terraform: Fundamentals

Welcome to the **Terraform: Fundamentals** course.

This reusable, vendor-neutral training introduces Infrastructure as Code and the core Terraform workflow through practical, low-risk exercises. The main labs use Terraform's built-in `terraform_data` resource so learners can practice configuration, state, planning, modules, lifecycle rules, refactoring, and tests without requiring a cloud account.

> This is an independent educational resource. It is not an official HashiCorp course and is not endorsed by HashiCorp.

---

## Course Objectives

By the end of this course participants will be able to:

- Explain Infrastructure as Code and Terraform's role in infrastructure lifecycle management
- Install and use the Terraform CLI
- Read and write Terraform configuration using HCL
- Understand providers, resources, data sources, and the dependency graph
- Use variables, local values, outputs, expressions, collections, and functions
- Follow the `init`, `fmt`, `validate`, `plan`, `apply`, and `destroy` workflow
- Explain Terraform state, state locking, backends, and remote-state collaboration
- Build and consume reusable Terraform modules
- Use `count`, `for_each`, conditional expressions, and dynamic values appropriately
- Apply lifecycle rules, explicit dependencies, preconditions, and postconditions
- Import existing objects and refactor resource addresses safely
- Validate modules with `terraform test` and automated quality checks
- Handle credentials, secrets, plans, and state files safely
- Design a basic CI/CD workflow for Terraform changes
- Troubleshoot common initialization, planning, state, and provider issues

---

## Course Structure

| Session | Topic | Practical focus |
|---:|---|---|
| 0 | Course introduction and lab setup | Install and verify the CLI |
| 1 | Infrastructure as Code and Terraform architecture | Understand desired state and the dependency graph |
| 2 | HCL, providers, resources, and data sources | Read and write configuration blocks |
| 3 | Core Terraform workflow | Initialize, format, validate, plan, apply, and destroy |
| 4 | Variables, locals, outputs, collections, and expressions | Parameterize and repeat configuration |
| 5 | State, backends, locking, and workspaces | Inspect state and discuss team collaboration |
| 6 | Modules and reusable design | Create and call a local child module |
| 7 | Lifecycle, import, and safe refactoring | Control replacement and move addresses |
| 8 | Testing, security, automation, and troubleshooting | Run tests and design a CI pipeline |

---

## Repository Structure

```text
terraform-fundamentals/
├── README.md
├── MANIFEST.md
├── LICENSE.md
├── Makefile
├── .gitignore
├── slides/
│   ├── 00_course_introduction.md
│   ├── 01_iac_and_terraform_foundations.md
│   ├── 02_hcl_providers_resources_and_data.md
│   ├── 03_core_workflow.md
│   ├── 04_variables_expressions_and_outputs.md
│   ├── 05_state_backends_and_workspaces.md
│   ├── 06_modules_and_reuse.md
│   ├── 07_lifecycle_import_and_refactoring.md
│   └── 08_testing_security_automation_and_troubleshooting.md
├── docs/
│   ├── lab_setup.md
│   ├── cli_cheat_sheet.md
│   ├── hcl_cheat_sheet.md
│   ├── state_and_backends.md
│   ├── modules_best_practices.md
│   ├── testing_and_validation.md
│   ├── security_and_secrets.md
│   ├── ci_cd_workflow.md
│   ├── troubleshooting.md
│   ├── glossary.md
│   ├── useful_links.md
│   ├── instructor_guide.md
│   └── repository_integration.md
├── labs/
│   ├── README.md
│   ├── 01_first_configuration.md
│   ├── 02_variables_collections_and_outputs.md
│   ├── 03_build_and_use_a_module.md
│   ├── 04_state_and_workspaces.md
│   ├── 05_lifecycle_import_and_refactoring.md
│   └── 06_tests_security_and_ci.md
├── examples/
│   ├── 01-local-basics/
│   ├── 02-variables-and-collections/
│   ├── 03-local-module/
│   ├── 04-lifecycle-and-conditions/
│   ├── 05-refactoring/
│   ├── 06-tests/
│   └── 07-docker-optional/
├── scripts/
│   ├── validate_environment.sh
│   └── validate_content.py
└── quizzes/
    ├── 01_foundations_and_workflow.md
    ├── 02_state_modules_and_lifecycle.md
    └── 03_final_review.md
```

---

## Prerequisites

Recommended knowledge:

- Basic command-line usage
- Familiarity with files, directories, environment variables, and Git
- General understanding of infrastructure concepts such as servers, networks, storage, and cloud resources
- A text editor or IDE

No cloud subscription is required for the core course.

---

## Recommended Lab Environment

- Linux, macOS, or Windows with WSL
- Terraform CLI **1.6 or newer** for the included native test examples
- Git
- A code editor with Terraform/HCL support
- Optional: Docker Engine or Podman for the Docker provider example

The examples intentionally avoid credentials and paid cloud resources unless explicitly marked as optional.

See [`docs/lab_setup.md`](docs/lab_setup.md) for installation and setup instructions.

---

## Getting Started

Clone the repository and enter the module:

```bash
git clone https://github.com/VLD62/technical-trainings.git
cd technical-trainings/terraform-fundamentals
```

List the available materials:

```bash
make list
```

Check the local environment:

```bash
make check-environment
```

Validate the Markdown structure and local links:

```bash
make content-check
```

Run the first provider-free example:

```bash
make demo-init
make demo-plan
make demo-apply
make demo-output
make demo-destroy
```

Format and validate all compatible examples:

```bash
make fmt-check
make validate
```

Run native Terraform tests:

```bash
make test
```

---

## Recommended Learning Approach

For each session:

1. Review the corresponding slide deck
2. Read the related reference document
3. Inspect the example before running commands
4. Predict the proposed change before running `terraform plan`
5. Apply only in a disposable lab directory
6. Inspect outputs and state after every apply
7. Destroy disposable resources when the lab is complete
8. Complete the associated quiz questions

The course can be delivered as:

- A compact one-day fundamentals workshop
- Two half-day practical sessions
- A multi-day onboarding course for DevOps, platform, cloud, or infrastructure engineers
- A self-study module with guided labs and quizzes

---

## Safety Notes

- Never commit `terraform.tfstate`, state backups, plan files, `.terraform/`, credentials, tokens, private keys, or real secret values.
- Treat state as sensitive because it can contain resource attributes and secret material.
- Review every plan before applying it.
- Avoid `-auto-approve` in interactive learning and production workflows unless strong controls exist.
- Use remote state with locking and access control for team environments.
- Pin Terraform and provider versions deliberately and commit `.terraform.lock.hcl` for root configurations.
- Use short-lived credentials and workload identity where available.
- Do not use production subscriptions, accounts, projects, clusters, or state backends for training.
- Understand the effect of `destroy`, `state rm`, `import`, `moved`, and `-replace` before using them.
- Never edit a state file manually unless following a controlled recovery procedure with backups.

---

## License

Educational content, including presentations, documentation, exercises, and quizzes, is licensed under the **Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License**.

Source code, scripts, and executable examples are licensed separately under the **MIT License**.

Terraform, HashiCorp, HCP Terraform, and related names are trademarks of HashiCorp, Inc. Third-party names, trademarks, documentation, and project materials remain subject to their respective owners and licenses.

## Author

**Vladislav Iliev**

[LinkedIn](https://www.linkedin.com/in/vld62/)
