# Terraform CI/CD Workflow

## Goals

A Terraform delivery pipeline should make changes:

- Reproducible
- Reviewable
- Authorized
- Serialized per state
- Traceable to a commit
- Recoverable

## Pull-Request Checks

Recommended baseline:

```text
terraform fmt -check -recursive
terraform init -backend=false
terraform validate
terraform test
lint
security scan
```

For environment plans, initialize the intended backend with read or plan permissions and create a plan for review.

## Plan Stage

The plan stage should record:

- Commit SHA
- Terraform version
- Provider lock-file changes
- Module versions
- Backend and workspace identity
- Variable source
- Plan summary
- Policy results

Protect binary plans as sensitive artifacts.

## Review Stage

Require review for:

- Deletes and replacements
- Identity and access changes
- Public network exposure
- State or backend changes
- Provider/module upgrades
- Data retention changes
- Large or unexpected resource counts

## Apply Stage

A protected apply should:

- Run from the reviewed commit
- Use an authorized identity
- Serialize operations per state boundary
- Apply the reviewed saved plan when feasible
- Record logs and outcome
- Avoid interactive prompts
- Perform post-apply verification

## Concurrency

Only one writer should modify a state at a time.

Use:

- Backend locking
- CI concurrency groups or deployment queues
- Environment protection rules
- Change windows for sensitive systems

## Branching and Environments

Do not assume branches alone provide environment isolation. Environment isolation also requires:

- Separate credentials or roles
- Correct backend/state boundaries
- Protected variables
- Access controls
- Explicit promotion logic

## Example Generic Pipeline

```yaml
steps:
  - checkout
  - install pinned Terraform version
  - terraform fmt -check -recursive
  - terraform init -backend=false
  - terraform validate
  - terraform test
  - run lint and security scans
  - create environment plan
  - publish protected plan summary
  - require approval
  - apply from reviewed commit
  - verify outputs and health
```

Adapt syntax to the selected CI platform.

## Failure Handling

When apply fails:

1. Preserve logs and lock information
2. Do not immediately rerun blindly
3. Check whether some remote changes completed
4. Inspect state and the provider system
5. Run a fresh plan
6. Decide whether to continue, import, repair, or restore
7. Document the incident and preventive action

## Drift Detection

Scheduled plans can detect drift, but avoid automatically applying every detected difference. Classify drift first:

- Unauthorized manual change
- Expected external-controller change
- Provider/API default change
- Expired object
- Configuration bug

Then choose the authoritative correction path.
