# Session 6 – Alerting and Operations

## Alerting Goal

An alert should identify a condition that requires human attention.

A good alert is:

- Actionable
- Relevant
- Timely
- Understandable
- Routed to the correct owner

---

## Prometheus Alert Rule

```yaml
groups:
  - name: infrastructure
    rules:
      - alert: InstanceDown
        expr: up{job="linux-hosts"} == 0
        for: 2m
        labels:
          severity: critical
        annotations:
          summary: "Target {{ $labels.instance }} is unavailable"
          description: "Prometheus has failed to scrape the target for two minutes."
```

---

## Rule Components

- `alert` – rule name
- `expr` – PromQL condition
- `for` – required duration
- `labels` – routing and classification metadata
- `annotations` – human-readable context

---

## Alert on Symptoms

Strong alert:

> The service is unavailable for users.

Potentially noisy alert:

> CPU is above 80% for one minute.

CPU can be useful as a warning, but it should not replace service-level signals.

---

## Avoiding Noise

- Use a meaningful `for` duration
- Alert only on actionable conditions
- Group related alerts
- Add ownership labels
- Include runbook information
- Review alerts after incidents
- Remove alerts that are consistently ignored

---

## Grafana Alerting

Grafana can evaluate alert rules using Prometheus queries and route notifications through contact points and notification policies.

The training lab focuses on rule concepts. Notification delivery must be configured with safe test destinations and must not include real credentials in Git.

---

## Operational Topics

### Persistence

Prometheus and Grafana use named Docker volumes in the lab.

### Retention

Prometheus retention is configurable through:

```text
PROMETHEUS_RETENTION
```

### Backup

Back up:

- Prometheus and Grafana configuration
- Grafana dashboard JSON
- Alert rules
- Provisioning files
- Persistent data when recovery requirements demand it

### Upgrades

- Pin supported versions
- Review release notes
- Test configuration validation
- Back up before upgrades
- Roll out changes gradually

---

## Security Review

- Authentication
- TLS
- Network restrictions
- Secret management
- Role-based access
- Patch management
- Auditability
- Data sensitivity
