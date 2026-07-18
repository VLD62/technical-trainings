---
marp: true
theme: default
paginate: true
---

# Package Management and Virtualization Guests

### LPIC-1 objectives 102.3–102.6

**Presenter:** Vladislav Iliev

**Audience:** Linux learners, system administrators, DevOps engineers, and certification candidates

---

## Shared Libraries

- `ldd` shows dynamic library dependencies of a program.
- `ldconfig` rebuilds the runtime linker cache.
- `/etc/ld.so.conf` and drop-in files define additional library paths.
- `LD_LIBRARY_PATH` changes lookup behavior for a process environment.

---

## Debian Package Tools

- `dpkg` works with installed packages and local `.deb` files.
- `apt` and `apt-get` resolve dependencies using configured repositories.
- `apt-cache` and `apt show` inspect package metadata.
- `dpkg -S` identifies the installed package owning a file.

---

## RPM Package Tools

- `rpm` queries and verifies installed or local RPM packages.
- `dnf` or `yum` resolves dependencies and repository metadata.
- `rpm -qf` identifies the installed package owning a file.
- `rpm -V` verifies installed files against package metadata.

---

## Zypper Awareness

- `zypper repos` lists repositories.
- `zypper search` searches packages.
- `zypper install` and `zypper remove` manage packages.
- Understand the workflow even when openSUSE is not the main lab system.

---

## Repository Hygiene

- Use trusted repositories and verify signatures.
- Know where repository definitions are stored.
- Refresh metadata before troubleshooting missing packages.
- Avoid mixing incompatible distribution repositories.

---

## Virtualization Guest Concepts

- Virtual machines emulate or expose hardware to a guest OS.
- Containers share the host kernel.
- Cloud instances commonly use images, metadata services, virtual networking, and block storage.
- Guest tools improve time sync, shutdown, drivers, and host integration.

---

## Cloning and Templates

- Regenerate SSH host keys when required.
- Ensure machine identifiers are unique.
- Use cloud-init or equivalent first-boot initialization.
- Remove environment-specific secrets before creating an image.

---

## Practice

- Run the commands in a disposable lab.
- Capture expected and unexpected output.
- Explain what changed and how to reverse it.
- Complete the matching lab and checklist items.

---

## Key Takeaways

- Understand the concept before memorizing options.
- Know the important commands, files, and failure modes.
- Prefer safe, observable, reversible practice.
- Review the official LPIC-1 objectives as the source of truth.
