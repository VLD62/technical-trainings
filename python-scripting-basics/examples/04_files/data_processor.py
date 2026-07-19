#!/usr/bin/env python3
"""Read CSV and JSON with validation."""

from __future__ import annotations

import csv
import json
from pathlib import Path
from typing import Any


def parse_boolean(raw: str) -> bool:
    normalized = raw.strip().lower()
    if normalized in {"true", "yes", "1"}:
        return True
    if normalized in {"false", "no", "0"}:
        return False
    raise ValueError(f"invalid Boolean value: {raw!r}")


def load_json(path: Path) -> dict[str, Any]:
    try:
        data = json.loads(path.read_text(encoding="utf-8"))
    except FileNotFoundError:
        raise FileNotFoundError(f"configuration file not found: {path}") from None
    except json.JSONDecodeError as exc:
        raise ValueError(f"invalid JSON in {path}: {exc}") from exc

    if not isinstance(data, dict):
        raise ValueError(f"expected a JSON object in {path}")
    return data


def load_users(path: Path) -> list[dict[str, object]]:
    users: list[dict[str, object]] = []
    try:
        with path.open(newline="", encoding="utf-8") as handle:
            reader = csv.DictReader(handle)
            required = {"username", "team", "active"}
            if not required.issubset(reader.fieldnames or []):
                raise ValueError(f"CSV must contain columns: {sorted(required)}")

            for number, row in enumerate(reader, start=2):
                username = (row.get("username") or "").strip()
                if not username:
                    raise ValueError(f"empty username on row {number}")
                users.append(
                    {
                        "username": username,
                        "team": (row.get("team") or "").strip(),
                        "active": parse_boolean(row.get("active") or ""),
                    }
                )
    except FileNotFoundError:
        raise FileNotFoundError(f"user file not found: {path}") from None
    return users


def main() -> int:
    directory = Path(__file__).resolve().parent
    config = load_json(directory / "config.json")
    users = load_users(directory / "users.csv")
    active = [user for user in users if bool(user["active"])]

    print(f"environment={config['environment']}")
    print(f"total_users={len(users)}")
    print(f"active_users={len(active)}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
