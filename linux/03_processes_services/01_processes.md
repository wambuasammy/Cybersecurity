# Linux Processes

## Introduction

A **process** is a running instance of a program in a Linux system. Every command, application, or service that runs on the system operates as a process.

Processes consume system resources such as CPU time, memory, and input/output operations. Linux provides tools that allow administrators to monitor, control, and terminate processes when necessary.

Understanding process management is essential for system administration, troubleshooting, and cybersecurity, because suspicious activity on a system often appears as abnormal or unexpected processes.

---

## Objective

The objective of these notes is to understand how Linux manages processes and how administrators can monitor and control them.

By the end of these notes, you will understand how to:

- view running processes
- monitor system activity
- terminate processes
- control background jobs
- modify process priority

---

## Table of Contents

- [What is a Process](#what-is-a-process)
- [Process Identification](#process-identification)
- [Viewing Processes with ps](#viewing-processes-with-ps)
- [Real-Time Monitoring with top](#real-time-monitoring-with-top)
- [Advanced Monitoring with htop](#advanced-monitoring-with-htop)
- [Terminating Processes](#terminating-processes)
- [Job Control](#job-control)
- [Process Priority](#process-priority)
- [Conclusion](#conclusion)

---

# What is a Process

A **process** is a program currently being executed by the operating system.

Examples of processes include:

- a terminal session
- a web browser
- system services
- background scripts

Linux is a **multitasking operating system**, meaning it can run many processes simultaneously.

Each process is assigned a unique identifier called a **Process ID (PID)**.

---

# Process Identification

Every process running on a Linux system has a **Process ID (PID)**.

Example:

```
PID 54858 → sleep 600
```

Important attributes of processes include:

| Attribute | Description |
|---|---|
PID | Unique process identifier |
PPID | Parent process ID |
USER | Owner of the process |
CPU | CPU usage |
MEM | Memory usage |
STAT | Process state |

These attributes help administrators understand how a process behaves.

---

# Viewing Processes with ps

The `ps` command displays information about running processes.

Basic example:

```
ps aux
```

Example output:

```
USER   PID  %CPU %MEM COMMAND
ace   54858 0.0  0.0 sleep 600
```

Explanation:

| Option | Meaning |
|---|---|
a | show processes from all users |
u | display user-oriented format |
x | include processes without a terminal |

Filtering processes:

```
ps aux | grep sleep
```

This command shows processes that match the keyword **sleep**.

---

# Real-Time Monitoring with top

The `top` command displays running processes in real time.

```
top
```

The interface continuously updates and displays:

- CPU usage
- memory usage
- system load
- running tasks
- active processes

This allows administrators to quickly identify processes consuming excessive resources.

Exit the program by pressing:

```
q
```

---

# Advanced Monitoring with htop

`htop` is an improved version of the `top` command with a more user-friendly interface.

Run:

```
htop
```

Features of `htop` include:

- colored output
- interactive navigation
- CPU usage per core
- process tree view
- process management from within the interface

Common controls:

| Key | Function |
|---|---|
F3 | Search process |
F5 | Tree view |
F9 | Kill process |
F10 | Exit |

---

# Terminating Processes

Processes can be terminated using several commands.

## kill

Terminates a process using its PID.

Example:

```
kill 54858
```

This sends a **SIGTERM signal** to the process.

---

## killall

Terminates processes by their name.

Example:

```
killall sleep
```

This command stops all running processes named **sleep**.

---

## pkill

Terminates processes using pattern matching.

Example:

```
pkill sleep
```

Unlike `killall`, `pkill` allows filtering by:

- user
- terminal
- process pattern

---

# Job Control

Linux allows processes to run in the **foreground** or **background**.

## Background process

Example:

```
sleep 600 &
```

The `&` symbol runs the process in the background.

---

## jobs

Lists background jobs started from the current shell.

```
jobs
```

Example output:

```
[1]+ Running sleep 600 &
```

---

## bg

Resumes a suspended process in the background.

Example:

```
bg
```

---

## fg

Brings a background process to the foreground.

Example:

```
fg
```

---

# Process Priority

Linux schedules CPU usage using **niceness values**.

Range:

```
-20 (highest priority)
19 (lowest priority)
```

---

## nice

Starts a process with a specified priority.

Example:

```
nice -n 10 sleep 600 &
```

This runs the process with lower priority.

---

## renice

Changes the priority of a running process.

Example:

```
renice 5 -p 54858
```

This modifies the priority of an existing process.

---

# Conclusion

Linux process management is an essential skill for system administrators and cybersecurity professionals.

In these notes we explored how to:

- view running processes
- monitor system performance
- terminate processes
- control foreground and background jobs
- adjust process priority

Understanding how processes work allows administrators to troubleshoot system issues, monitor system health, and detect suspicious activity within a Linux environment.