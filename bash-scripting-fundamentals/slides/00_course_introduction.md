---
marp: true
paginate: true
---

# Bash Scripting: Fundamentals

Safe, readable, and reusable automation with GNU Bash

---

## Why Bash?

- Available on most Linux systems
- Excellent for connecting existing command-line tools
- Useful for operations, CI/CD, administration, and developer workflows
- Fast to create and easy to deploy
- Powerful enough to become dangerous when input and errors are ignored

---

## Bash Is a Good Fit When

- The task is mostly command orchestration
- Data is line-oriented or file-oriented
- Startup time and minimal dependencies matter
- The script remains reasonably small and understandable
- The target environment already provides Bash and required tools

---

## Consider Another Language When

- Complex data structures dominate the solution
- Extensive API or JSON processing is required
- Concurrency, performance, or portability is central
- The script grows into a large application
- Strong typing and rich testing libraries would reduce risk

---

## Learning Path

1. Execution and shell foundations
2. Variables, arguments, quoting, and expansion
3. Conditions and options
4. Loops, arrays, and functions
5. Streams, files, and text processing
6. Reliability, debugging, and testing
7. Secure automation and final project

---

## Final Project

Build a system health and inventory report that:

- Accepts command-line options
- Collects host, filesystem, memory, and process information
- Uses functions and structured logging
- Handles missing commands and invalid paths
- Writes atomically to a requested output file
- Returns predictable exit codes

---

## Core Principle

> A successful Bash script is not only one that works once. It is one that behaves predictably when inputs, files, commands, and environments are different from what the author expected.
