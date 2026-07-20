# Session 9 — Operations, Cost, and Cloud Adoption

## Learning Objectives

- Explain observability, automation, and cloud operations
- Understand Infrastructure as Code and policy as code
- Apply basic FinOps and cost-management practices
- Structure responsible cloud adoption and migration

## Cloud Operations

Cloud removes some infrastructure work and creates new operational responsibilities:

- Identity and access lifecycle
- Account, subscription, project, or compartment management
- Policy and guardrails
- Service quotas and limits
- Resource lifecycle automation
- Cost ownership
- Provider-status and dependency monitoring
- Architecture review and exception management

## Observability

### Metrics

Numerical measurements over time, useful for trends, alerting, capacity, and service-level indicators.

### Logs

Detailed records of application, platform, security, and audit events.

### Traces

End-to-end request flow across distributed services.

### Events

Discrete changes such as resource creation, scaling, deployment, or failure.

Good observability starts with questions and service objectives, not maximum data collection.

## Infrastructure as Code

Infrastructure as Code provides repeatable, reviewable resource definitions.

Benefits:

- Version control
- Peer review
- Repeatability
- Automated environments
- Drift detection
- Standard modules
- Easier disaster recovery

Risks:

- Secrets in state or variables
- Over-privileged automation
- Unreviewed destructive changes
- Copy-pasted modules without ownership
- False confidence from syntax validation alone

## Policy as Code

Policy as code evaluates infrastructure and configuration automatically.

Policies may check:

- Approved locations
- Encryption
- Public exposure
- Required tags
- Backup configuration
- Identity rules
- Allowed service tiers

Preventive controls should be balanced with developer usability and documented exception processes.

## Platform Engineering and Landing Zones

A landing zone provides reusable organizational foundations:

- Resource hierarchy
- Identity federation
- Network architecture
- Logging and security services
- Policy guardrails
- Cost allocation
- Deployment pipelines
- Standard workload templates

Platform engineering exposes these capabilities as supported self-service products rather than manual tickets.

## FinOps Foundations

FinOps creates shared accountability between engineering, finance, and business teams.

Core practices:

- Allocate cost to owners and products
- Make cost visible quickly
- Forecast and budget
- Detect anomalies
- Optimize idle and oversized resources
- Use commitment discounts carefully
- Measure unit economics
- Include cost in architecture decisions

## Cost Drivers

- Compute duration and size
- Managed service capacity
- Storage volume, operations, and tier
- Data transfer and egress
- Logs, metrics, traces, and retention
- Backups and replicas
- Premium support
- Licenses
- Idle non-production resources

The cheapest resource is not always the lowest total-cost design.

## Migration Strategies

Common categories:

- Retire
- Retain
- Rehost
- Relocate
- Replatform
- Repurchase
- Refactor

Migration should start with business outcomes, dependencies, data, security, and operating readiness.

## Adoption Roadmap

1. Define business outcomes and constraints
2. Establish identity, governance, logging, and billing foundations
3. Build a landing zone and supported patterns
4. Select low-risk pilot workloads
5. Automate deployment and lifecycle
6. Measure security, reliability, delivery, and cost outcomes
7. Improve the platform from real workload feedback
8. Scale through reusable products and training

## Final Architecture Review

For every workload, document:

- Ownership and business criticality
- Data classification and location
- Identity and trust boundaries
- Network flows
- Availability and recovery objectives
- Deployment and rollback process
- Observability and incident response
- Backup and restore
- Cost model and budget
- Exit or migration considerations
