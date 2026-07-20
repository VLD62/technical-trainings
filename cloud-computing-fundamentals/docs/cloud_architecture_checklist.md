# Cloud Architecture Checklist

Use this checklist during labs and real design reviews. Not every item applies to every workload.

## 1. Business and Ownership

- What business capability does the workload provide?
- Who owns the product, operations, security, and cost?
- What are the critical user journeys?
- What are the expected growth and peak-demand patterns?
- What is the impact of downtime or data loss?

## 2. Data

- What data classifications exist?
- Where may data be stored and processed?
- What are retention and deletion requirements?
- What encryption and key-ownership model is required?
- What backup, restore, and archival requirements apply?
- What data must move between systems, regions, or providers?

## 3. Identity and Access

- Is workforce identity federated?
- Are human and workload identities separated?
- Is least privilege applied?
- Are privileged roles temporary and reviewed?
- Are static credentials eliminated?
- Are break-glass procedures defined and monitored?

## 4. Networking

- What are all inbound and outbound flows?
- Which endpoints must be public?
- Can managed services use private connectivity?
- How are DNS, certificates, routing, NAT, and egress controlled?
- How is on-premises or partner connectivity provided?
- Are address ranges planned to avoid overlap?

## 5. Compute and Application Platform

- Does the workload require VM-level control?
- Can a managed runtime or serverless platform reduce operations?
- Is the application stateless where appropriate?
- How does it scale and recover?
- Are quotas, concurrency, startup time, and execution limits understood?
- How are deployments and rollbacks performed?

## 6. Storage and Database

- Which storage model fits the access pattern?
- What consistency and transaction guarantees are needed?
- What throughput, latency, and capacity are expected?
- How is schema change managed?
- What replication and failover behavior is provided?
- Are deletion protection and recovery tests configured?

## 7. Reliability

- What are the RTO and RPO?
- Which components span zones or regions?
- What happens when a dependency is unavailable?
- Are retries, timeouts, circuit breakers, and idempotency implemented?
- Are backups isolated and regularly restored?
- Is disaster recovery tested?

## 8. Security

- Is public access minimized?
- Are audit logs enabled and protected?
- How are secrets and keys stored and rotated?
- Are images and dependencies scanned?
- How are vulnerabilities patched according to the service model?
- Are threat detection and incident response integrated?

## 9. Observability and Operations

- What service-level indicators and objectives exist?
- Which metrics, logs, traces, and events are required?
- Are alerts actionable and owned?
- Are runbooks and escalation paths available?
- Are service quotas and provider dependencies monitored?
- Is configuration drift detected?

## 10. Cost and Sustainability

- Is cost allocated to product and owner?
- Are budgets and anomaly alerts configured?
- Are non-production resources scheduled or automatically deleted?
- Are storage lifecycle and log-retention policies defined?
- Are commitments based on stable usage?
- What are the major data-transfer costs?
- Is unit cost measured?

## 11. Governance and Lifecycle

- Does the workload use approved accounts, subscriptions, projects, or compartments?
- Are required policies and metadata applied?
- Is infrastructure defined as code?
- Are exceptions documented with expiry dates?
- Is there an exit, migration, or retirement plan?
- Who deletes resources when the workload ends?
