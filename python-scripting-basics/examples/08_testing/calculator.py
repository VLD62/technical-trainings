"""Functions used to demonstrate unit testing."""

from __future__ import annotations


def add(left: float, right: float) -> float:
    return left + right


def parse_timeout(raw: str) -> float:
    """Parse a timeout between 0.1 and 60 seconds."""
    try:
        timeout = float(raw)
    except ValueError as exc:
        raise ValueError(f"timeout must be numeric: {raw!r}") from exc

    if not 0.1 <= timeout <= 60.0:
        raise ValueError("timeout must be between 0.1 and 60 seconds")
    return timeout
