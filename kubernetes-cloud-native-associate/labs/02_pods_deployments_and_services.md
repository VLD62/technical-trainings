# Lab 02 — Pods, Deployments, and Services

## Objectives

- Compare a standalone Pod with a Deployment
- Inspect labels and controller ownership
- Expose a workload through a Service
- Diagnose a selector mismatch

## 1. Create a Standalone Pod

```bash
kubectl apply -f examples/manifests/namespace.yaml
kubectl apply -f examples/manifests/pod.yaml
kubectl get pod demo-pod -n kcna-lab -o wide
kubectl describe pod demo-pod -n kcna-lab
```

Delete the Pod and observe that it is not recreated:

```bash
kubectl delete pod demo-pod -n kcna-lab
kubectl get pods -n kcna-lab
```

## 2. Create a Deployment

```bash
kubectl apply -f examples/manifests/deployment.yaml
kubectl get deployment,replicaset,pod -n kcna-lab
kubectl get pods -n kcna-lab --show-labels
```

Delete one managed Pod and observe reconciliation:

```bash
kubectl delete pod -n kcna-lab -l app=web --wait=false
kubectl get pods -n kcna-lab -w
```

Stop the watch with `Ctrl+C`.

## 3. Create a Service

```bash
kubectl apply -f examples/manifests/service.yaml
kubectl get service,endpoints,endpointslices -n kcna-lab
kubectl describe service web -n kcna-lab
```

Test through port forwarding:

```bash
kubectl port-forward service/web 8080:80 -n kcna-lab
```

In another terminal:

```bash
curl http://127.0.0.1:8080
```

## 4. Break the Selector

```bash
kubectl patch service web -n kcna-lab -p '{"spec":{"selector":{"app":"wrong-label"}}}'
kubectl get endpoints,endpointslices -n kcna-lab
```

Restore it:

```bash
kubectl patch service web -n kcna-lab -p '{"spec":{"selector":{"app":"web"}}}'
```

## Review

- Why does a Deployment recreate deleted Pods?
- What connects a Service to Pods?
- What happens when the selector matches no ready Pods?
- Why is a ClusterIP Service stable even though Pod IPs change?
