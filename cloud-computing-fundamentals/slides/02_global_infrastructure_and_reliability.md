# Session 2 — Global Infrastructure and Reliability

## Learning Objectives

- Explain regions, zones, domains, edge locations, and fault domains
- Distinguish high availability, backup, and disaster recovery
- Use RTO and RPO to guide design choices
- Identify single points of failure

## Geographic Building Blocks

Cloud providers use different names for related concepts:

- **Region:** geographic area containing provider infrastructure
- **Availability Zone / Availability Domain:** isolated location inside a region
- **Fault Domain:** smaller failure-isolation boundary
- **Edge location / Point of Presence:** network location closer to users
- **Local or metro zone:** provider infrastructure closer to a specific city or workload

Names and guarantees differ. Do not assume every region contains the same number of zones or every service supports every region.

## Failure Domains

Design should consider failure at multiple scopes:

1. Process or container
2. Virtual machine or host
3. Rack or fault domain
4. Availability zone/domain
5. Region
6. Provider service or control plane
7. Identity, DNS, network, or dependency
8. Human or automation error

## High Availability

High availability reduces interruption from expected failures.

Common patterns:

- Multiple stateless application instances
- Load balancing and health checks
- Multi-zone placement
- Redundant network paths
- Managed database replication
- Automated replacement of unhealthy instances
- Graceful degradation

High availability is not the same as disaster recovery.

## Backup

A backup protects recoverable data copies from deletion, corruption, or operational failure.

A useful backup plan defines:

- What is backed up
- Frequency
- Retention
- Encryption
- Isolation from the production identity boundary
- Restoration ownership
- Regular restore testing

Replication is not a substitute for backup because corruption or deletion can replicate.

## Disaster Recovery

Disaster recovery restores service after a significant outage.

### Recovery Time Objective — RTO

Maximum acceptable time to restore a service.

### Recovery Point Objective — RPO

Maximum acceptable data loss measured in time.

### Common Strategies

| Strategy | Cost | Recovery speed | Typical use |
|---|---:|---:|---|
| Backup and restore | Low | Slow | Non-critical workloads |
| Pilot light | Low-medium | Medium | Core services kept minimal |
| Warm standby | Medium-high | Fast | Reduced-capacity secondary environment |
| Active-active | High | Very fast | Critical systems with complex consistency design |

## Data Residency and Sovereignty

Location selection affects:

- Legal and contractual obligations
- Latency
- Service availability
- Disaster-recovery options
- Data transfer cost
- Encryption-key location
- Support and operator-access expectations

Residency does not automatically solve every sovereignty or compliance requirement.

## Reliability Design Questions

- Which components are zonal, regional, or global?
- What happens when DNS or identity is unavailable?
- Can the application tolerate retries and duplicate messages?
- Are health checks meaningful?
- Is state externalized and replicated?
- Can backups be restored using separate credentials?
- Are recovery procedures tested?
- Which dependencies remain single points of failure?

## Anti-Patterns

- One large VM presented as cloud architecture
- Multi-zone compute with a single-zone database
- Backups that have never been restored
- Disaster recovery without DNS and identity planning
- Cross-region design without data-consistency decisions
- Assuming managed means automatically highly available
