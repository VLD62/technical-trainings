---
marp: true
paginate: true
title: Cloud Native Application Delivery and Debugging
---

# Cloud Native Application Delivery

## From source code to a controlled Kubernetes rollout

---

# Delivery Pipeline

A simplified flow:

```text
Source -> Build -> Test -> Scan -> Image Registry
       -> Manifest or Chart -> Deploy -> Verify -> Observe
```

Reliable delivery uses repeatable artifacts, policy checks, approvals where needed, and clear rollback paths.

---

# CI and CD

- **Continuous Integration** validates small source changes frequently
- **Continuous Delivery** keeps changes deployable through automation
- **Continuous Deployment** automatically releases validated changes

The exact boundary between delivery and deployment depends on organizational policy.

---

# GitOps

GitOps uses Git as the reviewed source of truth for desired system state.

Typical controller workflow:

1. Desired manifests are changed through Git
2. Review and automation validate the change
3. A controller compares Git with the cluster
4. Drift is detected and reconciled
5. History supports audit and rollback

Argo CD and Flux are common CNCF ecosystem examples.

---

# Helm

Helm packages Kubernetes resources into **charts**.

Important concepts:

- `Chart.yaml`: chart metadata
- `values.yaml`: default configuration
- Templates: parameterized resource definitions
- Release: installed chart instance
- Repository or OCI registry: chart distribution

Helm helps reuse packages but does not replace sound Kubernetes design.

---

# Rollout Strategies

- **Recreate**: replace all old instances before new ones
- **Rolling update**: gradually replace replicas
- **Blue/green**: switch traffic between complete environments
- **Canary**: send limited traffic to a new version

The chosen strategy balances risk, cost, compatibility, and rollback speed.

---

# Debugging Applications

Useful questions:

- Was the correct image deployed?
- Did the process start successfully?
- Is configuration present and valid?
- Are probes correct?
- Is the Pod scheduled and ready?
- Does the Service select the Pod?
- Are ports aligned across container, Service, and route?
- Does the application have required permissions and storage?

---

# Debugging Commands

```bash
kubectl get pods -n kcna-lab -o wide
kubectl describe pod POD -n kcna-lab
kubectl logs POD -n kcna-lab
kubectl logs POD -n kcna-lab --previous
kubectl get events -n kcna-lab --sort-by=.lastTimestamp
kubectl exec -n kcna-lab POD -- COMMAND
kubectl port-forward -n kcna-lab service/web 8080:80
```

---

# Rollout Operations

```bash
kubectl rollout status deployment/web -n kcna-lab
kubectl rollout history deployment/web -n kcna-lab
kubectl rollout undo deployment/web -n kcna-lab
kubectl scale deployment/web --replicas=3 -n kcna-lab
```

A rollback restores a previous workload template; it does not automatically reverse external data changes.

---

# Delivery Security

- Use trusted and minimal base images
- Scan dependencies and images
- Generate and retain an SBOM where appropriate
- Sign and verify artifacts
- Protect CI credentials
- Review deployment changes
- Separate duties and environments
- Observe the rollout before promoting it
