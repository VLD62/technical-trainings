---
marp: true
theme: default
paginate: true
---

# Linux Security, SSH, and Encryption

### LPIC-1 objectives 110.1–110.3

**Presenter:** Vladislav Iliev

**Audience:** Linux learners, system administrators, DevOps engineers, and certification candidates

---

## Security Administration

- Review users, groups, passwords, privileges, services, ports, and special-permission files.
- Apply local policy and least privilege.
- Use `who`, `w`, and `last` to review sessions.
- Use resource limits where appropriate.

---

## sudo and su

- `sudo` grants controlled command execution.
- Edit sudo policy with `visudo`.
- Prefer specific commands and groups over broad unrestricted access.
- `su` changes identity and may create a login shell with `-`.

---

## Service and Port Review

- Use `ss -lntup` to inspect listeners.
- Use `lsof` or `fuser` to map resources to processes.
- Disable unused services and socket units.
- Treat external scanning as an authorized activity only.

---

## Password and Account Security

- Shadow passwords protect hashes from normal users.
- Use `passwd` and `chage` to manage credentials and aging.
- Lock stale accounts.
- Avoid shared accounts and weak recovery practices.

---

## OpenSSH

- Use public-key authentication for automation and administration.
- Verify host keys.
- Use `ssh-agent` to manage unlocked keys.
- Understand local, remote, and dynamic forwarding conceptually.

---

## SSH Key Lifecycle

- Generate modern keys such as Ed25519 where supported.
- Protect private keys with appropriate permissions and passphrases.
- Distribute public keys through `authorized_keys`.
- Revoke compromised keys and rotate access.

---

## GnuPG

- GPG supports encryption, decryption, signing, and verification.
- Public keys may be shared; private keys must be protected.
- Fingerprints help verify identity.
- Revocation certificates support key lifecycle management.

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
