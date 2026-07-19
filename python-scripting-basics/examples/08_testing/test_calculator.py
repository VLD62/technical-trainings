"""Unit tests for calculator functions."""

import unittest

from calculator import add, parse_timeout


class TestAdd(unittest.TestCase):
    def test_adds_two_numbers(self) -> None:
        self.assertEqual(add(2, 3), 5)


class TestParseTimeout(unittest.TestCase):
    def test_accepts_valid_values(self) -> None:
        for raw, expected in (("0.1", 0.1), ("5", 5.0), ("2.5", 2.5), ("60", 60.0)):
            with self.subTest(raw=raw):
                self.assertEqual(parse_timeout(raw), expected)

    def test_rejects_invalid_values(self) -> None:
        for raw in ("", "fast", "0", "60.1"):
            with self.subTest(raw=raw):
                with self.assertRaises(ValueError):
                    parse_timeout(raw)


if __name__ == "__main__":
    unittest.main()
