#!/usr/bin/env python3
"""Demonstrate collections and control flow."""

from __future__ import annotations

from collections import Counter

SERVERS = [
    {"name": "web-01", "environment": "prod", "cpu": 4, "active": True},
    {"name": "web-02", "environment": "prod", "cpu": 8, "active": True},
    {"name": "test-01", "environment": "test", "cpu": 2, "active": False},
    {"name": "build-01", "environment": "dev", "cpu": 4, "active": True},
]


def summarize(servers: list[dict[str, object]]) -> dict[str, object]:
    names = [str(server["name"]) for server in servers]
    counts = Counter(names)

    return {
        "total_servers": len(servers),
        "total_cpu": sum(int(server["cpu"]) for server in servers),
        "by_environment": dict(
            sorted(Counter(str(s["environment"]) for s in servers).items())
        ),
        "active_servers": sorted(
            str(server["name"]) for server in servers if bool(server["active"])
        ),
        "inactive_servers": sorted(
            str(server["name"]) for server in servers if not bool(server["active"])
        ),
        "duplicate_names": sorted(name for name, count in counts.items() if count > 1),
    }


def main() -> int:
    for key, value in summarize(SERVERS).items():
        print(f"{key}: {value}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
