# Quiz 3 — Security, Scale, and Operations

## Questions

1. Why is Git write access a production security concern?
2. Name three repository controls for production desired state.
3. What is the difference between Argo CD RBAC and Kubernetes RBAC?
4. Name three safe secret-management patterns.
5. Why should repository credentials use a machine identity?
6. What does a sync window control?
7. Name two ApplicationSet generators.
8. What new risk appears when using a matrix generator across applications and clusters?
9. Why should CI propose a GitOps change instead of deploying directly?
10. What metrics describe delivery outcome rather than only controller health?
11. What is a safe first step when an application is OutOfSync?
12. What must a break-glass process do after the incident?

<details>
<summary>Suggested answers</summary>

1. Automated reconciliation can turn a Git change into a production change.
2. Protected branches, required reviews, CODEOWNERS, MFA, status checks, signed identity, audit logs, secret scanning.
3. Argo CD RBAC controls actions through Argo CD; Kubernetes RBAC controls what identities can do to Kubernetes resources.
4. External Secrets, SOPS, Sealed Secrets, Secrets Store CSI Driver.
5. It can be scoped, rotated, audited, and separated from a person's lifecycle.
6. Whether synchronization is allowed or denied during defined periods.
7. List, Git directories/files, cluster, matrix, merge, pull request, SCM provider.
8. A single template or input change can affect a large fleet.
9. It removes broad cluster credentials from CI and preserves reviewed desired-state history.
10. Merge-to-detect time, sync-to-healthy time, change failure rate, drift duration, promotion lead time, manual intervention rate.
11. Inspect the diff and application conditions before syncing or changing permissions.
12. Reconcile the emergency state back into Git, remove temporary access, and conduct a review.

</details>
