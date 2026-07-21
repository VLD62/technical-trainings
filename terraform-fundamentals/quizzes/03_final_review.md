# Final Review

## Multiple Choice

1. Which command formats Terraform files without applying infrastructure?
   - A. `terraform init`
   - B. `terraform fmt`
   - C. `terraform apply`
   - D. `terraform import`

2. Which file should normally be committed for a root module?
   - A. `terraform.tfstate`
   - B. A binary plan
   - C. `.terraform.lock.hcl`
   - D. A credential file

3. Which construct provides stable keyed resource instances?
   - A. `for_each`
   - B. `depends_on`
   - C. `provider`
   - D. `backend`

4. Which statement about `sensitive = true` is correct?
   - A. It encrypts the value in state
   - B. It prevents the provider receiving the value
   - C. It redacts normal CLI display but does not guarantee state exclusion
   - D. It removes the value after apply

5. What is the safest response to an unexpected resource replacement in a plan?
   - A. Apply immediately
   - B. Add `ignore_changes` to every attribute
   - C. Investigate the changed attribute, address, state, and provider behavior
   - D. Delete the state file

6. Which command is intended to associate an existing object with a resource address?
   - A. `terraform output`
   - B. `terraform import`
   - C. `terraform graph`
   - D. `terraform fmt`

7. What should protect team applies to the same state?
   - A. Concurrent jobs
   - B. State locking and CI serialization
   - C. Local state copied by email
   - D. Different file names only

8. Which is the best default location for provider authentication logic?
   - A. Hard-coded in child module variables
   - B. Root module and execution environment
   - C. Committed `.tfvars`
   - D. Output values

9. What does `terraform validate` primarily check?
   - A. Remote service health
   - B. Billing limits
   - C. Syntax and internal configuration consistency
   - D. Production approval

10. Why use a saved plan in an apply stage?
    - A. To avoid state
    - B. To apply the reviewed proposal from the intended configuration
    - C. To store credentials permanently
    - D. To disable providers

## Scenario Questions

11. A developer renames `aws_instance.web` to `aws_instance.application`. The plan proposes destroy/create, but the remote object should remain. What Terraform construct should be considered?

12. A CI job fails because a state lock exists. What should be checked before force-unlocking?

13. A module accepts an untyped map with 30 optional keys and 15 boolean feature flags. What design improvement would you suggest?

14. A team stores production and development in CLI workspaces using the same credentials and broad backend access. What risks remain?

15. A plan file is uploaded to a public CI artifact. Why is this a security concern?

## Answer Key

1. B
2. C
3. A
4. C
5. C
6. B
7. B
8. B
9. C
10. B
11. A `moved` block mapping the old address to the new address.
12. Confirm whether another operation is genuinely active, identify the lock owner and operation, and preserve state/log context.
13. Split responsibilities, use typed objects, reduce flags, and compose smaller focused modules.
14. Workspaces do not provide account-level isolation, separate authorization, or reduced blast radius by themselves.
15. Saved plans may contain sensitive values and detailed infrastructure information.
