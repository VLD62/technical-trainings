# Lab 06 — Multi-Cloud Architecture Decision

## Objective

Decide whether ShopNow should use one public cloud, hybrid cloud, or multi-cloud.

## Scenario

ShopNow leadership proposes running the application simultaneously on two public cloud providers to avoid vendor lock-in and outages.

## Tasks

1. Define the business problem the proposal is expected to solve.
2. Identify which failures dual-provider deployment would and would not solve.
3. Estimate added complexity in identity, networking, data, deployment, monitoring, support, and skills.
4. Compare three options:
   - Single provider with multi-zone and regional recovery
   - Primary provider plus provider-independent backups and tested exit plan
   - Active deployment across two public clouds
5. Identify data-consistency and egress implications.
6. State which components should remain portable.
7. Recommend one option with explicit decision criteria.

## Deliverable

Write an Architecture Decision Record with:

- Context
- Decision
- Alternatives
- Benefits
- Risks
- Cost impact
- Exit conditions
- Review date

## Evaluation

A strong answer does not assume that multi-cloud is automatically good or bad. It connects the strategy to measurable business requirements.
