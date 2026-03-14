# Bash Scripting

## Introduction

Bash scripting is the process of writing scripts using the Bash shell to automate tasks in Linux systems.

A Bash script is simply a file containing a sequence of Linux commands that are executed automatically.

System administrators, DevOps engineers, and cybersecurity professionals frequently use Bash scripts to automate repetitive tasks such as:

- system monitoring
- log analysis
- file management
- security auditing
- deployment processes

Because Bash has direct access to Linux commands, it is one of the most powerful automation tools available on Unix-based systems.

---

## Objective

The objective of these notes is to understand how Bash scripts work and how they can be used to automate tasks in Linux environments.

By the end of these notes you will understand:

- how Bash scripts are structured
- how to create and run scripts
- how to use variables
- how to automate Linux commands
- how scripts are used in system administration and cybersecurity

---

## Table of Contents

- [What is Bash](#what-is-bash)
- [What is a Script](#what-is-a-script)
- [Shebang](#shebang)
- [Running Scripts](#running-scripts)
- [Bash Variables](#bash-variables)
- [Command Substitution](#command-substitution)
- [Input and Output](#input-and-output)
- [Conditionals](#conditionals)
- [Loops](#loops)
- [Automation Patterns](#automation-patterns)
- [Conclusion](#conclusion)

---

# What is Bash

Bash stands for **Bourne Again Shell**.

It is a command-line interpreter that allows users to interact with the Linux operating system by executing commands.

When you type commands such as:

```
ls
pwd
cd
```

you are interacting with the Bash shell.

Bash reads commands, interprets them, and instructs the operating system to execute them.

Bash is also capable of running scripts, which allows multiple commands to be executed automatically.

---

# What is a Script

A script is a file that contains multiple commands that can be executed automatically.

Example Bash script:

```
#!/bin/bash

echo "Hello"
pwd
date
```

When this script runs, the system will execute the commands in sequence.

Output example:

```
Hello
/home/ace
Wed Mar 12 12:22:01
```

Scripts allow administrators to automate repetitive tasks instead of running commands manually.

---

# Shebang

The first line of most scripts is called the **shebang**.

```
#!/bin/bash
```

This line tells the operating system which interpreter should execute the script.

In this case, the script will be executed using the Bash shell located at:

```
/bin/bash
```

Without the shebang, the system may not know how to run the script.

Different languages use different interpreters:

Example:

```
#!/usr/bin/python3
#!/usr/bin/perl
#!/bin/bash
```

---

# Running Scripts

Before running a script, it must have **execute permission**.

Example script:

```
#!/bin/bash
echo "Hello from Bash"
```

Give the script execute permission:

```
chmod +x script.sh
```

Run the script:

```
./script.sh
```

Explanation:

| Command | Purpose |
|-------|--------|
| `chmod +x` | allows the script to be executed |
| `./script.sh` | runs the script in the current directory |

---

# Bash Variables

Variables allow scripts to store data that can be reused later.

Example:

```
name="Ace"
echo "Hello $name"
```

Output:

```
Hello Ace
```

Explanation:

| Component | Meaning |
|----------|--------|
| `name="Ace"` | assigns value to a variable |
| `$name` | retrieves the variable value |

Important rule:

There must be **no spaces** around `=`.

Correct:

```
name="Ace"
```

Incorrect:

```
name = "Ace"
```

---

# Command Substitution

Command substitution allows the output of a command to be stored in a variable.

Example:

```
current_user=$(whoami)

echo "User: $current_user"
```

Explanation:

| Component | Meaning |
|----------|--------|
| `$(command)` | runs the command |
| `$(whoami)` | stores the current username |

Example script:

```
#!/bin/bash

USER=$(whoami)
DATE=$(date)

echo "User: $USER"
echo "Date: $DATE"
```

---

# Input and Output

Scripts can display information or accept user input.

## Output

The `echo` command prints text to the terminal.

Example:

```
echo "System Report"
```

Example with commands:

```
echo "Disk usage:"
df -h
```

---

## Reading User Input

The `read` command allows scripts to accept user input.

Example:

```
echo "Enter your name:"
read name

echo "Hello $name"
```

Example interaction:

```
Enter your name:
Ace
Hello Ace
```

---

# Conditionals

Conditionals allow scripts to make decisions.

Basic structure:

```
if [ condition ]
then
    command
fi
```

Example:

```
#!/bin/bash

USER=$(whoami)

if [ "$USER" = "root" ]
then
    echo "Running as root"
fi
```

Explanation:

| Keyword | Purpose |
|------|------|
| `if` | starts the condition |
| `then` | commands to run if condition is true |
| `fi` | ends the conditional block |

---

# Loops

Loops allow commands to repeat multiple times.

## For Loop

Example:

```
for file in *.md
do
    echo $file
done
```

Explanation:

| Component | Meaning |
|---------|--------|
| `for` | start loop |
| `*.md` | iterate through markdown files |
| `do` | commands executed |
| `done` | end loop |

---

## While Loop

Example:

```
count=1

while [ $count -le 5 ]
do
    echo $count
    ((count++))
done
```

Output:

```
1
2
3
4
5
```

---

# Automation Patterns

Bash scripts are commonly used to automate tasks by combining Linux commands.

Example automation script:

```
#!/bin/bash

echo "SYSTEM REPORT"

echo "User:"
whoami

echo "Current directory:"
pwd

echo "Date:"
date

echo "Disk usage:"
df -h

echo "Processes:"
ps aux | head
```

This script automatically collects system information without requiring manual commands.

Common automation uses include:

- system monitoring
- security auditing
- log inspection
- file management
- deployment automation

Many security tools are built using Bash scripts.

---

# Conclusion

Bash scripting is a powerful method for automating tasks in Linux environments.

Instead of manually running commands repeatedly, administrators and engineers can create scripts that execute commands automatically in a structured and repeatable manner.

In these notes we explored the fundamental concepts of Bash scripting, including:

- the role of Bash as a command interpreter
- the structure of Bash scripts
- the purpose of the shebang
- how scripts execute Linux commands
- how automation can simplify system administration tasks

Bash scripting is widely used in system administration, DevOps workflows, and cybersecurity operations. Many security tools and auditing utilities are built using Bash scripts to automate system checks, log analysis, and vulnerability discovery.

Learning Bash scripting allows engineers to transform manual command-line tasks into reusable automation tools, improving efficiency and consistency in managing Linux systems.
