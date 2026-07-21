# Instructor Guide

## Audience

The course is suitable for:

- DevOps engineers
- Platform engineers
- Kubernetes administrators
- Software engineers responsible for delivery
- Technical leads
- SREs
- Cloud engineers
- Teams evaluating GitOps adoption

## Recommended Delivery

### Two-Day Workshop

**Day 1**

- Session 0: Setup
- Session 1: Foundations
- Session 2: Repository design
- Session 3: Argo CD fundamentals
- Labs 1–3

**Day 2**

- Session 4: Operations
- Session 5: Helm and Kustomize
- Session 6: Security
- Session 7: Scale and CI
- Session 8: Flux and operating model
- Selected Labs 4–10

### Four Half-Days

1. Foundations and first application
2. Synchronization, Kustomize, and Helm
3. Security, projects, and promotion
4. ApplicationSet, Flux, operations, and final project

## Teaching Method

Use the cycle:

1. Explain the concept
2. Show the declaration
3. Render locally
4. Commit to Git
5. Observe reconciliation
6. Introduce controlled failure
7. Diagnose
8. Fix through Git
9. Reflect on production controls

## Demonstrations

Recommended demonstrations:

- Manual sync versus automated sync
- Direct `kubectl` drift
- Self-healing
- Removing a resource and pruning
- Synced but degraded workload
- Kustomize environment difference
- Helm rendering
- AppProject denial
- ApplicationSet generation
- CI-created image update
- Flux resource mapping
- Controller log investigation

## Lab Repository

Prepare a repository before class or let learners create one.

Replace every `REPLACE_ME` placeholder. For private repositories, preconfigure safe access or provide a documented credential exercise.

## Risk Controls

- Use disposable clusters.
- Do not request learner production credentials.
- Avoid shared personal tokens.
- Warn before pruning demonstrations.
- Keep destructive labs within `gitops-*` namespaces.
- Verify cleanup commands.
- Do not use mutable production dependencies.
- Explain that the official stable install URL is convenient for labs, not a production pinning strategy.

## Discussion Questions

- Which system owns desired state today?
- Where are manual changes made?
- Who can write production configuration?
- How would emergency access work with self-healing?
- Which resources should one controller own?
- What must remain outside Git?
- How would data migrations be coordinated?
- Which environments need separate repositories or instances?
- What is the acceptable fleet blast radius?
- Which health signals control promotion?

## Assessment

Use:

- Session quizzes
- Lab observation
- Final architecture review
- Final project pull request
- Troubleshooting scenario

A successful learner should explain not only how to configure a controller, but why the operating model is safe, auditable, and recoverable.
