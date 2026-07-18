# Exercise 1 – Prometheus Targets

## Goal

Understand jobs, instances, labels, and target health.

## Tasks

1. Start the lab.
2. Open the Prometheus targets page.
3. Identify all configured jobs.
4. Record each target's endpoint and health.
5. Stop the sample application container.
6. Observe the target state and the `up` metric.
7. Start the application again.
8. Explain how Prometheus detected the failure and recovery.

## Commands

```bash
docker compose --env-file .env -f lab/docker-compose.yml stop sample-app
docker compose --env-file .env -f lab/docker-compose.yml start sample-app
```

## Completion Check

Explain the difference between:

- Job
- Instance
- Target
- `up` metric
