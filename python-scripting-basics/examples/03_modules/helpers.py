"""Reusable helper functions."""

from __future__ import annotations


def normalize_service_name(raw_name: str) -> str:
    """Normalize and validate a service name."""
    normalized = raw_name.strip().lower().replace(" ", "-")
    if not normalized:
        raise ValueError("service name must not be empty")
    return normalized


def calculate_success_rate(successful: int, total: int) -> float:
    """Return a percentage between zero and one hundred."""
    if total <= 0:
        raise ValueError("total must be greater than zero")
    if not 0 <= successful <= total:
        raise ValueError("successful must be between zero and total")
    return successful / total * 100
