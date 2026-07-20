# Session 0 — Course Introduction

## Learning Objectives

- Understand the course scope and learning path
- Separate durable cloud concepts from provider-specific product names
- Establish cost, security, and account-safety rules
- Learn how the fictional workload connects the labs

## What This Course Is

Cloud Computing: Fundamentals is a provider-neutral foundation with practical mappings to AWS, Azure, Google Cloud, and OCI.

It focuses on:

- Architecture concepts that transfer between providers
- Vocabulary needed to discuss cloud systems
- Responsible use of identities, networks, data, automation, and budgets
- Structured comparison rather than brand-based selection

## What This Course Is Not

- A complete vendor certification course
- Production migration approval
- A substitute for provider documentation
- A catalog of every cloud service
- Permission to create resources in any account

## Learning Flow

1. Learn the provider-neutral concept
2. Identify the provider-specific implementation
3. Apply it to a fictional workload
4. Evaluate security, reliability, operations, and cost
5. Validate assumptions against official documentation

## Fictional Workload

The labs use **ShopNow**, a fictional e-commerce application with:

- A public web frontend
- A stateless application API
- A relational order database
- Product images and documents
- Background order-processing jobs
- Central logs, metrics, and audit events
- European customer data
- Moderate normal traffic and seasonal peaks

See `examples/workload-requirements.yaml`.

## Safety Rules

- Use only authorized accounts
- Never use production subscriptions or projects
- Configure a budget before creating resources
- Prefer read-only commands and architecture exercises
- Delete temporary resources immediately
- Never store credentials in the repository
- Verify current prices and free-tier limitations

## Provider-Neutral Thinking

Ask these questions before choosing a product:

- What business capability is required?
- What responsibility should the team retain?
- What failure modes must be tolerated?
- What data and compliance constraints apply?
- What skills and operating model exist?
- What is the total cost, including people and operations?
- How difficult would migration or exit be?

## Discussion

- Which systems in your organization are already cloud services, even if nobody calls them cloud?
- Which cloud responsibilities are usually underestimated?
- Where would portability be valuable, and where would it create unnecessary complexity?
