# Lab 02 - Projects, Roles, and Quotas

## Goal

Understand the current project scope and available resource limits.

## 1. Inspect the Project

```bash
openstack --os-cloud training project show <project-name-or-id>
```

Project listing may be restricted by policy.

## 2. Inspect Role Assignments

With sufficient permission:

```bash
openstack --os-cloud training role assignment list \
  --project <project-name-or-id> \
  --names
```

If denied, document that role-assignment inspection is an administrative capability.

## 3. Inspect Quotas

```bash
openstack --os-cloud training quota show
openstack --os-cloud training limits show --absolute
```

Record:

- Instance limit
- vCPU limit
- RAM limit
- Volume and storage limit
- Network, router, port, security-group, and floating-IP limits

## 4. Capacity Calculation

Assume the lab instance uses:

```text
2 vCPU
2 GiB RAM
20 GiB root disk
1 floating IP
1 volume of 5 GiB
```

Calculate how many such instances fit within the project quota. Identify which quota becomes the first constraint.

## 5. Discussion

- How do quotas differ from physical capacity?
- Why might a project be under quota but unable to schedule an instance?
- Which quotas protect network infrastructure?

## Cleanup

No resources are created.
