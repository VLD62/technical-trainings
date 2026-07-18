# Lab 6 – Process and Job Management

## Objectives

- Start and control foreground and background jobs
- Inspect processes and states
- Send signals safely
- Change nice values
- Use a terminal multiplexer or `nohup`

## Tasks

### 1. Start background jobs

```bash
sleep 600 &
JOB_PID=$!
echo "$JOB_PID"
jobs -l
ps -o pid,ppid,user,stat,ni,etime,cmd -p "$JOB_PID"
```

Bring it to foreground with `fg`, stop it with `Ctrl+Z`, continue it with `bg`, then return it to the background.

### 2. Inspect and select

```bash
pgrep -a sleep
ps -eo pid,ppid,user,stat,ni,%cpu,%mem,comm --sort=-%cpu | head
free -h
uptime
```

### 3. Send signals

```bash
kill -TERM "$JOB_PID"
wait "$JOB_PID" 2>/dev/null || true
```

Start another `sleep` process and test `SIGSTOP` and `SIGCONT`. Observe the process state.

### 4. Nice values

```bash
nice -n 10 sh -c 'sleep 300' &
NICE_PID=$!
ps -o pid,ni,cmd -p "$NICE_PID"
renice 15 -p "$NICE_PID"
ps -o pid,ni,cmd -p "$NICE_PID"
kill "$NICE_PID"
```

Explain why lowering the nice value may require additional privilege.

### 5. Surviving logout

```bash
nohup sh -c 'sleep 5; date' > /tmp/lpic-nohup.log 2>&1 &
disown 2>/dev/null || true
```

Optional:

```bash
tmux new -s lpic
```

Detach and reattach to the session.

### 6. Zombie observation

Read about zombie processes with `man ps` and identify the state code. Do not deploy intentionally broken long-running code on a shared system.

## Validation

- You can distinguish shell jobs from system processes.
- You can send TERM before KILL.
- You can explain stopped and zombie states.
- You can start a lower-priority process and verify its nice value.
