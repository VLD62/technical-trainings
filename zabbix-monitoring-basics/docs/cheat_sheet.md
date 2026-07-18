# Zabbix Cheat Sheet

## Service Status

```bash
sudo systemctl status zabbix-server
sudo systemctl status zabbix-proxy
sudo systemctl status zabbix-agent2
```

## Service Control

```bash
sudo systemctl restart zabbix-server
sudo systemctl restart zabbix-proxy
sudo systemctl restart zabbix-agent2

sudo systemctl enable --now zabbix-agent2
```

## Journal Logs

```bash
sudo journalctl -u zabbix-server -xe
sudo journalctl -u zabbix-proxy -xe
sudo journalctl -u zabbix-agent2 -xe

sudo journalctl -u zabbix-server -f
sudo journalctl -u zabbix-agent2 -f
```

## Typical Log Files

```text
/var/log/zabbix/zabbix_server.log
/var/log/zabbix/zabbix_proxy.log
/var/log/zabbix/zabbix_agent2.log
```

Actual paths depend on the deployment method and configuration.

## Listening Ports

```bash
sudo ss -lntp | grep 10050
sudo ss -lntp | grep 10051
```

## Agent 2 Tests

```bash
zabbix_agent2 -t system.uptime
zabbix_agent2 -t system.hostname
zabbix_agent2 -t agent.ping
```

With an explicit configuration file:

```bash
zabbix_agent2 \
  -c /etc/zabbix/zabbix_agent2.conf \
  -t system.uptime
```

## Passive Check Test

```bash
zabbix_get \
  -s linux01.example.com \
  -p 10050 \
  -k system.uptime
```

## Basic Connectivity

```bash
getent hosts zabbix.example.com
nc -vz zabbix.example.com 10051
nc -vz linux01.example.com 10050
```

## Main Agent 2 Settings

```ini
Server=zabbix.example.com
ServerActive=zabbix.example.com
Hostname=linux01.example.com
ListenPort=10050
```

## Main Server Settings

```ini
DBHost=db.example.local
DBName=zabbix
DBUser=zabbix
DBPassword=<secret>
LogFile=/var/log/zabbix/zabbix_server.log
```

## Local Docker Lab

Start:

```bash
cp examples/.env.example examples/.env

docker compose \
  --env-file examples/.env \
  -f examples/docker-compose.yml \
  up -d
```

Status:

```bash
docker compose \
  --env-file examples/.env \
  -f examples/docker-compose.yml \
  ps
```

Logs:

```bash
docker compose \
  --env-file examples/.env \
  -f examples/docker-compose.yml \
  logs --tail=200 zabbix-server

docker compose \
  --env-file examples/.env \
  -f examples/docker-compose.yml \
  logs --tail=200 zabbix-agent2
```

Stop:

```bash
docker compose \
  --env-file examples/.env \
  -f examples/docker-compose.yml \
  down
```

Remove data:

```bash
docker compose \
  --env-file examples/.env \
  -f examples/docker-compose.yml \
  down -v
```

## Kubernetes Checks

```bash
kubectl get pods -n monitoring
kubectl get deployments,daemonsets -n monitoring
kubectl get services -n monitoring
kubectl get events -n monitoring --sort-by=.lastTimestamp

kubectl describe pod <pod-name> -n monitoring
kubectl logs <pod-name> -n monitoring
kubectl logs <pod-name> -n monitoring --previous

helm status zabbix -n monitoring
helm get values zabbix -n monitoring
helm get manifest zabbix -n monitoring
```

## Useful Frontend Locations

```text
Monitoring → Problems
Monitoring → Latest data
Monitoring → Hosts

Data collection → Hosts
Data collection → Templates
Data collection → Maintenance

Alerts → Actions
Alerts → Media types

Users → User groups
Users → User roles
Users → Authentication
Users → API tokens

Administration → Proxies
Administration → Queue
Reports → System information
Reports → Action log
Reports → Audit log
```

Menu names can differ between Zabbix versions.

## Troubleshooting Order

```text
1. Service state
2. DNS and routing
3. Firewall and ports
4. Hostname or proxy identity
5. Active/passive item type
6. TLS mode and credentials
7. Logs
8. Unsupported-item error
9. Queue delay
10. Database health
```
