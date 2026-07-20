# Session 1 — Cloud Concepts and Service Models

## Learning Objectives

- Define cloud computing through operational characteristics
- Compare deployment and service models
- Explain elasticity, scalability, automation, and measured consumption
- Recognize when cloud is not automatically the best option

## Core Characteristics

A cloud platform typically provides:

- On-demand self-service
- Broad network access
- Resource pooling and multi-tenancy
- Rapid elasticity
- Measured usage
- API-driven automation
- Standardized service catalogs

Cloud is an operating and delivery model, not simply somebody else's server.

## Scalability and Elasticity

**Scalability** is the ability to handle greater demand by adding capacity.

- Vertical scaling: larger instance or more resources per node
- Horizontal scaling: more nodes or service instances

**Elasticity** is dynamic capacity adjustment in response to demand.

A scalable system is not automatically elastic. An elastic platform still requires application design that can safely add and remove capacity.

## Deployment Models

| Model | Description | Typical considerations |
|---|---|---|
| Public cloud | Shared provider platform delivered as services | Speed, breadth, global reach, governance, variable cost |
| Private cloud | Cloud operating model dedicated to one organization | Control, internal operations, capacity planning |
| Hybrid cloud | Integrated private/on-premises and public cloud environments | Identity, networking, data movement, operating consistency |
| Multi-cloud | Deliberate use of more than one cloud provider | Capability choice, resilience goals, skills, complexity |
| Edge cloud | Compute and data processing near users or devices | Latency, disconnected operation, fleet management |
| Sovereign cloud | Environment designed for jurisdictional or control requirements | Residency, operator access, legal constraints |

## Service Models

### Infrastructure as a Service — IaaS

The provider manages facilities, hardware, and virtualization. The customer usually manages the guest OS, middleware, application, identities, configuration, and data.

### Platform as a Service — PaaS

The provider additionally manages more runtime and platform components. The customer focuses on application code, configuration, access, and data.

### Software as a Service — SaaS

A complete application is delivered as a service. The customer still manages users, access, data handling, configuration, and integration.

### Containers as a Service — CaaS

A managed container orchestration platform provides cluster or platform capabilities. Responsibility boundaries differ by service and configuration.

### Function as a Service — FaaS / Serverless

The customer deploys event-driven code or containerized functions while the provider manages underlying capacity. Serverless does not mean servers do not exist or that operations disappear.

### Database as a Service — DBaaS

The provider manages substantial database infrastructure and maintenance. The customer remains responsible for schemas, access, queries, data lifecycle, and workload-specific recovery requirements.

## Cloud-Native vs Cloud-Hosted

- **Cloud-hosted:** existing architecture moved to provider infrastructure
- **Cloud-enabled:** selected managed services and automation added
- **Cloud-native:** architecture intentionally uses elasticity, automation, managed services, and failure-aware design

None is always correct. Migration goals, constraints, and operating maturity matter.

## Benefits and Trade-offs

Potential benefits:

- Faster provisioning
- Global infrastructure access
- Managed service leverage
- Elastic capacity
- Automation and standardization
- Experimentation without large upfront procurement

Potential trade-offs:

- Cost variability
- Provider dependency
- New security and governance skills
- Service limits and regional differences
- Data transfer cost and latency
- Distributed-system complexity
- Reduced low-level control

## Key Principle

Cloud value comes from changing how systems are designed and operated. Recreating a traditional datacenter exactly inside a cloud account often preserves cost and complexity without capturing the main benefits.
