---
marp: true
paginate: true
title: Zabbix Monitoring - Course Introduction
---

# Zabbix Monitoring: Basics

## Course Introduction

Reusable training for learning infrastructure monitoring, alerting, troubleshooting, and basic operational practices with Zabbix.

---

# Why Monitoring Matters

Monitoring helps teams answer four important questions:

- Is the service available?
- Is the system healthy?
- Is performance getting worse?
- Does someone need to act now?

A useful monitoring platform should collect data, evaluate conditions, present context, and notify the correct people.

---

# Course Scope

This course covers:

- Zabbix concepts and architecture
- Server, frontend, database, proxy, and agents
- Linux and Windows monitoring
- Kubernetes monitoring
- Access control and authentication
- Alerting and notifications
- Troubleshooting and maintenance
- A small local practice lab

---

# Learning Outcomes

After completing the course, participants should be able to:

- Explain how monitoring data flows through Zabbix
- Add a host and apply a template
- Distinguish active and passive agent checks
- Understand the Kubernetes monitoring model
- Create a basic trigger and action
- Locate relevant logs and diagnose common failures
- Identify production security requirements

---

# Prerequisites

Recommended knowledge:

- Basic Linux administration
- Basic networking concepts
- Familiarity with services and logs
- Basic Docker knowledge for the optional lab
- Basic Kubernetes knowledge for the Kubernetes session

No previous Zabbix experience is required.

---

# Training Materials

```text
slides/    Presentation material
docs/      Reference notes and cheat sheets
examples/  Generic configurations and local lab
```

All examples use placeholder names and credentials.

---

# Recommended Flow

1. Review the slides
2. Start the local lab
3. Add a host
4. Link a template
5. Review collected data
6. Create a trigger
7. Inspect logs
8. Repeat with a modified configuration

---

# Safety Rules

- Use an isolated lab
- Do not test against production without approval
- Do not commit secrets
- Change default credentials
- Limit network exposure
- Verify version-specific steps in official documentation

---

# Course Sessions

1. Monitoring fundamentals
2. Architecture and server components
3. Linux and Windows Agent 2
4. Kubernetes monitoring
5. Security and access control
6. Alerting and troubleshooting
7. Practice lab

---

# Key Takeaway

Zabbix is not only a dashboard.

It is a complete monitoring workflow:

```text
Collect → Store → Evaluate → Visualize → Notify → Act
```
