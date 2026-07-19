#!/usr/bin/env python3
"""Object-oriented command-line log analyzer."""

from __future__ import annotations

import argparse
import json
import logging
from abc import ABC, abstractmethod
from collections import Counter
from dataclasses import asdict, dataclass
from datetime import datetime
from pathlib import Path
from typing import Iterable, Sequence


@dataclass(frozen=True)
class LogEntry:
    timestamp: datetime
    level: str
    component: str
    message: str


@dataclass(frozen=True)
class AnalysisSummary:
    total_entries: int
    malformed_lines: int
    by_level: dict[str, int]
    by_component: dict[str, int]
    first_timestamp: datetime | None
    last_timestamp: datetime | None


class LogParser:
    valid_levels = {"DEBUG", "INFO", "WARNING", "ERROR", "CRITICAL"}

    def parse_line(self, line: str) -> LogEntry:
        parts = line.strip().split(maxsplit=3)
        if len(parts) != 4:
            raise ValueError("expected timestamp, level, component, and message")

        raw_timestamp, raw_level, component, message = parts
        try:
            timestamp = datetime.fromisoformat(raw_timestamp)
        except ValueError as exc:
            raise ValueError(f"invalid timestamp: {raw_timestamp}") from exc

        level = raw_level.upper()
        if level not in self.valid_levels:
            raise ValueError(f"unsupported log level: {raw_level}")

        return LogEntry(timestamp, level, component, message)

    def parse_lines(self, lines: Iterable[str]) -> tuple[list[LogEntry], int]:
        entries: list[LogEntry] = []
        malformed = 0

        for number, line in enumerate(lines, start=1):
            if not line.strip():
                continue
            try:
                entries.append(self.parse_line(line))
            except ValueError as exc:
                malformed += 1
                logging.warning("Skipping line %d: %s", number, exc)
        return entries, malformed


class LogAnalyzer:
    def analyze(
        self,
        entries: Iterable[LogEntry],
        *,
        level: str | None = None,
        malformed_lines: int = 0,
    ) -> AnalysisSummary:
        normalized = level.upper() if level else None
        selected = [
            entry for entry in entries
            if normalized is None or entry.level == normalized
        ]
        timestamps = [entry.timestamp for entry in selected]

        return AnalysisSummary(
            total_entries=len(selected),
            malformed_lines=malformed_lines,
            by_level=dict(sorted(Counter(e.level for e in selected).items())),
            by_component=dict(sorted(Counter(e.component for e in selected).items())),
            first_timestamp=min(timestamps) if timestamps else None,
            last_timestamp=max(timestamps) if timestamps else None,
        )


class ReportWriter(ABC):
    @abstractmethod
    def render(self, summary: AnalysisSummary) -> str:
        raise NotImplementedError


class TextReportWriter(ReportWriter):
    def render(self, summary: AnalysisSummary) -> str:
        return "\n".join(
            [
                "Log Analysis Report",
                "===================",
                f"Total entries:   {summary.total_entries}",
                f"Malformed lines: {summary.malformed_lines}",
                f"First timestamp: {summary.first_timestamp or '-'}",
                f"Last timestamp:  {summary.last_timestamp or '-'}",
                f"By level:        {summary.by_level}",
                f"By component:    {summary.by_component}",
            ]
        )


class JsonReportWriter(ReportWriter):
    def render(self, summary: AnalysisSummary) -> str:
        payload = asdict(summary)
        payload["first_timestamp"] = (
            summary.first_timestamp.isoformat() if summary.first_timestamp else None
        )
        payload["last_timestamp"] = (
            summary.last_timestamp.isoformat() if summary.last_timestamp else None
        )
        return json.dumps(payload, indent=2, sort_keys=True)


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description="Analyze structured application logs.")
    parser.add_argument("source", type=Path)
    parser.add_argument("--level", choices=sorted(LogParser.valid_levels))
    parser.add_argument("--format", choices=("text", "json"), default="text")
    parser.add_argument("--output", type=Path)
    parser.add_argument("--verbose", action="store_true")
    return parser


def select_writer(report_format: str) -> ReportWriter:
    return JsonReportWriter() if report_format == "json" else TextReportWriter()


def main(argv: Sequence[str] | None = None) -> int:
    args = build_parser().parse_args(argv)
    logging.basicConfig(
        level=logging.DEBUG if args.verbose else logging.INFO,
        format="%(levelname)s %(message)s",
    )

    if not args.source.is_file():
        logging.error("Log file not found: %s", args.source)
        return 1

    try:
        lines = args.source.read_text(encoding="utf-8").splitlines()
    except OSError as exc:
        logging.error("Could not read %s: %s", args.source, exc)
        return 1

    entries, malformed = LogParser().parse_lines(lines)
    summary = LogAnalyzer().analyze(
        entries,
        level=args.level,
        malformed_lines=malformed,
    )
    report = select_writer(args.format).render(summary)

    if args.output:
        try:
            args.output.write_text(f"{report}\n", encoding="utf-8")
        except OSError as exc:
            logging.error("Could not write %s: %s", args.output, exc)
            return 1
    else:
        print(report)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
