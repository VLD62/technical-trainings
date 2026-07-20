# Lab 04 — Provider Service Mapping

## Objective

Map the ShopNow architecture to AWS, Azure, Google Cloud, and OCI without assuming products are identical.

## Tasks

For each provider, select services for:

- DNS and global entry
- Load balancing
- Stateless application compute
- Managed relational database
- Object storage
- Queue or event service
- Secret and key management
- Logging and monitoring
- Audit logging
- Infrastructure as Code

Use `docs/provider_service_mapping.md` and `examples/provider-service-map.csv` as starting points.

## Evaluation Criteria

Score each provider from 1 to 5 for:

- Functional fit
- Team skills
- Regional availability
- Identity integration
- Reliability options
- Operational effort
- Cost transparency
- Portability
- Existing organizational relationship

## Deliverable

A comparison table and a recommendation of one primary provider.

## Required Discussion

- Which selected service is most provider-specific?
- Which component would be easiest to migrate?
- Which component has the highest data-transfer risk?
- What provider feature could justify deliberate lock-in?
