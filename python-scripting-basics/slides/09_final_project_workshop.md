# Session 9: Final Project Workshop

## Learning Topics

- Build an object-oriented command-line log analyzer
- Separate parsing, analysis, report formatting, and CLI responsibilities
- Support level filtering and text or JSON reports
- Count malformed input without hiding it
- Complete the project with tests, logging, validation, and explicit exit codes

## Example

```text
CLI -> LogParser -> LogEntry objects -> LogAnalyzer -> ReportWriter
```

## Review

- What responsibility is being introduced?
- Which errors should be visible to the caller?
- How can the code remain easy to test?
