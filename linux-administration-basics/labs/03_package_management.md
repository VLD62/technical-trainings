# Lab 3 – Package Management and Shared Libraries

## Objectives

- Query, install, and remove packages on Debian and RPM families
- Identify which package owns a file
- Inspect package contents and verification data
- Inspect shared-library dependencies

## Part A – Debian Family

```bash
apt-cache policy curl
apt show curl
sudo apt update
sudo apt install -y curl
dpkg -l curl
dpkg -L curl | head
dpkg -S "$(command -v curl)"
```

Download without installing and inspect:

```bash
mkdir -p /tmp/lpic-packages && cd /tmp/lpic-packages
apt download curl
DPKG_FILE=$(find . -maxdepth 1 -name 'curl_*.deb' | head -n1)
dpkg-deb -I "$DPKG_FILE" | head -n 30
dpkg-deb -c "$DPKG_FILE" | head
```

## Part B – RPM Family

```bash
dnf info curl
sudo dnf install -y curl
rpm -q curl
rpm -ql curl | head
rpm -qf "$(command -v curl)"
rpm -V curl
```

Download and inspect when the download plugin is available:

```bash
mkdir -p /tmp/lpic-packages && cd /tmp/lpic-packages
dnf download curl
RPM_FILE=$(find . -maxdepth 1 -name 'curl-*.rpm' | head -n1)
rpm -qip "$RPM_FILE" | head -n 30
rpm -qlp "$RPM_FILE" | head
```

## Shared Libraries

```bash
ldd "$(command -v curl)"
ldconfig -p | head
cat /etc/ld.so.conf 2>/dev/null || true
find /etc/ld.so.conf.d -maxdepth 1 -type f -print 2>/dev/null
```

Choose one library from `ldd` and identify which package owns it.

## Repository Review

Debian family:

```bash
find /etc/apt -maxdepth 2 -type f -print
```

RPM family:

```bash
find /etc/yum.repos.d -maxdepth 1 -type f -print
```

## Validation

- You can distinguish low-level package tools from dependency-resolving tools.
- You can identify package ownership of an executable and a shared library.
- You can explain what package verification can and cannot prove.
- You can explain why mixing repositories from different distributions is unsafe.

## Cleanup

Remove downloaded package files. Keep `curl` installed if it was already present or needed by later labs.
