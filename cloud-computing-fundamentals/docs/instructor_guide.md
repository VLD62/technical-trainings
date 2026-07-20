# Instructor Guide

## Audience

- Developers and system administrators moving toward cloud roles
- DevOps and platform engineers who need a multi-provider foundation
- Technical leads evaluating cloud services
- Learners preparing for a vendor-specific fundamentals certification

## Delivery Option A — One-Day Overview

| Time | Activity |
|---|---|
| 09:00–09:30 | Session 0 and expectations |
| 09:30–10:30 | Sessions 1–2: concepts and reliability |
| 10:45–11:45 | Session 3: identity and security |
| 11:45–12:30 | Lab 2 design exercise |
| 13:30–14:30 | Session 4: core services |
| 14:30–15:45 | Sessions 5–8: provider comparison |
| 16:00–16:45 | Session 9: operations and FinOps |
| 16:45–17:30 | Lab 6 and final assessment |

## Delivery Option B — Five Sessions

1. Cloud models and infrastructure
2. Security, identity, and governance
3. Core technical services
4. AWS, Azure, Google Cloud, and OCI comparison
5. Operations, FinOps, migration, and architecture workshop

## Demonstrations

Safe demonstrations should be read-only unless a controlled sandbox is available:

- Show provider resource hierarchy in a diagram
- Compare CLI account contexts
- Inspect public service catalogs and region pages
- Show a cost calculator without deploying resources
- Review an intentionally weak architecture
- Demonstrate how metadata improves cost ownership

## Discussion Prompts

- When does a VM remain the best compute choice?
- Which responsibilities remain with the customer in a managed database?
- Does multi-cloud improve availability for this specific workload?
- Which service creates the largest exit cost?
- What should be centralized in a landing zone?
- Which cloud cost belongs to the product team versus the platform team?

## Assessment Guidance

A strong learner should be able to:

- Explain concepts without relying on provider brand names
- Map a requirement to at least two provider services
- Identify shared-responsibility boundaries
- Design across at least two failure domains
- Recognize cost and data-transfer implications
- Defend a single-cloud, hybrid, or multi-cloud decision

## Instructor Safety

- Never request learners to display credentials
- Avoid live creation in personal accounts
- Use budgets and automatic cleanup for all sandboxes
- Verify pricing and regional availability before the session
- Treat provider CLI output as potentially sensitive
- Do not present certification dumps or confidential exam content
