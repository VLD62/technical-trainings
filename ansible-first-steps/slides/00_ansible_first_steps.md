# Ansible First Steps

Practical introduction to infrastructure automation with Ansible.

---

## Course Goals

By the end of this training you should be able to:

- Explain what Ansible is used for
- Understand the basic Ansible architecture
- Work with inventory files
- Run ad-hoc commands
- Create and run simple playbooks
- Apply Ansible to common operational tasks

---

## What is Ansible?

Ansible is an open-source automation tool used for:

- Configuration management
- Application deployment
- Infrastructure provisioning
- Operational task automation
- Orchestration of multi-step workflows

It helps reduce repetitive manual work and makes infrastructure changes more consistent and repeatable.

---

## Common Use Cases

Ansible can be used to:

- Eliminate repetitive manual tasks
- Manage system configuration
- Install and update packages
- Deploy applications
- Configure services
- Execute commands across multiple servers
- Perform rolling updates with reduced downtime

---

## Why Ansible?

Key advantages:

- Agentless architecture
- Uses SSH for Linux/Unix systems
- Human-readable YAML playbooks
- Broad platform support
- Large ecosystem and community
- Easy integration with existing tools and pipelines

---

## Agentless Architecture

Ansible does not require a permanent agent on managed hosts.

Typical communication model:

```text
Control Node  -- SSH -->  Managed Node 1
              -- SSH -->  Managed Node 2
              -- SSH -->  Managed Node 3
```

The control node runs Ansible. The managed nodes are the systems being automated.

---

## Core Terms

| Term | Meaning |
|---|---|
| Control node | Machine where Ansible is executed |
| Managed node | Target system managed by Ansible |
| Inventory | List of hosts and groups |
| Module | Reusable unit of work |
| Task | Single automation step |
| Play | Set of tasks mapped to hosts |
| Playbook | YAML file containing one or more plays |

---

## Ansible Workflow

Basic workflow:

1. Define target hosts in an inventory
2. Choose an ad-hoc command or playbook
3. Run Ansible from the control node
4. Ansible connects to managed nodes
5. Modules execute on target systems
6. Results are returned to the control node

---

## Installation Requirements

Typical requirements:

- Python installed on the control node
- SSH client on the control node
- SSH access to managed nodes
- Valid user credentials or SSH keys
- Package manager or pip for installation

---

## Installation Example

Install with pip:

```bash
python -m venv .venv
source .venv/bin/activate
pip install ansible
ansible --version
```

Alternative package-manager installation:

```bash
sudo apt install ansible
```

---

## Inventory

An inventory describes the hosts that Ansible can manage.

INI example:

```ini
[web]
web01.example.local
web02.example.local

[db]
db01.example.local
```

YAML example:

```yaml
all:
  children:
    web:
      hosts:
        web01.example.local:
        web02.example.local:
```

---

## Ad-hoc Commands

Ad-hoc commands are useful for quick one-time actions.

Syntax:

```bash
ansible <hosts> -i <inventory> -m <module> -a "<arguments>"
```

Examples:

```bash
ansible all -i examples/inventory.ini -m ping
ansible all -i examples/inventory.ini -m command -a "uptime"
ansible web -i examples/inventory.ini -m shell -a "df -h"
```

---

## Playbooks

Playbooks are YAML files that describe desired automation steps.

Example:

```yaml
- name: Check connectivity
  hosts: all
  gather_facts: false

  tasks:
    - name: Ping hosts
      ansible.builtin.ping:
```

Playbooks are reusable, version-controlled, and easier to review than one-time commands.

---

## Privilege Escalation

Some tasks require elevated privileges.

Use `become` when a task should run with higher permissions:

```yaml
- name: Install packages
  hosts: all
  become: true

  tasks:
    - name: Install curl
      ansible.builtin.package:
        name: curl
        state: present
```

---

## Demo Flow

Suggested demo:

1. Review inventory
2. Run `ansible all -m ping`
3. Run an uptime ad-hoc command
4. Collect facts
5. Run a package installation playbook
6. Copy a managed file
7. Manage a service

---

## Practice Tasks

Try to:

- Add a new host group to the inventory
- Run an ad-hoc command only against one group
- Create a playbook that installs two packages
- Add a task that copies a file to `/tmp`
- Use `--check` mode before applying changes

---

## Key Takeaways

- Ansible is useful for repeatable infrastructure automation
- Inventories define the automation targets
- Modules perform the actual work
- Ad-hoc commands are good for quick actions
- Playbooks are better for repeatable automation
- YAML readability makes automation easier to review and share

---

## Thank You
