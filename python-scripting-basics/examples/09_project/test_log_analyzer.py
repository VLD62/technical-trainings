"""Unit tests for the final project."""

import unittest
from datetime import datetime

from log_analyzer import (
    JsonReportWriter,
    LogAnalyzer,
    LogEntry,
    LogParser,
    TextReportWriter,
)


class TestLogParser(unittest.TestCase):
    def test_parses_valid_line(self) -> None:
        entry = LogParser().parse_line(
            "2026-07-19T10:15:09 ERROR worker Job failed"
        )
        self.assertEqual(entry.level, "ERROR")
        self.assertEqual(entry.component, "worker")

    def test_counts_malformed_input(self) -> None:
        entries, malformed = LogParser().parse_lines(
            ["2026-07-19T10:15:00 INFO api Started", "invalid"]
        )
        self.assertEqual(len(entries), 1)
        self.assertEqual(malformed, 1)


class TestLogAnalyzer(unittest.TestCase):
    def setUp(self) -> None:
        self.entries = [
            LogEntry(datetime.fromisoformat("2026-07-19T10:15:00"), "INFO", "api", "Started"),
            LogEntry(datetime.fromisoformat("2026-07-19T10:15:09"), "ERROR", "worker", "Failed"),
            LogEntry(datetime.fromisoformat("2026-07-19T10:15:20"), "ERROR", "api", "Unavailable"),
        ]

    def test_aggregates_entries(self) -> None:
        summary = LogAnalyzer().analyze(self.entries, malformed_lines=2)
        self.assertEqual(summary.total_entries, 3)
        self.assertEqual(summary.by_level, {"ERROR": 2, "INFO": 1})
        self.assertEqual(summary.by_component, {"api": 2, "worker": 1})

    def test_filters_by_level(self) -> None:
        summary = LogAnalyzer().analyze(self.entries, level="ERROR")
        self.assertEqual(summary.total_entries, 2)


class TestWriters(unittest.TestCase):
    def test_writers_render_empty_summary(self) -> None:
        summary = LogAnalyzer().analyze([])
        self.assertIn("Total entries", TextReportWriter().render(summary))
        self.assertIn('"total_entries": 0', JsonReportWriter().render(summary))


if __name__ == "__main__":
    unittest.main()
