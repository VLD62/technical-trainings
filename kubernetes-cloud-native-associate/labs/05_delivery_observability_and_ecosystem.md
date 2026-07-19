# Lab 05 — Delivery, Observability, and Ecosystem

## Objectives

- Observe a Deployment rollout
- Compare health probe behavior
- Identify available telemetry sources
- Map CNCF projects to architectural purposes

## 1. Apply the Probe Example

```bash
kubectl apply -f examples/manifests/namespace.yaml
kubectl apply -f examples/manifests/probes-deployment.yaml
kubectl rollout status deployment/probe-demo -n kcna-lab
kubectl describe deployment probe-demo -n kcna-lab
kubectl describe pod -n kcna-lab -l app=probe-demo
```

Identify the startup, readiness, and liveness probes.

## 2. Observe a Rollout

```bash
kubectl set image deployment/probe-demo web=nginx:stable-alpine -n kcna-lab
kubectl rollout status deployment/probe-demo -n kcna-lab
kubectl rollout history deployment/probe-demo -n kcna-lab
```

Discuss what would happen if the new image failed readiness.

## 3. Review Telemetry Sources

```bash
kubectl get events -n kcna-lab --sort-by=.lastTimestamp
kubectl logs deployment/probe-demo -n kcna-lab
kubectl get --raw /metrics >/dev/null 2>&1 && echo "API metrics endpoint reachable" || true
```

If Metrics Server is installed:

```bash
kubectl top nodes
kubectl top pods -n kcna-lab
```

## 4. Delivery Concept Map

Create a text flow using these terms:

- Git repository
- CI pipeline
- Container image
- Registry
- Helm chart or manifests
- GitOps controller
- Kubernetes API
- Deployment
- Metrics and logs
- Rollback

Explain where policy and security checks can be applied.

## 5. CNCF Landscape Exercise

Visit the official CNCF Landscape and identify one project for each category:

- Runtime
- Networking
- Storage
- Observability
- Delivery
- Service mesh or proxy
- Security or policy

For every project, write one sentence describing the problem it solves. Do not try to memorize every project.

## Review

- How does readiness affect traffic during a rollout?
- What does GitOps reconcile?
- How does Helm relate to Kubernetes manifests?
- Which telemetry signal best follows one request across services?
- What is the purpose of CNCF project maturity levels?
