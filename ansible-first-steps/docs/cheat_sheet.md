# Ansible Cheat Sheet

## Verify Installation

```bash
ansible --version
ansible-playbook --version
```

## Inventory Check

```bash
ansible-inventory -i examples/inventory.ini --list
ansible-inventory -i examples/inventory.yml --graph
```

## Connectivity

```bash
ansible all -i examples/inventory.ini -m ping
ansible localhost -m ping -c local
```

## Ad-hoc Commands

```bash
ansible all -i examples/inventory.ini -m command -a "uptime"
ansible all -i examples/inventory.ini -m shell -a "df -h"
ansible all -i examples/inventory.ini -m setup
```

## Run Playbooks

```bash
ansible-playbook -i examples/inventory.ini playbooks/01_ping.yml
ansible-playbook -i examples/inventory.ini playbooks/02_collect_facts.yml
ansible-playbook -i examples/inventory.ini playbooks/03_install_packages.yml --check
ansible-playbook -i examples/inventory.ini playbooks/03_install_packages.yml
```

## Useful Options

```bash
-v          # verbose
-vv         # more verbose
--check     # dry run where supported
--diff      # show file/config differences where supported
--limit web # run only against selected group or host
--become    # run with privilege escalation
```

## Syntax Check

```bash
ansible-playbook --syntax-check playbooks/01_ping.yml
```

## List Tasks

```bash
ansible-playbook -i examples/inventory.ini playbooks/03_install_packages.yml --list-tasks
```
