# Lab 04 — Storage, Security, and Troubleshooting

## Objectives

- Inspect StorageClasses, PVs, and PVCs
- Apply a sample PVC when dynamic provisioning exists
- Inspect authorization with `kubectl auth can-i`
- Diagnose common failure patterns

## 1. Inspect Storage

```bash
kubectl get storageclass
kubectl get pv
kubectl get pvc -A
```

If a default StorageClass exists, apply the example:

```bash
kubectl apply -f examples/manifests/namespace.yaml
kubectl apply -f examples/manifests/pvc.yaml
kubectl get pvc -n kcna-lab
kubectl describe pvc training-data -n kcna-lab
```

If the PVC remains Pending, inspect events and determine whether a provisioner is available.

## 2. Inspect Authorization

```bash
kubectl auth can-i get pods -n kcna-lab
kubectl auth can-i create deployments -n kcna-lab
kubectl auth can-i --list -n kcna-lab
kubectl get serviceaccounts -n kcna-lab
```

Questions:

- Which identity is `kubectl` currently using?
- Why is namespace scope preferable when cluster scope is unnecessary?
- What is the relationship among Role, RoleBinding, and ServiceAccount?

## 3. Generate a Safe Configuration Failure

Apply a Pod with a missing ConfigMap reference:

```bash
kubectl run missing-config --image=busybox:1.36 -n kcna-lab \
  --overrides='{"spec":{"containers":[{"name":"missing-config","image":"busybox:1.36","command":["sh","-c","sleep 3600"],"envFrom":[{"configMapRef":{"name":"does-not-exist"}}]}]}}'
```

Inspect it:

```bash
kubectl get pod missing-config -n kcna-lab
kubectl describe pod missing-config -n kcna-lab
kubectl get events -n kcna-lab --sort-by=.lastTimestamp
```

Clean up:

```bash
kubectl delete pod missing-config -n kcna-lab
```

## 4. Follow the Troubleshooting Order

For every failure, record:

1. Symptom
2. Object status
3. Relevant event
4. Root cause
5. Corrective action
6. Verification command

## Review

- What creates a PV during dynamic provisioning?
- What does a PVC represent?
- Why can a Pod be Pending even when the image is valid?
- Which command reveals authorization without changing resources?
