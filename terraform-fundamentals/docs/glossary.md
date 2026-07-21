# Terraform Glossary

**Apply** — Execute the actions in a Terraform plan.

**Backend** — Configuration that determines where state is stored and, depending on backend type, how operations coordinate.

**Child module** — A module called by another module.

**Configuration** — Terraform files describing desired infrastructure and values.

**Data source** — A provider object read by Terraform but not lifecycle-managed as a resource.

**Dependency graph** — Graph Terraform builds to determine ordering and parallelism.

**Drift** — Difference between real infrastructure and the expected configuration/state relationship.

**HCL** — HashiCorp Configuration Language, the primary human-readable syntax used by Terraform.

**Import** — Associate an existing remote object with a Terraform resource address in state.

**Input variable** — A declared input forming part of a module interface.

**Local value** — A named expression used within a module.

**Lock file** — `.terraform.lock.hcl`, which records selected provider versions and checksums.

**Meta-argument** — Built-in Terraform argument such as `count`, `for_each`, `depends_on`, `provider`, or `lifecycle`.

**Module** — A collection of Terraform configuration files in one directory.

**Moved block** — Declarative mapping that tells Terraform a resource or module address was renamed or relocated.

**Output value** — A value exported by a module.

**Plan** — Terraform's proposed set of actions for reaching the desired state.

**Provider** — Plugin that implements resource and data-source interactions with an API or platform.

**Provisioner** — Mechanism that runs commands during resource operations. Provisioners are a last resort because Terraform cannot model their effects reliably.

**Registry** — Service that distributes providers and modules.

**Resource** — An object whose lifecycle Terraform manages.

**Resource address** — Identifier for a resource instance in configuration and state, such as `terraform_data.service["api"]`.

**Root module** — The module where Terraform is executed.

**Sensitive value** — Value marked for display redaction. Sensitivity does not imply encryption or absence from state.

**State** — Terraform's persistent mapping and metadata for managed objects.

**State locking** — Coordination that prevents concurrent state writers.

**Workspace** — A named state instance associated with the same configuration and backend in the CLI workspace model.
