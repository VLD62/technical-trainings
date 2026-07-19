# Quiz 01 - Bash Fundamentals

## Questions

1. What is the difference between a terminal and a shell?
2. What does a shebang control?
3. What exit status convention represents success?
4. Why is `"$@"` normally preferred when forwarding arguments?
5. What can happen when `$file` is expanded without quotes?
6. When is `[[ ... ]]` useful compared with `[ ... ]` in a Bash-specific script?
7. What is the difference between function output and function return status?
8. Why should `while IFS= read -r line` be preferred for reading arbitrary text lines?
9. What does `set -o pipefail` change?
10. Why is `mktemp` safer than a predictable temporary filename?
11. What is the purpose of `trap cleanup EXIT`?
12. What does `bash -n` validate?
13. What kinds of problems can ShellCheck detect?
14. Why should diagnostics normally go to stderr?
15. What is idempotency in an automation script?

## Answers

<details>
<summary>Show answers</summary>

1. A terminal provides the text interface; a shell interprets commands and starts programs.
2. It selects the interpreter used for direct execution.
3. Status 0.
4. It preserves every original argument as a separate word, including empty arguments and spaces.
5. Word splitting and pathname expansion may change one value into multiple arguments or filenames.
6. It provides safer Bash string and pattern behavior and supports combined expressions without several legacy parsing problems.
7. Output communicates data; return status communicates success, failure, or a condition.
8. It preserves whitespace and backslashes instead of modifying the input.
9. A pipeline can report a failure from an earlier command rather than only the final command's status.
10. It creates a unique file or directory securely and reduces race and collision risks.
11. It runs cleanup when the shell exits, including many failure paths.
12. Bash syntax parsing, not runtime logic or external command availability.
13. Quoting errors, unsafe expansions, portability issues, suspicious conditions, and many common shell mistakes.
14. It keeps requested data on stdout clean for redirection and pipelines.
15. Repeated execution reaches the intended state without unintended additional changes.

</details>
