#!/usr/bin/env python3
"""Use functions imported from another module."""

from __future__ import annotations

from helpers import calculate_success_rate, normalize_service_name


def main() -> int:
    service = normalize_service_name(" Orders API ")
    success_rate = calculate_success_rate(successful=97, total=100)
    print(f"service={service}")
    print(f"success_rate={success_rate:.1f}%")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
