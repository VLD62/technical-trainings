# Lab 09 - Optional Kolla-Ansible All-in-One

## Warning

This is an advanced, resource-intensive lab. Use a clean disposable virtual machine and follow the Kolla-Ansible documentation matching the selected OpenStack release.

The commands below are a workflow outline, not a universal installation recipe.

## Suggested Training VM

Training recommendation, not an upstream minimum:

- Ubuntu 24.04 LTS or another supported distribution
- 8 vCPU
- 16-32 GiB RAM
- 100 GiB free disk
- One management interface
- One dedicated external-network interface without an IP address
- Nested virtualization when launching KVM-backed instances

## 1. Prepare a Virtual Environment

```bash
python3 -m venv ~/venvs/kolla
source ~/venvs/kolla/bin/activate
python -m pip install --upgrade pip
```

Install Kolla-Ansible using the version-matched upstream procedure and constraints.

## 2. Copy Configuration

Prepare:

```text
/etc/kolla/globals.yml
/etc/kolla/passwords.yml
all-in-one inventory
```

Use `examples/kolla/globals.yml.example` only as a discussion template. Interface names and release settings must match the VM.

## 3. Generate Passwords

```bash
kolla-genpwd
chmod 600 /etc/kolla/passwords.yml
```

Back up the file securely and never commit it.

## 4. Deploy

Version-matched outline:

```bash
kolla-ansible install-deps
kolla-ansible bootstrap-servers -i all-in-one
kolla-ansible prechecks -i all-in-one
kolla-ansible deploy -i all-in-one
kolla-ansible post-deploy
```

## 5. Validate

- Token issue
- Catalog and endpoints
- Compute service
- Network backend
- Image upload
- Test network and router
- Test instance
- Optional volume backend

## 6. Cleanup

Use the release-specific Kolla-Ansible destruction procedure only after preserving any evidence and confirming that the VM is disposable.

Deleting the VM is often the cleanest training cleanup.
