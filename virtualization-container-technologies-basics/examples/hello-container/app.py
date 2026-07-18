#!/usr/bin/env python3
"""Minimal HTTP service for the container training lab."""

from __future__ import annotations

import json
import os
import socket
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer


class Handler(BaseHTTPRequestHandler):
    def do_GET(self) -> None:  # noqa: N802 - required by BaseHTTPRequestHandler
        payload = {
            "message": os.getenv("TRAINING_MESSAGE", "hello from the training container"),
            "hostname": socket.gethostname(),
            "pid": os.getpid(),
        }
        body = (json.dumps(payload, indent=2) + "\n").encode("utf-8")

        self.send_response(200)
        self.send_header("Content-Type", "application/json")
        self.send_header("Content-Length", str(len(body)))
        self.end_headers()
        self.wfile.write(body)

    def log_message(self, format: str, *args: object) -> None:
        print(f"client={self.client_address[0]} message={format % args}", flush=True)


def main() -> None:
    host = "0.0.0.0"
    port = int(os.getenv("PORT", "8080"))
    server = ThreadingHTTPServer((host, port), Handler)
    print(f"listening on http://{host}:{port}", flush=True)
    server.serve_forever()


if __name__ == "__main__":
    main()
