---
marp: true
theme: default
paginate: true
---

# Processes, Jobs, and Priorities

### LPIC-1 objectives 103.5 and 103.6

**Presenter:** Vladislav Iliev

**Audience:** Linux learners, system administrators, DevOps engineers, and certification candidates

---

## Processes and Threads

- A process has an identifier, parent, credentials, environment, resources, and state.
- Threads share process resources while having independent execution contexts.
- The kernel schedules runnable tasks.

---

## Process Inspection

- `ps` provides snapshots.
- `top` provides an interactive live view.
- `pgrep` and `pkill` select by attributes.
- `free` and `uptime` provide memory and load context.

---

## Job Control

- Append `&` to start a background job.
- Use `jobs`, `fg`, and `bg` within the same shell session.
- `Ctrl+Z` stops a foreground job.
- `nohup`, `screen`, or `tmux` help work survive disconnects.

---

## Signals

- SIGTERM requests graceful termination.
- SIGKILL cannot be caught and should be a last resort.
- SIGHUP commonly indicates terminal disconnect or configuration reload.
- Use `kill -l` to list signals.

---

## Process States

- Running or runnable tasks compete for CPU.
- Sleeping tasks wait for events.
- Stopped tasks await continuation.
- Zombie processes have exited but await parent collection.

---

## Nice Values

- Nice values influence CPU scheduling priority.
- A higher nice value means lower priority.
- `nice` starts a command with an adjusted value.
- `renice` changes an existing process, subject to permissions.

---

## Troubleshooting Sequence

- Identify the process and owner.
- Observe CPU, memory, I/O, state, and elapsed time.
- Check logs and open files.
- Send the least disruptive signal first.

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
