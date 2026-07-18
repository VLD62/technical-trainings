import random
import time

from flask import Flask, Response, jsonify, request
from prometheus_client import (
    CONTENT_TYPE_LATEST,
    Counter,
    Gauge,
    Histogram,
    generate_latest,
)

app = Flask(__name__)

REQUESTS = Counter(
    "sample_http_requests_total",
    "Total HTTP requests processed by the sample application.",
    ["method", "endpoint", "status"],
)

REQUEST_DURATION = Histogram(
    "sample_http_request_duration_seconds",
    "HTTP request duration in seconds.",
    ["method", "endpoint"],
    buckets=(0.01, 0.025, 0.05, 0.1, 0.25, 0.5, 1.0, 2.5, 5.0),
)

IN_PROGRESS = Gauge(
    "sample_http_requests_in_progress",
    "HTTP requests currently being processed.",
    ["method", "endpoint"],
)


def observe_request(endpoint: str, status: int, started_at: float) -> None:
    method = request.method
    REQUESTS.labels(method=method, endpoint=endpoint, status=str(status)).inc()
    REQUEST_DURATION.labels(method=method, endpoint=endpoint).observe(
        time.perf_counter() - started_at
    )


@app.get("/")
def index():
    endpoint = "/"
    started_at = time.perf_counter()
    with IN_PROGRESS.labels(method=request.method, endpoint=endpoint).track_inprogress():
        payload = {
            "application": "prometheus-grafana-training",
            "message": "Hello from the instrumented sample application.",
        }
        status = 200
        observe_request(endpoint, status, started_at)
        return jsonify(payload), status


@app.get("/slow")
def slow():
    endpoint = "/slow"
    started_at = time.perf_counter()
    with IN_PROGRESS.labels(method=request.method, endpoint=endpoint).track_inprogress():
        time.sleep(random.uniform(0.2, 1.2))
        status = 200
        observe_request(endpoint, status, started_at)
        return jsonify({"message": "Slow response completed."}), status


@app.get("/error")
def error():
    endpoint = "/error"
    started_at = time.perf_counter()
    with IN_PROGRESS.labels(method=request.method, endpoint=endpoint).track_inprogress():
        status = 500
        observe_request(endpoint, status, started_at)
        return jsonify({"message": "Synthetic training error."}), status


@app.get("/health")
def health():
    return jsonify({"status": "ok"}), 200


@app.get("/metrics")
def metrics():
    return Response(generate_latest(), mimetype=CONTENT_TYPE_LATEST)


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000)
