# Session 8 — OCI, Private Cloud, Hybrid Cloud, and Multi-Cloud

## Learning Objectives

- Recognize OCI resource and service concepts
- Compare public cloud with private cloud and OpenStack
- Understand hybrid connectivity and identity integration
- Evaluate real multi-cloud benefits and costs

## OCI Resource Model

- A tenancy is the top-level OCI account boundary
- Compartments organize and isolate resources
- Policies grant permissions to groups and workload identities
- Regions contain availability domains where available
- Fault domains provide additional placement isolation
- Most services and resources have explicit regional scope

## OCI Identity

- Users and groups support human access
- Policies use readable statements to grant permissions
- Dynamic groups identify compute resources
- Instance principals allow compute workloads to call OCI APIs
- Federation integrates external identity providers
- Compartments provide policy and organizational boundaries

## OCI Networking

- Virtual Cloud Network provides isolated networking
- Subnets can be regional and public or private
- Route tables control traffic
- Security Lists and Network Security Groups filter traffic
- Internet Gateway, NAT Gateway, Service Gateway, and Dynamic Routing Gateway support connectivity
- Load Balancer and Network Load Balancer distribute traffic
- FastConnect provides dedicated connectivity

## OCI Core Services

| Category | Representative services |
|---|---|
| Compute | Compute instances, autoscaling, OCI Functions |
| Containers | Oracle Kubernetes Engine, Container Instances, Container Registry |
| Storage | Object Storage, Block Volumes, File Storage, Archive Storage |
| Databases | Base Database Service, Autonomous Database, MySQL HeatWave, NoSQL Database |
| Integration | Queue, Streaming, Events, Notifications |
| Observability | Monitoring, Logging, Audit, Application Performance Monitoring |
| Security | Vault, Cloud Guard, Security Zones, Web Application Firewall |
| Infrastructure as Code | Resource Manager with Terraform, OCI DevOps integrations |

## Private Cloud

A private cloud provides cloud-like self-service, APIs, automation, pooled infrastructure, and governance for one organization.

OpenStack is a common open-source private-cloud platform with services for compute, networking, identity, images, and storage.

Private cloud advantages may include control, data locality, integration, and predictable internal capacity. Trade-offs include lifecycle ownership, staffing, hardware procurement, upgrades, and capacity risk.

## Hybrid Cloud

Hybrid cloud commonly requires integration across:

- Identity and federation
- DNS and IP address management
- VPN or dedicated connectivity
- Routing and firewall policy
- Data replication and transfer
- Monitoring and incident management
- Configuration and policy tooling
- Service ownership and support boundaries

Connectivity does not by itself create a successful hybrid operating model.

## Multi-Cloud

Valid multi-cloud drivers can include:

- Regulatory or contractual requirements
- Acquisitions and existing business platforms
- Provider-specific capabilities
- Geographic availability
- Negotiation and concentration-risk management
- Customer-facing product requirements

Weak drivers include vague fear of lock-in without workload-level analysis.

## Multi-Cloud Costs

- Duplicated skills and tooling
- Different identity and policy models
- More complex networking and data transfer
- Multiple support and incident processes
- Reduced use of differentiated managed services
- Harder cost allocation and architecture standards
- Inconsistent feature behavior

## Portability Spectrum

1. Portable documentation and data formats
2. Portable application code
3. Portable containers
4. Portable orchestration layer
5. Portable infrastructure definitions
6. Portable operations and security controls
7. Fully portable architecture

Full portability is expensive and often unrealistic. Decide where portability creates business value.

## Decision Principle

Use multiple clouds deliberately, workload by workload. Standardize organizational controls and interfaces where useful, but allow provider-native services when their value exceeds the migration or dependency risk.
