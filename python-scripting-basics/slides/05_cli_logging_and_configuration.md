# Session 5: CLI, Logging, and Configuration

## Learning Topics

- Building discoverable command-line interfaces with `argparse`
- Positional arguments, options, flags, validation, and help text
- Using logging for diagnostics and `print()` for intentional output
- Configuration precedence: CLI, environment, file, default
- Safe automation through dry-run behavior and meaningful exit codes

## Example

```python
parser.add_argument("--verbose", action="store_true")
parser.add_argument("--output", type=Path)
```

## Review

- What responsibility is being introduced?
- Which errors should be visible to the caller?
- How can the code remain easy to test?
