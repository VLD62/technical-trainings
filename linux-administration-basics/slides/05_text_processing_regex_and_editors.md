---
marp: true
theme: default
paginate: true
---

# Text Processing, Regex, and Editors

### LPIC-1 objectives 103.2, 103.4, 103.7, and 103.8

**Presenter:** Vladislav Iliev

**Audience:** Linux learners, system administrators, DevOps engineers, and certification candidates

---

## Unix Text Philosophy

- Many tools read standard input and write standard output.
- Small filters can be combined into powerful pipelines.
- Predictable text output makes automation easier.

---

## Core Filters

- `cat`, `head`, `tail`, `less`, `wc`, and `nl` inspect text.
- `cut`, `paste`, `tr`, `sort`, and `uniq` transform fields and lines.
- `split` divides files.
- Checksum tools verify integrity, not confidentiality.

---

## Streams and Redirection

- File descriptor 0 is stdin, 1 is stdout, and 2 is stderr.
- `>` truncates, `>>` appends, and `<` redirects input.
- `2>` redirects errors; `2>&1` duplicates a descriptor.
- `tee` writes both to stdout and a file.

---

## Pipes and xargs

- A pipeline passes stdout to the next command as stdin.
- Pipeline exit behavior depends on shell settings such as `pipefail`.
- `xargs` builds command arguments from input.
- Use null-delimited input for filenames.

---

## Regular Expressions

- Anchors include `^` and `$`.
- Character classes match sets or ranges.
- Basic and extended regex differ in escaping of some operators.
- Use `grep -E` for extended regular expressions.

---

## sed Essentials

- Use substitutions such as `s/old/new/g`.
- Select lines by number or pattern.
- Preview before using in-place editing.
- Regex behavior and shell quoting interact.

---

## vi Essentials

- Normal mode is for navigation and commands.
- Insert mode enters text.
- Command-line mode handles save, quit, search, and settings.
- Practice `h j k l`, `i a o`, `dd yy p`, `/`, `:w`, and `:q!`.

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
