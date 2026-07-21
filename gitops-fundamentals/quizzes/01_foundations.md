# Quiz 1 — GitOps Foundations

## Questions

1. Name the four OpenGitOps principles.
2. What is the difference between desired state and actual state?
3. What is reconciliation?
4. Why is a one-time deployment pipeline not necessarily GitOps?
5. What is configuration drift?
6. Can an application be Synced and Degraded at the same time?
7. Why can pull-based delivery reduce CI credential exposure?
8. Is base64 encoding sufficient protection for Kubernetes Secret values?
9. What is the difference between GitOps and Infrastructure as Code?
10. Give two limitations of configuration rollback.

<details>
<summary>Suggested answers</summary>

1. Declarative; versioned and immutable; pulled automatically; continuously reconciled.
2. Desired state is the approved declaration; actual state is what the target currently reports.
3. Repeated observation, comparison, and corrective action intended to align actual state with desired state.
4. It may push once and stop, without continuous observation or correction.
5. A relevant difference between desired and actual state.
6. Yes. The cluster may match an invalid image declaration exactly.
7. The cluster-side controller retrieves desired state, so CI does not need broad direct cluster credentials.
8. No. Base64 is an encoding, not encryption.
9. IaC focuses on defining/provisioning infrastructure; GitOps focuses on continuously operating versioned desired state. They can be combined.
10. It may not reverse database changes, external side effects, deleted data, or incompatible schema migrations.

</details>
