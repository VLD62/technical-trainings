# Session 7 — Google Cloud Fundamentals

## Learning Objectives

- Understand Google Cloud resource hierarchy and projects
- Recognize core Google Cloud services
- Explain global VPC networking and location choices
- Apply project, IAM, logging, and billing concepts

## Resource Hierarchy

- Organization is the top enterprise resource
- Folders group projects and can represent departments or environments
- Projects are core resource, API, IAM, and billing units
- Resources belong to projects
- Policies can inherit down the hierarchy
- Billing accounts are linked to projects

A well-designed hierarchy supports ownership, policy, isolation, and cost reporting.

## Global Infrastructure

- Region: geographic location
- Zone: deployment area inside a region
- Some services are zonal, regional, multi-regional, or global
- Location choice affects availability, latency, residency, and service support

## Identity

- Cloud IAM grants roles to principals on resources
- Principals include users, groups, service accounts, and federated identities
- Predefined roles are preferred over basic broad roles
- Service accounts represent workloads
- Workload Identity Federation can reduce service-account key usage
- Organization Policy provides governance constraints

## Networking

- Google Cloud VPC networks are global resources with regional subnets
- Firewall rules apply to traffic based on network criteria and identities/tags
- Cloud Load Balancing includes regional and global options
- Cloud DNS provides managed DNS
- Cloud NAT provides outbound internet access without external VM addresses
- Private Google Access and Private Service Connect support private service access patterns
- Cloud VPN and Cloud Interconnect connect external networks

## Core Services

| Category | Representative services |
|---|---|
| Compute | Compute Engine, managed instance groups, Cloud Run, Cloud Run functions, App Engine |
| Containers | Google Kubernetes Engine, Artifact Registry |
| Storage | Cloud Storage, Persistent Disk, Filestore, archive storage classes |
| Databases | Cloud SQL, AlloyDB, Spanner, Firestore, Bigtable, Memorystore, BigQuery |
| Integration | Pub/Sub, Eventarc, Dataflow |
| Observability | Cloud Monitoring, Cloud Logging, Cloud Trace, Error Reporting, Cloud Audit Logs |
| Security | Cloud KMS, Secret Manager, Security Command Center, Cloud Armor |
| Infrastructure as Code | Terraform, Infrastructure Manager, Config Connector |

## Project and API Model

Many Google Cloud services require an API to be enabled in a project. Projects also scope quotas, service accounts, billing linkage, and much of day-to-day administration.

Project design should avoid both extremes:

- One project containing unrelated environments and teams
- Excessive project fragmentation without automation or ownership

## Cost Concepts

- Consumption pricing by service
- Sustained-use and committed-use discounts where applicable
- Spot VMs
- Storage classes and lifecycle policies
- Network egress
- Budgets and alerts
- Billing export to BigQuery
- Labels and tags for allocation and governance

## Common Architecture Pattern

- Cloud DNS and global external Application Load Balancer
- Managed instance group, GKE, or Cloud Run for stateless application services
- Cloud SQL or AlloyDB for relational data
- Cloud Storage for objects
- Pub/Sub for asynchronous processing
- Cloud Monitoring, Cloud Logging, and Cloud Audit Logs

## Google Cloud Review Questions

- Does the folder and project hierarchy match ownership?
- Are basic roles avoided?
- Are service-account keys eliminated where possible?
- Is the global VPC model understood?
- Are audit logs, budgets, and billing exports configured?
- Is the selected database consistent with transaction and scale requirements?
