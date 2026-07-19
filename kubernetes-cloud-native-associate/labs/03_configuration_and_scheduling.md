# Lab 03 — Configuration and Scheduling

## Objectives

- Inject ConfigMap and Secret data
- Inspect requests and limits
- Review scheduling inputs
- Explain taints, tolerations, and affinity without changing cluster-critical settings

## 1. Apply Configuration

```bash
kubectl apply -f examples/manifests/namespace.yaml
kubectl apply -f examples/manifests/configmap.yaml
kubectl apply -f examples/manifests/secret-example.yaml
kubectl get configmap,secret -n kcna-lab
```

Do not decode or display real secrets. The included value is synthetic.

## 2. Apply the Deployment

```bash
kubectl apply -f examples/manifests/deployment.yaml
kubectl rollout status deployment/web -n kcna-lab
kubectl get deployment web -n kcna-lab -o yaml
```

Find:

- Environment values sourced from the ConfigMap
- Environment values sourced from the Secret
- CPU and memory requests
- CPU and memory limits

## 3. Inspect Placement

```bash
kubectl get pods -n kcna-lab -o wide
kubectl describe pod -n kcna-lab -l app=web
kubectl describe nodes
```

Look for:

- Selected node
- Requests and limits
- Node labels
- Node taints
- Scheduling events

## 4. Review Scheduling Constructs

```bash
kubectl explain pod.spec.nodeSelector
kubectl explain pod.spec.affinity
kubectl explain pod.spec.tolerations
kubectl explain pod.spec.topologySpreadConstraints
```

## Review

- Why does the scheduler use requests rather than current usage?
- Does a toleration force a Pod onto a tainted node?
- When would anti-affinity improve resilience?
- Why should sensitive values not be placed in a ConfigMap?
- Why is Base64 not a security boundary?
