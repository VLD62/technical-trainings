# Infrastructure as Code and Terraform Foundations

## Learning Outcomes

- Explain Infrastructure as Code
- Describe Terraform's declarative model
- Understand configuration, providers, state, and the dependency graph

---

## Infrastructure as Code

Infrastructure as Code means defining infrastructure in machine-readable, reviewable, version-controlled files rather than relying only on manual actions.

Typical benefits:

- Repeatability
- Reviewability
- Auditability
- Automation
- Faster recovery
- Reduced configuration drift
- Reusable patterns

IaC does not automatically guarantee good architecture, security, or reliability. Poorly designed automation can reproduce mistakes quickly.

---

## Declarative vs Imperative

Declarative configuration describes the desired end state:

```hcl
resource "terraform_data" "service" {
  input = {
    name  = "payments"
    tier  = "backend"
    owner = "platform"
  }
}
```

Terraform determines the actions required to move from the current state to the desired state.

Imperative automation describes a sequence of steps. Both models are useful, but Terraform is primarily declarative.

---

## Terraform Core Components

- **Configuration** — `.tf` files written in HCL
- **Terraform CLI** — evaluates configuration and executes the workflow
- **Providers** — plugins that translate resource operations to remote APIs
- **State** — Terraform's record mapping configuration addresses to real objects
- **Backend** — where state is stored and how operations coordinate
- **Dependency graph** — ordering model derived from references and explicit dependencies

---

## The Desired-State Loop

1. Read configuration
2. Load state
3. Refresh or query relevant remote information
4. Build dependency graph
5. Calculate proposed changes
6. Present a plan
7. Apply approved changes
8. Update state

---

## Idempotence

Applying the same unchanged configuration repeatedly should normally result in no further changes.

A no-op plan is an important operational signal:

```text
No changes. Your infrastructure matches the configuration.
```

Unexpected changes may indicate drift, unstable inputs, provider behavior, or configuration mistakes.

---

## Terraform Is Not

- A general-purpose configuration management system
- A replacement for all scripting
- A secret-management system
- A database migration framework
- A guarantee that infrastructure is secure
- Safe without review, state protection, and access controls

---

## Discussion

- Which manual infrastructure actions in your environment are repeated?
- Which resources need a reliable audit trail?
- Where could declarative management reduce drift?
- Which systems should not be managed by the same state boundary?
