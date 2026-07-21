# State, Backends, Locking, and Workspaces

## Learning Outcomes

- Explain why Terraform uses state
- Understand local and remote backends
- Recognize state security and collaboration requirements

---

## Why State Exists

Terraform state maps resource addresses in configuration to real remote objects.

State also stores:

- Resource attributes
- Dependency information
- Provider metadata
- Output values
- Serial and lineage metadata

State is operationally critical and often sensitive.

---

## Local State

By default, state is stored locally:

```text
terraform.tfstate
terraform.tfstate.backup
```

Local state is acceptable for isolated disposable labs, but not for most team or production workflows.

---

## Remote Backends

A remote backend can provide:

- Shared state storage
- Access control
- Encryption
- Versioning
- State locking or operation coordination
- Recovery capabilities

Backend features vary. Verify locking, consistency, authentication, and recovery behavior before production use.

---

## State Locking

Locking prevents concurrent writers from corrupting or overwriting state.

A safe team workflow ensures:

- Only one apply writes a state at a time
- Locks are not bypassed casually
- Force-unlock is used only after confirming no operation is active
- Automation serializes applies per state boundary

---

## State Boundaries

Do not place every environment and service in one state.

Choose boundaries based on:

- Ownership
- Lifecycle
- Blast radius
- Access control
- Change frequency
- Dependency direction
- Recovery requirements

Prefer explicit interfaces over deep cross-state coupling.

---

## Drift

Drift occurs when real infrastructure differs from configuration and state expectations.

Possible causes:

- Manual changes
- External controllers
- Provider defaults
- Changed APIs
- Expired or rotated objects
- Partial failures

Use plans, refresh-aware checks, and policy to detect drift. Decide whether configuration or infrastructure is authoritative before correcting it.

---

## CLI Workspaces

CLI workspaces provide multiple state instances for the same configuration and backend.

```bash
terraform workspace list
terraform workspace new development
terraform workspace select development
terraform workspace show
```

They can be useful for similar ephemeral environments, but they are not a complete isolation or access-control mechanism.

Separate directories, repositories, backends, or accounts may be safer for environments with different permissions or blast radii.

---

## State Operations

Useful commands:

```bash
terraform state list
terraform state show ADDRESS
terraform state mv SOURCE DESTINATION
terraform state rm ADDRESS
terraform import ADDRESS ID
```

Back up state and understand the impact before changing addresses or bindings.
