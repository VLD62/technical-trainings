# Kubernetes Command Cheat Sheet

These commands support learning and troubleshooting. The KCNA exam is multiple choice, so understand what each command reveals rather than memorizing every flag.

## Context and Cluster

```bash
kubectl config current-context
kubectl config get-contexts
kubectl cluster-info
kubectl get nodes -o wide
kubectl version
```

## API Discovery

```bash
kubectl api-resources
kubectl api-versions
kubectl explain pod
kubectl explain deployment.spec
kubectl get --raw /version
```

## Namespaces

```bash
kubectl get namespaces
kubectl create namespace kcna-lab
kubectl get all -n kcna-lab
kubectl delete namespace kcna-lab
```

## Workloads

```bash
kubectl get pods,deployments,replicasets -n kcna-lab
kubectl get pods -n kcna-lab -o wide
kubectl describe pod POD -n kcna-lab
kubectl scale deployment/web --replicas=3 -n kcna-lab
kubectl rollout status deployment/web -n kcna-lab
kubectl rollout history deployment/web -n kcna-lab
kubectl rollout undo deployment/web -n kcna-lab
```

## Logs and Events

```bash
kubectl logs POD -n kcna-lab
kubectl logs POD -n kcna-lab --previous
kubectl logs deployment/web -n kcna-lab
kubectl get events -n kcna-lab --sort-by=.lastTimestamp
```

## Networking

```bash
kubectl get services,endpoints,endpointslices -n kcna-lab
kubectl describe service web -n kcna-lab
kubectl port-forward service/web 8080:80 -n kcna-lab
kubectl get ingress,networkpolicy -A
```

## Configuration and Security

```bash
kubectl get configmaps,secrets,serviceaccounts -n kcna-lab
kubectl auth can-i get pods -n kcna-lab
kubectl auth can-i --list -n kcna-lab
kubectl get role,rolebinding -n kcna-lab
kubectl get clusterrole,clusterrolebinding
```

## Storage

```bash
kubectl get storageclass
kubectl get pv
kubectl get pvc -A
kubectl describe pvc NAME -n kcna-lab
```

## Resource Usage

Requires Metrics Server:

```bash
kubectl top nodes
kubectl top pods -A
```

## Output and Filtering

```bash
kubectl get pods -A -o wide
kubectl get deployment web -n kcna-lab -o yaml
kubectl get pods -n kcna-lab -l app=web
kubectl get pods -n kcna-lab -o jsonpath='{.items[*].metadata.name}'
```

## Apply and Delete

```bash
kubectl diff -f examples/manifests/deployment.yaml
make demo-apply
make demo-delete
```

Review deletion scope carefully before executing commands.
