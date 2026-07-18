#!/usr/bin/env bash
set -u

printf 'OpenStack training prerequisite check\n'
printf '=====================================\n'

check_command() {
  local command_name="$1"
  local purpose="$2"
  if command -v "$command_name" >/dev/null 2>&1; then
    printf '[OK]      %-18s %s\n' "$command_name" "$purpose"
  else
    printf '[MISSING] %-18s %s\n' "$command_name" "$purpose"
  fi
}

check_command python3 'Python runtime for clients and validation'
check_command openstack 'Unified OpenStack CLI for user labs'
check_command ssh 'Remote access for deployment labs'
check_command ansible 'Optional Kolla-Ansible deployment dependency'
check_command docker 'Optional container runtime used by many Kolla environments'
check_command podman 'Alternative container runtime on selected platforms'
check_command virsh 'Optional virtualization inspection'
check_command qemu-system-x86_64 'Optional local or nested virtualization'

printf '\nPython version:\n'
python3 --version 2>/dev/null || true

if command -v openstack >/dev/null 2>&1; then
  printf '\nOpenStack client version:\n'
  openstack --version 2>/dev/null || true
fi

printf '\nVirtualization indicators:\n'
if [[ -r /proc/cpuinfo ]]; then
  count=$(grep -Eoc '(vmx|svm)' /proc/cpuinfo || true)
  printf 'CPU virtualization flags: %s\n' "$count"
fi

if [[ -e /dev/kvm ]]; then
  ls -l /dev/kvm
else
  printf '/dev/kvm not present. This matters only for local or nested compute labs.\n'
fi

printf '\nConfiguration locations:\n'
for path in "$PWD/clouds.yaml" "$HOME/.config/openstack/clouds.yaml" /etc/openstack/clouds.yaml; do
  if [[ -f "$path" ]]; then
    printf '[FOUND] %s\n' "$path"
  fi
done

printf '\nNo credentials were read or displayed.\n'
