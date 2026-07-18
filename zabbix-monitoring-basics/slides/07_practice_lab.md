---
marp: true
paginate: true
title: Zabbix Practice Lab
---

# Practice Lab

## From Empty Environment to First Problem

---

# Lab Goals

In this lab, participants will:

- Start a local Zabbix environment
- Access the frontend
- Change the default password
- Review system information
- Add a host
- Link a template
- Review latest data
- Create a simple trigger
- Inspect a problem
- Practice troubleshooting

---

# Start the Lab

```bash
cp examples/.env.example examples/.env

docker compose \
  --env-file examples/.env \
  -f examples/docker-compose.yml \
  up -d
```

Check status:

```bash
docker compose \
  --env-file examples/.env \
  -f examples/docker-compose.yml \
  ps
```

---

# Access the Frontend

Open:

```text
http://localhost:8080
```

Initial lab login:

```text
Username: Admin
Password: zabbix
```

Immediately change the password.

Do not reuse this password outside the isolated lab.

---

# Review System Information

Navigate to:

```text
Reports → System information
```

Review:

- Server status
- Zabbix version
- Number of hosts
- Number of items
- Number of triggers
- Required server performance
- HA information if present

---

# Add a Simple Host

Create a host using:

```text
Data collection → Hosts → Create host
```

Suggested values:

```text
Host name: zabbix-server
Host group: Linux servers
Agent interface DNS: zabbix-agent2
Port: 10050
```

Use the actual service names from the lab network.

---

# Link a Template

Link:

```text
Linux by Zabbix agent
```

Then review:

- Availability
- Latest data
- Item errors
- Discovery rules
- Graphs

It may take several collection intervals before all values appear.

---

# Test an Item

Inside the Agent 2 container:

```bash
docker compose \
  --env-file examples/.env \
  -f examples/docker-compose.yml \
  exec zabbix-agent2 \
  zabbix_agent2 -t system.uptime
```

Compare the result with **Monitoring → Latest data**.

---

# Create a Simple Trigger

Create a lab-only trigger based on a predictable metric.

Example idea:

```text
System uptime is lower than a selected threshold
```

Lab trigger requirements:

- Clear name
- Appropriate severity
- Short evaluation window
- Automatic recovery
- Easy cleanup after the exercise

Do not copy artificial lab thresholds to production.

---

# Observe a Problem

Navigate to:

```text
Monitoring → Problems
```

Review:

- Problem name
- Severity
- Host
- Duration
- Tags
- Operational data
- Acknowledgement
- Event details
- Recovery state

Add an acknowledgement note describing the test.

---

# Practice Log Troubleshooting

Stop the agent:

```bash
docker compose \
  --env-file examples/.env \
  -f examples/docker-compose.yml \
  stop zabbix-agent2
```

Review:

```bash
docker compose \
  --env-file examples/.env \
  -f examples/docker-compose.yml \
  logs --tail=100 zabbix-server
```

Restart:

```bash
docker compose \
  --env-file examples/.env \
  -f examples/docker-compose.yml \
  start zabbix-agent2
```

Observe availability and recovery.

---

# Practice Tasks

- Change a host macro
- Review which items use the macro
- Disable and re-enable one item
- Create a host group
- Clone a trigger
- Add a maintenance window
- Review the action log
- Inspect the queue
- Find an unsupported item
- Export a template configuration

---

# Cleanup

Stop the lab:

```bash
docker compose \
  --env-file examples/.env \
  -f examples/docker-compose.yml \
  down
```

Remove all lab data:

```bash
docker compose \
  --env-file examples/.env \
  -f examples/docker-compose.yml \
  down -v
```

---

# Discussion Questions

- Which component collected each metric?
- Which network connection was required?
- What caused the test problem?
- How did Zabbix determine recovery?
- Which logs were useful?
- How would this design change for 1,000 hosts?
- Which security controls are missing from the lab?
- What must be backed up?

---

# Final Takeaway

A useful Zabbix workflow connects:

```text
Host → Template → Item → Trigger → Problem → Action → Response
```

Understanding this chain makes both configuration and troubleshooting easier.
