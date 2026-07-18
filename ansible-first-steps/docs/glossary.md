# Ansible Glossary

## Ad-hoc command

A one-time Ansible command executed directly from the command line.

## Ansible configuration file

A file, usually named `ansible.cfg`, used to define project-level Ansible behavior.

## Become

Ansible privilege escalation mechanism. It is commonly used to run tasks with elevated permissions.

## Control node

The machine where Ansible is installed and executed.

## Facts

System information collected by Ansible from managed nodes, such as operating system, network interfaces, memory, and CPU details.

## Handler

A special task triggered by another task, usually used to restart or reload services after configuration changes.

## Inventory

A file that lists the managed hosts and groups Ansible can target.

## Managed node

A target machine that is managed by Ansible.

## Module

A reusable Ansible component that performs a specific action, such as installing a package or copying a file.

## Play

A mapping between a group of hosts and a list of tasks.

## Playbook

A YAML file containing one or more plays.

## Task

A single automation step in a playbook.
