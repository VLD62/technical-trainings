# KCNA Labs

The labs reinforce the concepts tested by KCNA. They are intentionally broader than the minimum multiple-choice exam format.

## Lab Order

| Lab | Main topics |
|---:|---|
| 01 | Contexts, nodes, namespaces, API discovery, and inventory |
| 02 | Pods, Deployments, Services, labels, endpoints, and troubleshooting |
| 03 | ConfigMaps, Secrets, requests, limits, and scheduling concepts |
| 04 | Storage, RBAC inspection, security reasoning, and diagnostic workflow |
| 05 | Rollouts, probes, delivery, observability, and CNCF ecosystem mapping |

## Before Every Lab

```bash
kubectl config current-context
kubectl get nodes
```

Confirm that the current context is a disposable training cluster.

## Cleanup

```bash
kubectl delete namespace kcna-lab --ignore-not-found
```
