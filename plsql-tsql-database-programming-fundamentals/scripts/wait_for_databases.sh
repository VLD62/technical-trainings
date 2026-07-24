#!/usr/bin/env bash
set -euo pipefail

if [[ ! -f .env ]]; then
  echo "Missing .env. Run: make config" >&2
  exit 1
fi

compose=(docker compose -f lab/docker-compose.yml --env-file .env)
services=(oracle sqlserver)
max_attempts=90
sleep_seconds=5

for service in "${services[@]}"; do
  echo "Waiting for ${service}..."
  for ((attempt = 1; attempt <= max_attempts; attempt++)); do
    container_id="$("${compose[@]}" ps -q "$service")"
    if [[ -z "$container_id" ]]; then
      echo "Container for ${service} is not running." >&2
      exit 1
    fi

    status="$(docker inspect --format '{{if .State.Health}}{{.State.Health.Status}}{{else}}{{.State.Status}}{{end}}' "$container_id")"
    if [[ "$status" == "healthy" ]]; then
      echo "${service} is healthy."
      break
    fi

    if [[ "$status" == "unhealthy" || "$status" == "exited" ]]; then
      echo "${service} entered state: ${status}" >&2
      "${compose[@]}" logs --tail=100 "$service" >&2
      exit 1
    fi

    if (( attempt == max_attempts )); then
      echo "Timed out waiting for ${service}." >&2
      "${compose[@]}" logs --tail=100 "$service" >&2
      exit 1
    fi

    sleep "$sleep_seconds"
  done
done
