# Lab 03 — Identity and Least Privilege

## Objective

Create a provider-neutral identity and access model for ShopNow.

## Personas and Workloads

- Platform administrators
- Application developers
- Security auditors
- Finance analysts
- CI/CD deployment automation
- Web application runtime
- Background order processor
- Database administration team

## Tasks

1. Separate human and workload identities.
2. Define roles for each persona.
3. Identify which roles require production access.
4. Define privileged access duration and approval.
5. Replace static credentials with workload identities.
6. Identify secrets that still require a secret manager.
7. Define audit events and alerts.
8. Define a break-glass procedure.

## Constraints

- Developers may deploy to development without approval.
- Production deployment occurs only through CI/CD.
- Finance can read cost data but not application data.
- Security can read audit logs but cannot modify workloads.
- Application services may access only their required data stores.
- Database administrators must not administer cloud identity.

## Deliverable

Create an access matrix with columns:

- Identity
- Type: human or workload
- Environment
- Allowed actions
- Denied or excluded actions
- Credential method
- Review frequency

## Reflection

Explain how the model would map to roles or policies in two different cloud providers.
