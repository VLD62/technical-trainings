# Lab Setup

## Purpose

The course contains commands that can modify storage, accounts, services, boot configuration, networking, and security settings. Use disposable virtual machines and snapshots.

## Recommended Topology

```text
Host workstation
├── linux-deb     Ubuntu Server LTS
├── linux-rpm     Rocky Linux or AlmaLinux
└── linux-suse    openSUSE Leap (optional)
```

Recommended resources per VM:

- 2 virtual CPUs
- 2–4 GB RAM
- 20 GB system disk
- NAT for internet access
- Optional host-only or isolated network for peer testing

## Required Access

Create a normal user with sudo privileges. Do not study exclusively as root because LPIC-1 tests permissions, environment behavior, and privilege escalation.

Example verification:

```bash
id
sudo -v
uname -a
cat /etc/os-release
```

## Suggested Packages

Debian family:

```bash
sudo apt update
sudo apt install -y \
  bash-completion bzip2 chrony cpio curl dnsutils file findutils \
  gawk gnupg iproute2 lsof lvm2 man-db netcat-openbsd openssh-client \
  openssh-server parted procps rsyslog shellcheck strace sudo tar tmux \
  tree util-linux vim xz-utils
```

RPM family:

```bash
sudo dnf install -y \
  bash-completion bzip2 chrony cpio curl bind-utils file findutils \
  gawk gnupg2 iproute lsof lvm2 man-db nmap-ncat openssh-clients \
  openssh-server parted procps-ng rsyslog shellcheck strace sudo tar tmux \
  tree util-linux vim-enhanced xz
```

Package names can differ between releases. Resolve unavailable packages instead of forcing installation from unrelated repositories.

## Snapshot Strategy

Create snapshots before:

- Disk partitioning or filesystem repair
- GRUB or initramfs changes
- Network profile changes over SSH
- SSH daemon configuration changes
- User, group, sudo, or password-policy changes
- Service disablement
- Time or locale experiments that affect applications

Suggested snapshot names:

```text
00-clean-install
01-packages-installed
02-before-storage-lab
03-before-network-lab
04-before-security-lab
```

## Safe Storage Practice

Use a file-backed loop device instead of a real disk:

```bash
truncate -s 1G /tmp/lpic-disk.img
LOOP_DEV=$(sudo losetup --find --show /tmp/lpic-disk.img)
echo "$LOOP_DEV"
lsblk "$LOOP_DEV"
```

After the lab:

```bash
sudo umount /mnt/lpic-lab 2>/dev/null || true
sudo losetup -d "$LOOP_DEV"
rm -f /tmp/lpic-disk.img
```

Never copy commands containing `/dev/sdX`, `/dev/nvmeXnY`, or `dd of=` without identifying the target independently.

## Network Safety

Before changing a remote connection:

1. Keep a second root or console session available.
2. Record the current address, route, DNS, and NetworkManager profile.
3. Use `nmcli connection checkpoint` where supported.
4. Test configuration syntax before restarting services.
5. Schedule an automatic rollback for high-risk remote changes.

## Validation

Run:

```bash
./scripts/validate_lab_environment.sh
```

The script reports available commands and distribution information. It does not install packages or change the system.
