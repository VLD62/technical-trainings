# Lab 01 - Inspect Host Virtualization Support

## Goal

Identify whether the current Linux host supports hardware-assisted virtualization and whether KVM/libvirt components are available.

This lab is read-only.

## Step 1 - Run the Helper

From the course root:

```bash
make check-virtualization
```

## Step 2 - Inspect CPU Virtualization Flags

```bash
lscpu | grep -i virtualization || true
grep -Eoc '(vmx|svm)' /proc/cpuinfo
```

Interpretation:

- `vmx` commonly indicates Intel virtualization extensions.
- `svm` commonly indicates AMD virtualization extensions.
- A zero result can mean unsupported hardware, disabled firmware settings, or restricted nested virtualization.

## Step 3 - Inspect KVM

```bash
lsmod | grep -E '^kvm' || true
ls -l /dev/kvm || true
```

Questions:

- Is the generic `kvm` module loaded?
- Is a vendor module such as `kvm_intel` or `kvm_amd` loaded?
- Does `/dev/kvm` exist?
- Does the current user have permission to access it?

## Step 4 - Inspect libvirt

```bash
virsh version || true
virsh list --all || true
virt-host-validate || true
```

Commands may be unavailable if libvirt packages are not installed.

## Step 5 - Detect Whether the Host Is Already Virtualized

```bash
systemd-detect-virt || true
```

A workstation may itself be a VM. Nested virtualization might or might not be enabled.

## Review Questions

1. Which layer provides hardware acceleration?
2. What is the difference between QEMU and KVM?
3. What role does libvirt provide?
4. Why might `/dev/kvm` exist but still be inaccessible?
5. Which changes would require administrator approval?

## Cleanup

No cleanup is required.
