# Session 1 – Monitoring and Observability Basics

## Monitoring

Monitoring checks known system conditions.

Examples:

- Host is reachable
- CPU utilization is high
- Disk space is low
- Request error rate exceeds a threshold

## Observability

Observability helps explain internal system behavior using external outputs.

The three commonly used telemetry types are:

- Metrics
- Logs
- Traces

This course focuses on metrics.

---

## What Is a Metric?

A metric is a numeric measurement recorded over time.

Examples:

```text
node_memory_MemAvailable_bytes
http_requests_total
process_cpu_seconds_total
```

A metric becomes a time series when it is combined with a unique set of labels.

---

## Symptoms and Causes

Prefer dashboards and alerts that start with user-visible symptoms.

Symptoms:

- Requests are failing
- Response time is high
- Service is unavailable

Possible causes:

- CPU saturation
- Memory pressure
- Disk failure
- Network problems

A high CPU value is not always an incident. Context matters.

---

## Useful Infrastructure Signals

- Availability
- CPU utilization
- Load
- Memory utilization
- Disk capacity
- Disk I/O
- Network traffic
- Process health

---

## Application Signals

A useful starting point is:

- Request rate
- Error rate
- Duration or latency
- Saturation

---

## Monitoring Questions

A good dashboard should answer a specific question.

Weak question:

> Show every available metric.

Better questions:

> Which monitored hosts are unavailable?
>
> Which host has the highest CPU usage?
>
> Is the application error rate increasing?

---

## Exercise

List three signals for:

1. A Linux build machine
2. A web application
3. The monitoring platform itself
