# Final Assessment

## Part A — Multiple Choice

### 1. Which statement best describes GitOps?

A. Every deployment command is stored in a shell script  
B. Desired state is declarative, versioned, automatically pulled, and continuously reconciled  
C. Developers have direct production cluster access  
D. Git replaces all monitoring systems

### 2. An Argo CD Application is Synced but Degraded. What does this mean?

A. Git cannot be reached  
B. Live configuration matches desired state, but workload health is failing  
C. The Application was deleted  
D. The Git branch is protected

### 3. Which control most directly limits an Application to approved repositories and namespaces?

A. ConfigMap  
B. AppProject  
C. Helm release history  
D. Dockerfile

### 4. What is the main risk of enabling prune?

A. Git history is deleted  
B. Resources removed from desired state may be deleted from the cluster  
C. Images cannot be pulled  
D. Helm cannot render

### 5. Which is the strongest production artifact reference?

A. `latest`  
B. A mutable branch name  
C. An immutable image digest  
D. A local developer image

### 6. Which system should normally build and scan the image?

A. Application controller  
B. Continuous Integration  
C. Kubernetes scheduler  
D. AppProject

### 7. Which is not encryption?

A. SOPS with a managed key  
B. Sealed Secrets ciphertext  
C. Base64 in a Kubernetes Secret  
D. External secret manager storage

### 8. Which Flux resource defines a Git source?

A. Application  
B. AppProject  
C. GitRepository  
D. HelmReleaseSet

## Part B — Short Answer

9. Explain drift and self-healing.
10. Explain why rollback of Git configuration may not recover a failed database migration.
11. Describe a safe CI-to-GitOps handoff.
12. List four observability signals for a GitOps controller.
13. Explain when a central Argo CD instance may be inappropriate.
14. Describe a break-glass process compatible with GitOps.
15. Compare Kustomize overlays and Helm values in one paragraph.

## Part C — Design Scenario

You support:

- 12 applications
- Three environments
- Two production clusters
- Four teams
- Jenkins CI
- External secret manager
- Required production approval

Design:

1. Repository structure
2. Promotion workflow
3. AppProject boundaries
4. ApplicationSet or manual Application strategy
5. Secret workflow
6. CI credentials
7. Production sync policy
8. Monitoring and alerting
9. Recovery plan

## Answer Key

1. B
2. B
3. B
4. B
5. C
6. B
7. C
8. C

### Evaluation Guidance

Strong answers should mention:

- Continuous reconciliation
- Immutable artifacts
- Pull-request review
- Separation of CI and deployment
- Least privilege
- No plaintext secrets
- Explicit environment promotion
- Sync and health distinction
- Narrow controller ownership
- Measured recovery
- Git reconciliation after emergency changes
