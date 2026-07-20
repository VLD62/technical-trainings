# Session 3 — Identity, Security, Compliance, and Governance

## Learning Objectives

- Apply the shared responsibility model
- Explain authentication, authorization, federation, and least privilege
- Identify baseline cloud security controls
- Understand governance through hierarchy, policy, logging, and metadata

## Shared Responsibility

The provider secures the underlying cloud platform. The customer secures workloads, identities, configuration, and data according to the selected service model.

Customer responsibility generally decreases from IaaS to PaaS to SaaS, but it never becomes zero.

## Identity Concepts

- **Human identity:** employee, contractor, administrator, developer
- **Workload identity:** application, VM, container, function, automation
- **Authentication:** proving identity
- **Authorization:** deciding permitted actions
- **Federation:** using an external identity provider
- **Role:** collection of permissions
- **Policy:** rule describing allowed or denied actions
- **Service account / managed identity / instance principal:** non-human identity for workloads

## Least Privilege

Grant only the actions, resources, and conditions required for the task, for only the required duration.

Practical controls:

- Central identity federation
- Multi-factor authentication
- Separate administrative roles
- Just-in-time privileged access
- Short-lived credentials
- Workload identities instead of embedded keys
- Periodic access review
- Explicit separation of duties

## Credential Safety

Avoid:

- Long-lived access keys
- Shared administrator accounts
- Secrets in source control
- Credentials in VM images or container images
- Personal credentials in automation
- Unrestricted service principals

Prefer provider-native workload identity, secret managers, and automated rotation.

## Data Protection

Protect data:

- At rest
- In transit
- In use where relevant
- In backups and replicas
- In logs and diagnostic exports

Key-management choices include provider-managed keys, customer-managed keys, imported keys, and external key management. More control also creates more operational responsibility.

## Network Security

- Default-deny where practical
- Private connectivity for internal services
- Segmented virtual networks and subnets
- Security groups or firewall rules close to workloads
- Controlled egress
- Web application firewall for public HTTP services
- DDoS protection according to exposure
- Central DNS and certificate management

A private IP address alone does not make a system secure.

## Logging and Detection

Collect and protect:

- Administrative audit logs
- Authentication and authorization events
- Network flow logs
- Application logs
- Security findings
- Configuration changes
- Key and secret usage

Send security logs to a protected destination with controlled retention and alerting.

## Governance Hierarchy

Providers offer resource hierarchies for policy and access inheritance.

Examples:

- AWS Organizations, organizational units, accounts
- Azure tenant, management groups, subscriptions, resource groups
- Google Cloud organization, folders, projects
- OCI tenancy and compartments

Good hierarchy supports ownership, isolation, policy, billing, and lifecycle management.

## Policy and Guardrails

Guardrails can enforce or detect:

- Approved regions
- Mandatory tags or labels
- Encryption requirements
- Public access restrictions
- Allowed instance types
- Network configuration
- Logging requirements
- Retention rules

Prefer automated preventive and detective controls over manual review alone.

## Compliance

Provider certification does not make every customer workload compliant.

The customer must map:

- Applicable requirements
- Provider service scope
- Data flows
- Identity and access controls
- Evidence collection
- Configuration responsibilities
- Operational procedures

## Baseline Security Checklist

1. Federated identity and MFA
2. Separate production and non-production boundaries
3. Least-privilege roles
4. Central audit logging
5. Encryption and key ownership decisions
6. Network segmentation and controlled public exposure
7. Patch and vulnerability management according to service model
8. Backup and restore testing
9. Secret management
10. Incident-response ownership
