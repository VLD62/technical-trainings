# Instructor Guide

## Audience

The course is suitable for:

- Linux beginners with basic command-line exposure
- Junior system administrators
- DevOps and platform engineers filling knowledge gaps
- Candidates preparing for LPIC-1 version 5.0

## Suggested Delivery

Each technical session can be delivered in 90–150 minutes:

- 30–45 minutes of concepts
- 20–30 minutes of demonstration
- 40–60 minutes of guided practice
- 10–15 minutes of review questions

Exam review sessions can be longer and should mix objectives instead of teaching new material.

## Teaching Principles

- Demonstrate commands on at least Debian and RPM-family systems where relevant.
- Ask participants to predict output before execution.
- Show both successful and failed commands.
- Explain recovery and rollback, not only the happy path.
- Use objective weights to allocate practice time.
- Avoid presenting memorization as operational competence.

## Lab Facilitation

Before a lab:

1. Confirm snapshots exist.
2. State which commands need sudo.
3. Identify commands that can cause data loss.
4. Demonstrate the safe target device or test account.
5. Define the validation outcome.

During a lab:

- Ask participants to capture evidence.
- Encourage `man`, `--help`, and log inspection.
- Avoid fixing problems immediately; guide the diagnostic sequence.

After a lab:

- Compare approaches.
- Discuss distribution differences.
- Review cleanup steps.
- Connect tasks back to objective identifiers.

## Assessment

Use three forms of assessment:

- Knowledge: short objective-based questions
- Recognition: command output and configuration snippets
- Performance: practical tasks with validation criteria

Do not copy or claim to reproduce real examination questions.

## Maintenance

At least once per quarter or before a new cohort:

- Verify the official objective version
- Test every script on supported distributions
- Check links
- Replace deprecated commands while preserving objective awareness
- Review package names and service-unit names
