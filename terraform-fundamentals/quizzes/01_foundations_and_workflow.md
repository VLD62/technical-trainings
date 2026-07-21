# Quiz 1 — Foundations and Workflow

## Questions

1. What is the main difference between declarative and imperative infrastructure automation?
2. What does `terraform init` prepare?
3. What does `terraform validate` not verify?
4. Why should `terraform plan` be reviewed before apply?
5. What does a `-/+` plan symbol normally mean?
6. How does Terraform infer an implicit dependency?
7. Why should provider versions be constrained?
8. What is the purpose of `.terraform.lock.hcl`?
9. Why is `-auto-approve` risky in an interactive or production workflow?
10. Why is `terraform destroy` not the same as rollback?

## Answers

1. Declarative automation describes desired state; imperative automation describes steps.
2. Providers, modules, backend configuration, and dependency selections.
3. It does not prove remote credentials, API access, quotas, or apply success.
4. A plan exposes proposed creates, updates, replacements, and destroys before execution.
5. Destroy and recreate the object.
6. Through one object's expression referencing another object's attributes.
7. To make dependency upgrades deliberate and reproducible.
8. It records selected provider versions and checksums.
9. It removes an important human confirmation and can apply an unexpected plan.
10. Destroy removes managed objects; it does not restore prior data or configuration automatically.
