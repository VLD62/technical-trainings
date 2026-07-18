# Lab 04 - Run a Multi-Container Application with Compose

## Goal

Start an application service behind an Nginx reverse proxy using a Compose file.

## Architecture

```text
Browser or curl
      |
localhost:8081
      |
Nginx proxy container
      |
Application container:8000
```

## Step 1 - Inspect the Definition

```bash
cat examples/compose-stack/compose.yaml
cat examples/compose-stack/proxy/nginx.conf
```

Identify:

- Services
- Build context
- Internal service name
- Published port
- Health checks
- Network

## Step 2 - Start the Stack

```bash
make compose-up
```

## Step 3 - Test

```bash
curl http://localhost:8081
```

## Step 4 - Inspect

```bash
docker compose -f examples/compose-stack/compose.yaml ps
docker compose -f examples/compose-stack/compose.yaml logs
docker network ls
```

Find the project network and inspect it:

```bash
docker network inspect <network-name>
```

## Step 5 - Scale the Application Manually

Because the proxy configuration points to the Compose service name, start additional application instances:

```bash
docker compose \
  -f examples/compose-stack/compose.yaml \
  up -d --scale app=2
```

Review container state:

```bash
docker compose -f examples/compose-stack/compose.yaml ps
```

This is a local demonstration, not a replacement for a production load-balancing design.

## Step 6 - Review Service Discovery

Enter the proxy container:

```bash
docker compose \
  -f examples/compose-stack/compose.yaml \
  exec proxy getent hosts app
```

Compose provides DNS-based service discovery on the project network.

## Cleanup

```bash
make compose-down
```

## Review Questions

1. Why is only the proxy port published to the host?
2. How does the proxy resolve `app`?
3. What does the health check validate?
4. Which configuration belongs in Compose rather than the Dockerfile?
5. What additional controls would production require?
