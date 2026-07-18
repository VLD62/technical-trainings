#!/usr/bin/env bash
set -u

section() {
  printf '\n== %s ==\n' "$1"
}

run_optional() {
  local command_name="$1"
  shift

  if command -v "$command_name" >/dev/null 2>&1; then
    "$command_name" "$@" || true
  else
    printf '%s is not installed\n' "$command_name"
  fi
}

section "Host"
printf 'Kernel: '
uname -srmo
printf 'Detected environment: '
run_optional systemd-detect-virt

section "CPU virtualization flags"
if command -v lscpu >/dev/null 2>&1; then
  lscpu | grep -Ei 'Architecture|Virtualization|Hypervisor vendor|Model name' || true
fi

if [[ -r /proc/cpuinfo ]]; then
  flag_count=$(grep -Eoc '(vmx|svm)' /proc/cpuinfo || true)
  printf 'CPU entries with vmx/svm flags: %s\n' "$flag_count"
fi

section "KVM kernel modules"
if command -v lsmod >/dev/null 2>&1; then
  lsmod | grep -E '^kvm' || printf 'No loaded KVM modules found\n'
else
  printf 'lsmod is not installed\n'
fi

section "/dev/kvm"
if [[ -e /dev/kvm ]]; then
  ls -l /dev/kvm
  if [[ -r /dev/kvm && -w /dev/kvm ]]; then
    printf 'Current user can read and write /dev/kvm\n'
  else
    printf 'Current user does not have both read and write access to /dev/kvm\n'
  fi
else
  printf '/dev/kvm is not present\n'
fi

section "Virtualization tools"
for tool in qemu-system-x86_64 qemu-img virsh virt-host-validate; do
  if command -v "$tool" >/dev/null 2>&1; then
    printf '%-24s %s\n' "$tool" "$(command -v "$tool")"
  else
    printf '%-24s not installed\n' "$tool"
  fi
done

section "libvirt guests"
if command -v virsh >/dev/null 2>&1; then
  virsh list --all || true
fi

section "Host validation"
if command -v virt-host-validate >/dev/null 2>&1; then
  virt-host-validate || true
fi

printf '\nInspection complete. No configuration changes were made.\n'
