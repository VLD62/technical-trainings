# Multi-host Linux Monitoring

This guide extends the local lab into a generic multi-host design.

## 1. Install Node Exporter

Install Node Exporter using the operating system package manager, an approved container deployment, or a managed configuration tool.

The exact method should match the organization's patching, service-management, and security standards.

## 2. Verify the Exporter Locally

```bash
curl http://localhost:9100/metrics
```

Check that the endpoint contains metrics such as:

```text
node_uname_info
node_cpu_seconds_total
node_memory_MemTotal_bytes
node_filesystem_size_bytes
```

## 3. Restrict Network Access

Allow TCP port `9100` only from the authorized Prometheus server or monitoring network.

Do not expose the exporter to the public internet.

## 4. Add Targets

Edit:

```text
lab/prometheus/targets/linux-hosts.yml
```

Example:

```yaml
- targets:
    - host-01.example.internal:9100
    - host-02.example.internal:9100
    - host-03.example.internal:9100
  labels:
    environment: training
    role: build-machine
    team: platform
```

Use low-cardinality labels that support filtering and ownership.

## 5. Validate Configuration

```bash
make validate
```

## 6. Apply the Change

For the Docker Compose lab:

```bash
docker compose --env-file .env -f lab/docker-compose.yml restart prometheus
```

Prometheus is also started with the lifecycle endpoint enabled, so an authorized local reload can be requested:

```bash
curl -X POST http://localhost:9090/-/reload
```

Do not expose the lifecycle endpoint to untrusted networks.

## 7. Verify Targets

Open:

```text
http://localhost:9090/targets
```

Confirm:

- Target is present
- Health is `UP`
- Labels are correct
- Scrape duration is reasonable
- No network or parsing error is displayed

## 8. Verify in Grafana

Open the provisioned dashboard and select the new instance from the variable.

## Production Considerations

- High availability
- Durable storage
- Retention capacity
- TLS and authentication
- Secret management
- Service discovery
- Alert routing
- Backup and restore
- Upgrade strategy
- Monitoring the monitoring platform
