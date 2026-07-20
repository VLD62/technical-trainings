# Cost Management and FinOps Foundations

## Why Cloud Cost Is Different

Traditional infrastructure often emphasizes procurement and fixed capacity. Cloud cost is more granular, variable, API-driven, and directly influenced by architecture and engineering behavior.

Cost must be treated as an operational signal, not only a monthly finance report.

## Core FinOps Principles

- Teams collaborate across engineering, finance, procurement, and business
- Everyone takes ownership of their cloud usage
- Cost data should be timely and accessible
- Decisions are based on business value, not cost alone
- Variable cost is an opportunity to optimize continuously
- Central teams enable standards while product teams remain accountable

## Allocation Metadata

Useful mandatory fields:

- Owner
- Product or application
- Environment
- Cost center
- Data classification
- Managed-by tool
- Expiry date for temporary resources

Metadata must be enforced and linked to real organizational ownership.

## Budgeting and Forecasting

A budget should include:

- Expected monthly baseline
- Peak or seasonal scenarios
- Growth assumptions
- Data transfer
- Logs and monitoring
- Backup and disaster recovery
- Support plans
- License cost
- Commitment discounts
- Contingency

Budget alerts do not stop spending unless additional automation or provider controls are configured.

## Optimization Categories

### Eliminate Waste

- Delete abandoned resources
- Remove unattached disks and snapshots
- Expire temporary environments
- Reduce unnecessary log retention
- Stop idle non-production compute

### Right-Size

- Match compute to real CPU and memory usage
- Select appropriate managed service tiers
- Adjust database and storage throughput
- Use autoscaling carefully

### Pricing Model

- Use on-demand for uncertain demand
- Use spot/preemptible capacity for interruption-tolerant workloads
- Use commitments only for stable usage
- Review license-included and bring-your-own-license options

### Architecture

- Cache repeated requests
- Use lifecycle policies
- Reduce cross-zone and cross-region transfer where appropriate
- Choose serverless for suitable demand profiles
- Avoid collecting telemetry without a retention purpose

## Unit Economics

Examples:

- Cost per customer
- Cost per order
- Cost per API request
- Cost per build
- Cost per processed gigabyte
- Cost per active tenant

Unit metrics connect engineering choices to business value better than total spend alone.

## Cost Review Questions

- Is every resource attributable to an owner?
- What are the top five cost drivers?
- Which costs scale with usage and which are fixed?
- What happens during a traffic peak?
- What data leaves a region or provider?
- Are logs and backups retained intentionally?
- Are commitment discounts fully used?
- Does lower infrastructure cost create higher operational risk?
