#!/usr/bin/env python3
"""Backend service for the Docker Compose training example."""

from __future__ import annotations

import json
import os
import socket
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer


class Handler(BaseHTTPRequestHandler):
    def do_GET(self) -> None:  # noqa: N802
        body = (
            json.dumps(
                {
                    "service": "app",
                    "message": os.getenv("TRAINING_MESSAGE", "hello"),
                    "hostname": socket.gethostname(),
                },
                indent=2,
            )
            + "\n"
        ).encode("utf-8")

        self.send_response(200)
        self.send_header("Content-Type", "application/json")
        self.send_header("Content-Length", str(len(body)))
        self.end_headers()
        self.wfile.write(body)

    def log_message(self, format: str, *args: object) -> None:
        print(f"client={self.client_address[0]} message={format % args}", flush=True)


def main() -> None:
    port = int(os.getenv("PORT", "8000"))
    server = ThreadingHTTPServer(("0.0.0.0", port), Handler)
    print(f"app listening on port {port}", flush=True)
    server.serve_forever()


if __name__ == "__main__":
    main()
