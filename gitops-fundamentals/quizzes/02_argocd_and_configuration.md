# Quiz 2 — Argo CD and Configuration

## Questions

1. What does an Argo CD Application connect?
2. Which component normally generates manifests?
3. What is the difference between sync status and health status?
4. What does pruning do?
5. What does self-healing do?
6. Why is `allowEmpty` potentially dangerous?
7. When would Kustomize be preferred over Helm?
8. In the Argo CD Helm model, which system owns reconciliation?
9. Why should generated manifests be reviewed in CI?
10. What is the role of an AppProject?
11. What is ApplicationSet?
12. Why must two controllers not manage the same fields without an explicit ownership design?

<details>
<summary>Suggested answers</summary>

1. A project, source and revision, destination, and synchronization policy.
2. The repository server.
3. Sync compares configuration; health assesses runtime condition.
4. Deletes live resources no longer present in desired state.
5. Corrects eligible live-state drift.
6. A wrong or empty render combined with pruning can remove resources.
7. When reusable bases and explicit environment patches are sufficient and template logic is unnecessary.
8. Argo CD; Helm is used as a renderer.
9. A small source change can generate a large or unsafe operational change.
10. It groups applications and restricts sources, destinations, resources, roles, and windows.
11. A controller and resource that generate multiple Applications from templates and generators.
12. They may continuously overwrite each other and create unstable drift.

</details>
