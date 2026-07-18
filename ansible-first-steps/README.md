# Ansible First Steps

Welcome to the **Ansible First Steps** course. This training contains course materials, slides, documentation, and practical examples designed to provide a hands-on introduction to Ansible automation.

---

## Course Objectives

By the end of this course participants will:

- Understand what Ansible is and where it is useful
- Understand the agentless Ansible architecture
- Become familiar with inventories, modules, tasks, plays, and playbooks
- Run basic ad-hoc commands against managed hosts
- Write and execute simple YAML playbooks
- Understand the basic Ansible workflow from inventory to automation result
- Practice common operational automation scenarios

---

## Course Structure

### Session 0 – Course Introduction

- Course overview
- Learning objectives
- Environment requirements

### Session 1 – What is Ansible?

- Configuration management and provisioning
- Common automation use cases
- Ansible compared to similar tools

### Session 2 – Why Ansible?

- Agentless architecture
- YAML-based automation
- SSH-based communication
- Community and ecosystem
- Integration with existing tools

### Session 3 – Core Ansible Terms

- Control node
- Managed node
- Inventory
- Module
- Task
- Play
- Playbook
- Facts
- Handlers

### Session 4 – Ansible Workflow

- Define inventory
- Select hosts
- Execute modules
- Run playbooks
- Review output and results

### Session 5 – Installation and Setup

- Python requirements
- SSH requirements
- Installing Ansible
- Verifying the installation

### Session 6 – Ansible Usage

- Inventory examples
- Ad-hoc commands
- Basic playbooks
- Privilege escalation with `become`

### Session 7 – Demo and Practice

- Ping managed hosts
- Collect system facts
- Install packages
- Copy files
- Manage services

---

## Repository Structure

```text
ansible-first-steps/
├── README.md
├── slides/
│   └── 00_ansible_first_steps.md
├── docs/
│   ├── cheat_sheet.md
│   ├── glossary.md
│   └── useful_links.md
├── examples/
│   ├── ansible.cfg
│   ├── group_vars_all.yml
│   ├── inventory.ini
│   └── inventory.yml
├── playbooks/
│   ├── 01_ping.yml
│   ├── 02_collect_facts.yml
│   ├── 03_install_packages.yml
│   ├── 04_copy_file.yml
│   └── 05_manage_service.yml
└── requirements.txt
```

---

## Getting Started

Clone the repository:

```bash
git clone https://github.com/VLD62/technical-trainings.git
cd technical-trainings/ansible-first-steps
```

Create a virtual environment:

```bash
python -m venv .venv
```

Activate it:

```bash
source .venv/bin/activate
```

Install Ansible with pip:

```bash
pip install -r requirements.txt
```

Verify the installation:

```bash
ansible --version
```

Run a basic connectivity check:

```bash
ansible all -i examples/inventory.ini -m ping
```

Run the first playbook:

```bash
ansible-playbook -i examples/inventory.ini playbooks/01_ping.yml
```

---

## Local Lab Notes

The example inventory uses placeholder hosts and should be adjusted before running commands.

Recommended test options:

- Use local virtual machines
- Use local containers with SSH enabled
- Use a small cloud test environment
- Use `localhost` for syntax and workflow practice

For localhost-only testing, run:

```bash
ansible localhost -m ping -c local
```

---

## Recommended Tools

- Python 3.11+
- Ansible
- OpenSSH client
- VS Code or another code editor
- Git

---

## Recommended Learning Approach

For each session:

1. Review the presentation slides
2. Read the related documentation
3. Run the example commands
4. Execute the playbooks in a safe lab environment
5. Modify the examples and observe the result
6. Discuss findings with the group

---

## License

The educational content in this repository, including presentations, documentation, diagrams, and exercises, is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.

Source code, scripts, and executable examples are licensed separately under the MIT License.

Third-party images, trademarks, and referenced materials remain subject to their respective owners and licenses.
