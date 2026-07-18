# Zabbix Monitoring: Basics

Welcome to the **Zabbix Monitoring: Basics** course.

This training contains reusable slides, reference documentation, configuration examples, and an optional local lab for learning the foundations of infrastructure monitoring with Zabbix.

---

## Course Objectives

By the end of this course participants will:

- Understand the purpose of infrastructure monitoring and alerting
- Understand the main Zabbix components and their responsibilities
- Work with hosts, items, triggers, events, problems, actions, and templates
- Understand passive and active Zabbix Agent 2 checks
- Configure generic Linux and Windows monitoring examples
- Understand the Zabbix approach to Kubernetes monitoring
- Apply basic access-control, authentication, encryption, and alerting practices
- Troubleshoot common server, proxy, agent, database, and notification issues

---

## Course Structure

### Session 0 – Course Introduction

- Course overview
- Learning objectives
- Prerequisites
- How to use the materials

### Session 1 – Monitoring Fundamentals and Zabbix Concepts

- Monitoring and alerting goals
- Hosts, items, triggers, events, and problems
- Actions, media types, dashboards, and templates
- Passive and active checks

### Session 2 – Architecture and Server Components

- Zabbix server
- Database backend
- Web frontend
- Zabbix proxy
- Agent and Agent 2
- Network ports, data flow, sizing, and high availability

### Session 3 – Linux and Windows Monitoring with Agent 2

- Agent 2 installation approaches
- Generic Linux configuration
- Generic Windows configuration
- Host registration and template linking
- Connectivity testing and encryption

### Session 4 – Kubernetes Monitoring

- Kubernetes monitoring architecture
- Zabbix proxy and Agent 2 deployment
- Kubernetes API and kube-state-metrics
- Official Helm chart workflow
- Templates, macros, filtering, and common deployment conflicts

### Session 5 – Security, Authentication, and Access Control

- User groups and roles
- Internal, LDAP, SAML, HTTP, and MFA authentication
- TLS with certificates or pre-shared keys
- Secret management and least privilege
- Audit and operational access practices

### Session 6 – Alerting, Troubleshooting, and Maintenance

- Media types and trigger actions
- Server and agent logs
- Queue and unsupported-item analysis
- Database, housekeeping, and capacity checks
- Maintenance windows and escalation control

### Session 7 – Practice Lab

- Start a local Zabbix environment
- Log in and change the default password
- Add a monitored host
- Link a template
- Review latest data and problems
- Create a simple trigger and notification workflow
- Practice log-based troubleshooting

---

## Repository Structure

```text
zabbix-monitoring-basics/
├── README.md
├── slides/
│   ├── 00_course_introduction.md
│   ├── 01_monitoring_fundamentals.md
│   ├── 02_architecture_and_server.md
│   ├── 03_linux_and_windows_agents.md
│   ├── 04_kubernetes_monitoring.md
│   ├── 05_security_and_access_control.md
│   ├── 06_alerting_troubleshooting_and_maintenance.md
│   └── 07_practice_lab.md
├── docs/
│   ├── cheat_sheet.md
│   ├── deployment_notes.md
│   ├── glossary.md
│   └── useful_links.md
└── examples/
    ├── .env.example
    ├── docker-compose.yml
    ├── kubernetes-values.yaml.example
    ├── zabbix_agent2.conf.example
    └── zabbix_server.conf.example
```

---

## Prerequisites

For the optional local lab:

- Linux, macOS, or Windows with a Linux-compatible container runtime
- Docker Engine or Docker Desktop
- Docker Compose plugin
- A web browser
- Git
- Enough CPU, memory, and disk space for the selected lab configuration

For Kubernetes practice:

- Access to a non-production Kubernetes cluster
- `kubectl`
- Helm
- Permission to create a namespace, service accounts, workloads, and related resources

---

## Getting Started

Clone the repository:

```bash
git clone https://github.com/VLD62/technical-trainings.git
cd technical-trainings/zabbix-monitoring-basics
```

Review the course materials:

```bash
find slides docs examples -maxdepth 2 -type f | sort
```

### Optional Local Lab

Create the local environment file:

```bash
cp examples/.env.example examples/.env
```

Start the lab:

```bash
docker compose \
  --env-file examples/.env \
  -f examples/docker-compose.yml \
  up -d
```

Open the frontend:

```text
http://localhost:8080
```

Initial lab credentials:

```text
Username: Admin
Password: zabbix
```

Change the password immediately after the first login.

Stop the lab:

```bash
docker compose \
  --env-file examples/.env \
  -f examples/docker-compose.yml \
  down
```

Remove the lab and its data volumes:

```bash
docker compose \
  --env-file examples/.env \
  -f examples/docker-compose.yml \
  down -v
```

---

## Version Notes

The optional container lab uses the **Zabbix 7.0 LTS** image line as a stable training baseline.

Zabbix releases, package names, supported operating systems, database requirements, templates, and Helm chart details evolve over time. Always verify production installation and upgrade steps against the official documentation for the selected Zabbix version.

---

## Recommended Learning Approach

For each session:

1. Review the corresponding slide deck
2. Read the supporting documentation
3. Inspect the generic configuration examples
4. Run the optional lab in an isolated environment
5. Modify one setting and observe the result
6. Document what should be different in a production deployment

---

## Security Notes

- Never commit real passwords, API tokens, PSKs, private keys, SMTP credentials, or LDAP bind credentials.
- Do not expose the Zabbix frontend or server ports directly to untrusted networks.
- Use TLS for server, proxy, and agent communication.
- Use a dedicated database account with only the required privileges.
- Keep at least one tested emergency administrator access path.
- Replace all sample values before using the examples outside a local lab.
- Apply least privilege to users, API tokens, service accounts, and Kubernetes RBAC.

---

## Notes

This training uses generic examples only. It does not reference internal systems, proprietary infrastructure, internal teams, or company-specific processes.

Screenshots from source documents were intentionally not reused because they contained environment-specific identifiers and configuration values.

---

## License

The educational content in this repository, including presentations, documentation, diagrams, and exercises, is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.

Source code, scripts, and executable examples are licensed separately under the MIT License.

Third-party images, trademarks, and referenced materials remain subject to their respective owners and licenses.
