# Linux Administration: Basics

Welcome to the **Linux Administration: Basics** course.

This training provides a practical, vendor-neutral introduction to Linux administration and is aligned with the currently published **LPIC-1 version 5.0** objectives for exams **101-500** and **102-500**.

> This is an independent training resource. It is not an official Linux Professional Institute course and is not endorsed by LPI.

---

## Course Objectives

By the end of this course participants will be able to:

- Understand the Linux boot process and basic system architecture
- Work confidently with the Bash command line
- Manage files, archives, text streams, processes, and regular expressions
- Create partitions and filesystems in a safe lab environment
- Configure mounts, permissions, ownership, and links
- Use Debian and RPM-family package management tools
- Customize shell environments and write simple Bash scripts
- Manage users, groups, scheduled tasks, locales, and time settings
- Work with system logging and essential services
- Configure and troubleshoot basic Linux networking and DNS
- Apply basic host security, SSH, and GnuPG practices
- Prepare systematically for LPIC-1 exams 101-500 and 102-500

---

## Certification Scope

LPIC-1 requires passing two exams:

| Exam | Main coverage |
|---|---|
| **101-500** | System architecture, installation and package management, GNU/Unix commands, devices, filesystems, and the Filesystem Hierarchy Standard |
| **102-500** | Shells and scripting, user interfaces, administrative tasks, system services, networking, and security |

The official objective weights are mapped in [`docs/lpic1_objectives_mapping.md`](docs/lpic1_objectives_mapping.md).

---

## Course Structure

### Part I – Exam 101

| Session | Topic |
|---|---|
| 0 | Course introduction and lab setup |
| 1 | System architecture and boot process |
| 2 | Disk layout, partitions, and boot loaders |
| 3 | Package management, shared libraries, and virtualization guests |
| 4 | Command line and file management |
| 5 | Text processing, streams, regular expressions, and editors |
| 6 | Processes, jobs, and execution priorities |
| 7 | Filesystems, mounts, permissions, links, and FHS |
| 8 | Exam 101 review |

### Part II – Exam 102

| Session | Topic |
|---|---|
| 9 | Shell environment and Bash scripting |
| 10 | Graphical interfaces and accessibility |
| 11 | Users, groups, scheduling, and localisation |
| 12 | Time, logging, mail, and printing services |
| 13 | Networking and client-side DNS |
| 14 | Linux security, SSH, and encryption |
| 15 | Exam 102 review and final practice |

---

## Repository Structure

```text
linux-administration-basics/
├── README.md
├── Makefile
├── slides/
│   ├── README.md
│   ├── 00_course_introduction.md
│   ├── 01_system_architecture_and_boot.md
│   ├── 02_disks_partitions_and_grub.md
│   ├── 03_package_management_and_virtualization.md
│   ├── 04_command_line_and_files.md
│   ├── 05_text_processing_regex_and_editors.md
│   ├── 06_processes_jobs_and_priorities.md
│   ├── 07_filesystems_permissions_links_and_fhs.md
│   ├── 08_exam_101_review.md
│   ├── 09_shell_environment_and_scripting.md
│   ├── 10_graphical_interfaces_and_accessibility.md
│   ├── 11_users_groups_scheduling_and_localisation.md
│   ├── 12_essential_system_services.md
│   ├── 13_networking_and_dns.md
│   ├── 14_linux_security_ssh_and_encryption.md
│   └── 15_exam_102_review.md
├── docs/
│   ├── lab_setup.md
│   ├── lpic1_objectives_mapping.md
│   ├── exam_101_checklist.md
│   ├── exam_102_checklist.md
│   ├── command_cheat_sheet.md
│   ├── glossary.md
│   ├── useful_links.md
│   ├── study_plan.md
│   ├── instructor_guide.md
│   └── repository_integration.md
├── labs/
│   ├── 01_hardware_and_boot.md
│   ├── 02_disk_and_filesystem_lab.md
│   ├── 03_package_management.md
│   ├── 04_command_line_and_file_management.md
│   ├── 05_text_processing_and_regex.md
│   ├── 06_process_management.md
│   ├── 07_permissions_links_and_fhs.md
│   ├── 08_shell_scripting.md
│   ├── 09_users_groups_and_scheduling.md
│   ├── 10_system_services.md
│   ├── 11_networking_and_dns.md
│   └── 12_security_ssh_and_gpg.md
├── scripts/
│   ├── system_inventory.sh
│   ├── filesystem_report.sh
│   ├── process_report.sh
│   ├── user_report.sh
│   ├── network_diagnostics.sh
│   └── validate_lab_environment.sh
├── examples/
│   ├── bash/
│   ├── cron/
│   ├── grub/
│   ├── network/
│   └── systemd/
└── quizzes/
    ├── exam_101_questions.md
    ├── exam_102_questions.md
    └── practical_final_exam.md
```

---

## Getting Started

Clone the training repository and enter this module:

```bash
git clone https://github.com/VLD62/technical-trainings.git
cd technical-trainings/linux-administration-basics
```

Validate the local environment:

```bash
./scripts/validate_lab_environment.sh
```

Review the recommended lab setup:

```bash
less docs/lab_setup.md
```

Start with the introductory slides and the first lab:

```bash
less slides/00_course_introduction.md
less labs/01_hardware_and_boot.md
```

---

## Recommended Lab Environment

Use disposable virtual machines or snapshots.

Recommended minimum setup:

- One Ubuntu Server LTS virtual machine
- One Rocky Linux or AlmaLinux virtual machine
- Optional openSUSE virtual machine for `zypper` practice
- 2 CPU cores, 2–4 GB RAM, and 20 GB storage per VM
- A non-root user with `sudo` access
- Network access between the VMs

For disk exercises, the course uses regular files attached as loop devices. Do not practice destructive storage commands on a production machine.

---

## Recommended Learning Approach

For every session:

1. Review the presentation slides
2. Read the matching objective mapping and checklist items
3. Run the related script or example
4. Complete the lab in a disposable environment
5. Explain the commands without relying on notes
6. Complete the relevant quiz section
7. Revisit objectives with higher exam weights

---

## Safety Notes

- Do not run storage, user-management, networking, or service commands on production systems.
- Read every command before executing it.
- Use VM snapshots before partitioning, boot-loader, PAM, firewall, or SSH changes.
- Prefer `visudo` over editing `/etc/sudoers` directly.
- Keep an active recovery session before changing remote SSH or network configuration.
- The included scripts are designed to collect information and avoid destructive changes.

---

## Validation

Run the lightweight repository checks:

```bash
make validate
```

This checks executable shell scripts with `bash -n`, verifies expected files, and scans Markdown links for obvious local-path errors.

---

## License

The educational content in this repository, including presentations, documentation, diagrams, exercises, and quizzes, is licensed under the **Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License**.

Source code, scripts, and executable examples are licensed separately under the **MIT License**.

Third-party names, trademarks, links, and referenced materials remain subject to their respective owners and licenses.
