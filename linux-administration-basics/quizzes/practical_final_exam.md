# Practical Final Exam

This practical assessment is original course material. It is not a simulation of actual LPI exam delivery and does not contain real exam questions.

## Rules

- Use disposable virtual machines.
- Create a snapshot before starting.
- Complete the tasks without copying commands from the labs.
- You may use manual pages and local documentation.
- Record commands, output, and rollback steps.
- Do not perform unauthorized scanning or connect to systems outside the lab.

Suggested duration: 3–4 hours.

## Part A – Exam 101 Skills

### Task 1 – System and Boot Report

Create a report containing:

- Distribution and kernel version
- CPU architecture and memory
- Block devices and filesystems
- Loaded modules
- Default systemd target
- Failed systemd units
- Five warning-or-higher events from the current boot

**Validation:** The report is reproducible with a script and contains timestamps.

### Task 2 – Safe Filesystem

Using a 750 MB file-backed loop device:

1. Create a GPT partition table.
2. Create one partition.
3. Create an ext4 filesystem with a label.
4. Mount it by UUID.
5. Create a sample fstab file without editing the real `/etc/fstab`.
6. Demonstrate capacity and inode checks.
7. Unmount and detach cleanly.

**Validation:** No loop device or mount remains after cleanup.

### Task 3 – Package Ownership

On Debian and RPM-family VMs:

- Install a small package
- Identify the package owning its executable
- List package contents
- Inspect dependencies or metadata
- Identify one shared library dependency and its owning package

**Validation:** Commands and output are included for both package families.

### Task 4 – Text Pipeline

From a supplied or self-generated log file:

- Count lines by severity
- Extract unique client addresses
- Select only 4xx and 5xx responses with an extended regex
- Redirect normal output and errors to separate files
- Create a compressed archive and checksum

**Validation:** A second user can reproduce the result.

### Task 5 – Processes and Permissions

- Start a background process with nice value 10
- Verify and change its nice value
- Stop and continue it with signals
- Terminate it gracefully
- Create an SGID shared directory and a sticky shared directory
- Demonstrate hard and symbolic-link behavior

**Validation:** Explain every observed permission and process state.

## Part B – Exam 102 Skills

### Task 6 – Administrative Script

Write a Bash script that:

- Uses an explicit interpreter
- Validates dependencies and arguments
- Reads a list of usernames from a file
- Reports whether each account exists
- Produces a summary count
- Uses predictable locale behavior
- Returns non-zero if any user is missing

**Validation:** `bash -n` passes and ShellCheck has no unexplained high-confidence findings.

### Task 7 – Users and Scheduling

- Create a temporary group and user
- Set a non-default shell and password-aging policy
- Add the user to a supplementary group
- Schedule a recurring report with cron or a user systemd timer
- Schedule a one-time job with at when available
- Remove all created resources

**Validation:** Account and scheduling state is shown before and after cleanup.

### Task 8 – Logs and Time

- Identify the time synchronization service
- Show synchronization state
- Generate a tagged log message
- Query it by tag and time
- Identify persistent journal configuration
- Dry-run logrotate

**Validation:** No logs are deleted.

### Task 9 – Network Diagnosis

Produce a network report showing:

- Link state and addresses
- IPv4 and IPv6 routes
- Active NetworkManager profile where applicable
- Listening sockets
- Resolver policy
- DNS A and AAAA records for an authorized test name
- A layered diagnosis of one intentionally introduced lab failure

**Validation:** The failure and recovery are documented clearly.

### Task 10 – Security, SSH, and GPG

- Review active sessions and listeners
- Find SUID/SGID files under selected system paths
- Generate an Ed25519 SSH key in a temporary directory
- Display its fingerprint
- Load and remove it from an SSH agent
- Generate an isolated temporary GPG key
- Encrypt/decrypt and sign/verify a file
- Remove temporary key material securely enough for the disposable lab context

**Validation:** Explain confidentiality, integrity, authentication, and key trust separately.

## Scoring Guide

| Area | Points |
|---|---:|
| Correctness | 40 |
| Safety and rollback | 20 |
| Evidence and validation | 15 |
| Explanation and troubleshooting | 15 |
| Script quality and clarity | 10 |
| **Total** | **100** |

Suggested readiness threshold: 80 points with no unsafe storage, network, privilege, or key-management action.
