#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$ROOT_DIR"

if ! command -v docker >/dev/null 2>&1; then
    echo "ERROR: docker is not installed or not in PATH." >&2
    exit 1
fi

if ! docker compose version >/dev/null 2>&1; then
    echo "ERROR: Docker Compose is not available." >&2
    exit 1
fi

if [[ ! -f .env ]]; then
    cp .env.example .env
fi

# shellcheck disable=SC1091
set -a
source .env
set +a

PROMETHEUS_VERSION="${PROMETHEUS_VERSION:-v3.13.0}"

echo "Validating Docker Compose configuration..."
docker compose --env-file .env -f lab/docker-compose.yml config >/dev/null

echo "Validating Prometheus configuration and alert rules..."
docker run --rm \
    --entrypoint /bin/promtool \
    -v "$ROOT_DIR/lab/prometheus:/etc/prometheus:ro" \
    "prom/prometheus:${PROMETHEUS_VERSION}" \
    check config /etc/prometheus/prometheus.yml

echo "Validating Grafana dashboard JSON..."
python3 -m json.tool \
    lab/grafana/dashboards/linux-host-overview.json \
    >/dev/null

echo "Validation completed successfully."
