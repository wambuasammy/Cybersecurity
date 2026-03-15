# Lab 5 — Linux Automation with Bash (System Enumeration Tool)

## Introduction

In Linux administration and cybersecurity operations, many tasks require repeatedly executing multiple system commands to inspect the state of a machine. Performing these tasks manually can be inefficient and inconsistent.

Bash scripting provides a powerful way to automate such tasks by combining commands into reusable scripts.

In this lab, we develop a **Linux system enumeration tool** using Bash scripting. The script automates the collection of system information, user data, process activity, network configuration, and basic security checks.

Enumeration tools like this are widely used in:

* system administration
* security auditing
* penetration testing
* incident response
* host diagnostics

The tool built in this lab behaves like a **lightweight security auditing framework** capable of performing modular system checks and generating structured audit reports.

---

## Objective

The objective of this lab is to demonstrate how Bash scripting can be used to automate Linux system inspection and security enumeration.

By completing this lab, you will learn how to:

* automate Linux commands using Bash scripting
* structure scripts using functions
* implement an interactive menu interface
* generate timestamped audit reports
* collect system, user, process, and network information automatically
* perform basic Linux security checks

---

## Table of Contents

* [Introduction](#introduction)
* [Objective](#objective)
* [Lab Overview](#lab-overview)
* [Tool Description](#tool-description)
* [Script Location](#script-location)
* [Requirements](#requirements)
* [Usage](#usage)
* [Enumeration Categories](#enumeration-categories)
* [Report Generation](#report-generation)
* [Security Considerations](#security-considerations)
* [Conclusion](#conclusion)

---

## Lab Overview

This lab implements a **Linux enumeration script** that automates multiple system inspection tasks.

Instead of manually executing commands such as:

```
hostname
ip a
ps aux
ss -tulnp
```

the script allows these operations to be executed automatically through a single tool.

When executed, the script presents an interactive menu allowing the user to select specific enumeration modules or perform a full system audit.

Example interface:

```
Linux Security Enumeration Tool

1) System Information
2) User Enumeration
3) Process Analysis
4) Network Enumeration
5) Connectivity Tests
6) Security Checks
7) Login Analysis
8) Full System Audit
0) Exit
```

Each option runs a specific set of Linux commands.

---

## Tool Description

The script developed in this lab functions as a **lightweight Linux system auditing tool**.

It automates several administrative and security inspection tasks by combining multiple Linux commands into a modular Bash script.

The tool assists with:

* Linux host enumeration
* security auditing
* administrative diagnostics
* penetration testing reconnaissance
* system troubleshooting

Because the script is modular, users can run individual inspection modules or perform a complete system audit.

---

## Script Location

The script is stored inside the Linux labs directory as part of the automation lab.

Repository structure:

```
linux
│
├── labs
│   └── lab5-linux-automation
│       ├── lab.md
│       └── system_audit.sh
```

---

## Requirements

The script relies on standard Linux utilities that are typically available on most distributions.

Required tools include:

* bash
* ip
* ss
* ps
* ping
* nslookup
* traceroute
* grep
* find

These utilities are normally preinstalled on systems such as:

* Debian
* Ubuntu
* Kali Linux

Some enumeration checks may require elevated privileges.

Running the script with `sudo` may provide more complete results:

```
sudo ./system_audit.sh
```

---

## Usage

### Make the Script Executable

Before running the script, it must be given execute permissions.

```
chmod +x system_audit.sh
```

---

### Run the Script

Execute the script using:

```
./system_audit.sh
```

The script will display an interactive menu allowing the user to choose specific enumeration modules or run a full system audit.

---

## Enumeration Categories

The automation tool performs several types of Linux system enumeration commonly used in system administration and cybersecurity.

---

### System Information

Collects general information about the host operating system.

Commands used:

```
hostname
whoami
uname -a
cat /etc/os-release
```

Information gathered includes:

* hostname
* current user
* kernel version
* operating system details

---

### User Enumeration

Analyzes users and groups on the system.

Commands used:

```
id
who
cut -d: -f1 /etc/passwd
cut -d: -f1 /etc/group
```

This helps identify:

* system accounts
* logged-in users
* group memberships

---

### Process Analysis

Examines running processes on the system.

Commands used:

```
ps aux --sort=-%cpu
ps aux --sort=-%mem
```

This reveals:

* resource-intensive processes
* potential anomalies
* system resource usage

---

### Network Enumeration

Collects information about network configuration.

Commands used:

```
hostname -I
ip a
ip route
ss -tulnp
```

This helps identify:

* IP addresses
* network interfaces
* routing tables
* listening services and open ports

---

### Connectivity Tests

Tests network connectivity and DNS resolution.

Commands used:

```
ping
nslookup
traceroute
```

These tools verify:

* internet connectivity
* DNS functionality
* routing paths to external hosts

---

### Security Checks

Searches for potential security risks.

Commands used:

```
find / -perm -4000
find / -perm -002
sudo -l
```

Checks include:

* SUID binaries that may allow privilege escalation
* world-writable files
* sudo privilege configurations

---

### Login Analysis

Analyzes authentication activity.

Commands used:

```
last
grep "Failed password" /var/log/auth.log
```

These commands help detect:

* recent login activity
* failed login attempts
* possible brute-force attacks

---

## Report Generation

When a full system audit is executed, the script generates a timestamped report.

Example:

```
system_audit_2026-03-16_14-30.txt
```

The timestamp ensures that reports are not overwritten and allows historical tracking of system audits.

The report includes structured sections such as:

```
SYSTEM INFORMATION
USER ENUMERATION
PROCESS ANALYSIS
NETWORK INFORMATION
SECURITY CHECKS
LOGIN ANALYSIS
```

---

## Security Considerations

Some checks performed by the script require administrative privileges.

Running the script with `sudo` may provide more complete enumeration results.

However, scripts should only be executed with elevated privileges when their contents are trusted and understood.

---

## Conclusion

In this lab, we created a Bash-based automation tool capable of performing Linux system enumeration and basic security auditing.

By combining multiple Linux commands into a modular script, we transformed manual command execution into an automated workflow capable of collecting system information, inspecting user accounts, analyzing processes, examining network configuration, and identifying potential security risks.

Automation is a critical skill for system administrators and cybersecurity professionals. Scripts like this enable rapid system inspection, repeatable audits, and efficient troubleshooting.

The enumeration tool developed in this lab demonstrates how Bash scripting can be used to build practical automation tools that support both system administration and security operations.
