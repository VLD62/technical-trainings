# Troubleshooting

## Containers Do Not Start

```bash
docker compose -f lab/docker-compose.yml --env-file .env ps
docker compose -f lab/docker-compose.yml --env-file .env logs --tail=200
```

Check:

- Docker is running.
- Ports `1433` and `1521` are free.
- Passwords meet product requirements.
- The host has enough memory and disk space.
- The host architecture is compatible with the selected images.

## SQL Server Password Error

The SQL Server password must satisfy the default password policy. Use at least eight characters and a mixture of character classes. The example is only for local training and should be replaced.

## SQL Server sqlcmd Encryption Error

Recent `sqlcmd` versions use secure defaults. The Makefile uses `-C` for the local self-signed training connection. For external environments, follow the organization's certificate and encryption policy instead of blindly trusting certificates.

## Oracle Is Still Initializing

Oracle may take longer on the first start. Check:

```bash
docker compose -f lab/docker-compose.yml --env-file .env logs -f oracle
```

Wait for the database-ready message and healthy status.

## Oracle Schema Is Missing

Initialization scripts run only when the Oracle data volume is first created. Recreate the local lab:

```bash
make reset
```

This deletes the local training data.

## SQL Server Objects Are Missing

The SQL Server setup script is repeatable. Run:

```bash
make init-mssql
make verify
```

## Port Conflict

Find listeners:

```bash
ss -ltnp | grep -E ':(1433|1521)\b'
```

Stop the conflicting local service or change the host-side port in `lab/docker-compose.yml` and update client connection details.

## Permission Denied on Oracle Init Script

Ensure the script is executable:

```bash
chmod +x lab/oracle/init/01_initialize_training_schema.sh
```

## Clean Recovery

```bash
make clean
make up
make verify
```

This removes all local training volumes and recreates the environment.
