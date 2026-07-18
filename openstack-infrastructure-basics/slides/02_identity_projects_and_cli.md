# Identity, Projects, and the OpenStack CLI

## Session 2

---

## Keystone Responsibilities

Keystone provides:

- Authentication
- Token issuance
- Service catalog
- Endpoint discovery
- Domains and projects
- Users, groups, and roles
- Federation and external identity integration

Authorization decisions are enforced by service policies using identity information.

---

## Authentication vs Authorization

**Authentication** answers:

> Who are you?

**Authorization** answers:

> What may you do in this project and service?

A valid token does not imply permission for every API operation.

---

## Resource Organization

```text
Domain
  |
  +-- Project A
  |     +-- Users and groups receive roles
  |
  +-- Project B
        +-- Separate resources and quotas
```

Domains can separate identity namespaces and administrative responsibility.

---

## Roles

Typical role ideas:

- Reader
- Member
- Manager or project administrator
- System administrator
- Service user

Exact role names and policy behavior depend on cloud policy and OpenStack version.

---

## Service Catalog

The catalog tells clients where services are available.

An endpoint has:

- Service type
- Region
- Interface: public, internal, or admin
- URL

The CLI uses the catalog to discover APIs after authentication.

---

## `clouds.yaml`

`clouds.yaml` stores connection settings for one or more clouds.

Common locations:

- Current directory
- `~/.config/openstack/clouds.yaml`
- `/etc/openstack/clouds.yaml`

Use:

```bash
openstack --os-cloud training token issue
```

---

## Credential Safety

- Never commit a real `clouds.yaml`
- Restrict file permissions
- Prefer application credentials or federated authentication
- Avoid long-lived administrator passwords
- Rotate exposed credentials immediately
- Keep private keys separate from cloud configuration

---

## OpenRC Files

An OpenRC file exports environment variables such as:

- `OS_AUTH_URL`
- `OS_USERNAME`
- `OS_PROJECT_NAME`
- `OS_REGION_NAME`
- `OS_INTERFACE`

OpenRC is convenient but easier to leak through shell history, process environments, and copied terminal output.

---

## CLI Discovery

```bash
openstack help
openstack command list
openstack catalog list
openstack endpoint list
openstack extension list --network
openstack configuration show
```

Use `--help` on each command because capabilities and options vary by service and API version.

---

## Identity Inspection

```bash
openstack token issue
openstack project show <project>
openstack role assignment list --names --project <project>
openstack quota show
openstack limits show --absolute
```

Run administrative identity commands only with authorized roles.

---

## Application Credentials

Application credentials can reduce exposure of a user's primary password.

Good practices:

- Limit roles
- Set expiration
- Use a dedicated purpose
- Store secrets in a secret manager
- Revoke when no longer needed

---

## Policy

Each service evaluates policy rules.

Policy can consider:

- Role
- Project ownership
- System scope
- Resource ownership
- Request attributes

Do not assume the same role grants identical permissions across all clouds.
