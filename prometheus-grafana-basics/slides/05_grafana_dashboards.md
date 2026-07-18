# Session 5 – Grafana Dashboards

## Grafana Responsibilities

Grafana:

- Connects to data sources
- Runs queries
- Visualizes results
- Provides dashboards and variables
- Supports alerting workflows
- Organizes access through users, teams, folders, and permissions

Prometheus remains the source of metric data.

---

## Data Source

The lab provisions Prometheus as a data source:

```yaml
apiVersion: 1

datasources:
  - name: Prometheus
    type: prometheus
    uid: prometheus
    access: proxy
    url: http://prometheus:9090
    isDefault: true
```

Provisioned configuration can be version controlled and reviewed.

---

## Explore Before Dashboard

Use Explore to:

- Test PromQL
- Inspect labels
- Compare query variants
- Select time ranges
- Check whether missing data is a query or dashboard problem

Create a panel only after the query is understood.

---

## Dashboard Design

A useful infrastructure dashboard might contain:

- Target status
- CPU utilization
- Memory utilization
- Disk free percentage
- Network traffic
- Load average
- Host metadata

---

## Visualization Selection

Use:

- **Stat** for current status or a single number
- **Time series** for trends
- **Gauge** for bounded utilization
- **Table** for host comparisons
- **Bar gauge** for ranked values

Avoid decorative visualizations that do not help a user make a decision.

---

## Variables

A host variable allows one dashboard to work for many machines.

Example variable query:

```text
label_values(node_uname_info{job="linux-hosts"}, instance)
```

Use it in PromQL:

```promql
up{job="linux-hosts", instance=~"$instance"}
```

---

## Provisioning

The lab provisions:

- Prometheus data source
- Dashboard provider
- Linux host overview dashboard

Benefits:

- Reproducible setup
- Version control
- Reviewable changes
- Faster environment creation
- Easier rollback

---

## Dashboard Review Checklist

- Does every panel answer a clear question?
- Are units correct?
- Are legends understandable?
- Are thresholds meaningful?
- Does the dashboard work with multiple hosts?
- Are missing-data states visible?
- Is the refresh interval reasonable?
