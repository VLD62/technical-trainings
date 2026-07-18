---
marp: true
theme: default
paginate: true
---

# Command Line and File Management

### LPIC-1 objectives 103.1 and 103.3

**Presenter:** Vladislav Iliev

**Audience:** Linux learners, system administrators, DevOps engineers, and certification candidates

---

## Shell Fundamentals

- The shell parses commands, expansions, quoting, redirection, and pipelines.
- Use `type`, `command -v`, and `which` to understand command resolution.
- Use `man`, `info`, and `--help` efficiently.

---

## Quoting and Expansion

- Single quotes preserve text literally.
- Double quotes allow selected expansions.
- Command substitution uses `$(command)`.
- Globbing expands filename patterns before the command runs.

---

## Navigation and Inspection

- `pwd`, `cd`, and `ls` are foundational.
- `file` identifies content type.
- `stat` shows metadata.
- Hidden files begin with a dot but are otherwise normal directory entries.

---

## File Operations

- Use `cp`, `mv`, `rm`, `mkdir`, `rmdir`, and `touch`.
- Use recursive options deliberately.
- Prefer interactive or no-clobber options while learning.
- Understand that removing an open file may not immediately release disk space.

---

## Finding Files

- `find` searches live filesystem metadata.
- `locate` searches a periodically updated database.
- Combine predicates carefully with `-a`, `-o`, parentheses, and actions.
- Use `-print0` with `xargs -0` for unusual filenames.

---

## Archives and Compression

- `tar` groups files into an archive.
- `gzip`, `bzip2`, and `xz` compress streams with different tradeoffs.
- `cpio` and `dd` are objective-relevant tools with powerful low-level behavior.
- Always verify source and destination before using `dd`.

---

## Command History

- Use `history`, reverse search, and history expansion carefully.
- Avoid placing secrets directly on the command line.
- Know that shell history behavior is configurable.

---

## Practice

- Run the commands in a disposable lab.
- Capture expected and unexpected output.
- Explain what changed and how to reverse it.
- Complete the matching lab and checklist items.

---

## Key Takeaways

- Understand the concept before memorizing options.
- Know the important commands, files, and failure modes.
- Prefer safe, observable, reversible practice.
- Review the official LPIC-1 objectives as the source of truth.
