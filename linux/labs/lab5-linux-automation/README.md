# Linux Security Automation Framework

A modular Bash-based security auditing tool that automates Linux system enumeration, security checks, and reporting.

The **Linux Security Automation Framework** combines multiple Linux administration concepts into a single automated framework capable of collecting system information, performing security checks, and generating structured reports.

This project demonstrates how Bash scripting can be used to automate common Linux administrative and cybersecurity auditing tasks.

---

## Table of Contents

- Overview
- Features
- Quick Start
- Project Structure
- Built-in Help Command
- Running Individual Modules
- Modules
- Reports
- Security Summary
- Purpose of the Lab
- Disclaimer
- Conclusion

---

## Overview

The framework performs automated security inspections on Linux systems by combining multiple enumeration and auditing techniques.

It gathers system information, analyzes users and processes, inspects networking configuration, and performs several security checks to help identify potential risks or misconfigurations.

The tool generates both **human-readable reports** and **CSV reports** for easier analysis.

---

## Features

The framework provides the following capabilities:

- automated Linux system enumeration
- modular scanning architecture
- command-line module selection
- colored terminal output
- human-readable reports
- CSV report generation
- dependency verification
- security scoring system
- scan duration tracking
- built-in help command

Each auditing task is implemented as an independent module, allowing flexible execution of individual scans.

---

## Quick Start

Run the following commands to clone the repository and execute the security scan.

```bash
git clone https://github.com/wambuasammy/Cybersecurity.git
cd Cybersecurity/linux/labs/lab5-linux-automation
chmod +x linux_audit.sh
./linux_audit.sh --scan
```

These commands will:

1. Clone the repository  
2. Navigate to the automation tool directory  
3. Make the script executable  
4. Run a full Linux security audit  

Reports will automatically be generated in the **reports** directory.

Main script location:

https://github.com/wambuasammy/Cybersecurity/blob/main/linux/labs/lab5-linux-automation/linux_audit.sh

---

## Project Structure

```
lab5-linux-automation
│
├── README.md
├── linux_audit.sh
│
├── modules
│   ├── system_info.sh
│   ├── users_enum.sh
│   ├── process_enum.sh
│   ├── network_enum.sh
│   ├── connectivity_tests.sh
│   ├── security_checks.sh
│   ├── login_analysis.sh
│   └── threat_detection.sh
│
└── reports
```

Each module performs a specific auditing task and is executed by the main script.

---

## Built-in Help Command

The tool includes a built-in help command that displays usage instructions and available scanning options.

Run:

```bash
./linux_audit.sh --help
```

Example output:

```
Linux Security Audit Framework

Usage:
./linux_audit.sh [OPTION]

Options:
  --scan       Run full system audit
  --system     System information scan
  --users      User enumeration
  --process    Process analysis
  --network    Network enumeration
  --connect    Connectivity tests
  --security   Security checks
  --logins     Login analysis
  --threats    Threat detection
  --verbose    Enable verbose output
  --help       Show help menu
```

---

## Running Individual Modules

The framework allows individual modules to be executed independently.

### System Information

```bash
./linux_audit.sh --system
```

### User Enumeration

```bash
./linux_audit.sh --users
```

### Process Analysis

```bash
./linux_audit.sh --process
```

### Network Enumeration

```bash
./linux_audit.sh --network
```

### Connectivity Testing

```bash
./linux_audit.sh --connect
```

### Security Checks

```bash
./linux_audit.sh --security
```

### Login Analysis

```bash
./linux_audit.sh --logins
```

### Threat Detection

```bash
./linux_audit.sh --threats
```

---

## Modules

The framework uses modular scanning components to perform different types of system analysis.

| Module | Purpose |
|------|------|
| system_info.sh | Collect system information |
| users_enum.sh | Enumerate system users |
| process_enum.sh | Inspect running processes |
| network_enum.sh | Analyze network configuration |
| connectivity_tests.sh | Test internet connectivity |
| security_checks.sh | Identify configuration weaknesses |
| login_analysis.sh | Analyze login history |
| threat_detection.sh | Detect suspicious activity |

---

## Example Tool Output

When the tool starts, it displays metadata about the scan session.

```
====================================================
Linux Security Audit Framework
Version: 1.0
Author: Sammy Wambua
====================================================

Scan started: Tue Mar 18 10:22:41
```

Example scan results:

```
[INFO] Hostname → kali
[INFO] Kernel Version → 6.6
[OK] Internet connectivity → Reachable
[WARNING] Writable PATH directory detected
```

---

## Reports

After each scan completes, reports are automatically generated inside the **reports** directory.

### Human-Readable Report

```
reports/audit_DATE.txt
```

This file contains a formatted summary of scan results.

### CSV Report

```
reports/audit_DATE.csv
```

The CSV report contains structured data suitable for:

- spreadsheet analysis
- SIEM ingestion
- automated parsing

---

## Security Summary

At the end of each scan the framework calculates a system security score.

Example output:

```
SYSTEM SECURITY SUMMARY

Warnings: 2
Critical Findings: 1
Security Score: 85 / 100
Risk Level: MEDIUM
```

This provides a quick overview of system security posture.

---

## Purpose of the Lab

This lab demonstrates how Bash scripting can be used to automate Linux administration and security auditing tasks.

By combining concepts learned throughout multiple Linux topics such as:

- user and group management
- process monitoring
- networking
- permissions
- system inspection

the framework automates common administrative and security inspection tasks.

The result is a modular auditing tool that simulates the behavior of professional Linux security auditing utilities.

---

## Disclaimer

This tool is intended for **educational purposes and authorized security auditing only**.

Do not run this tool against systems without proper authorization.

---

## Conclusion

The Linux Security Automation Framework demonstrates how Bash scripting can be used to build automated security auditing tools.

By integrating multiple Linux concepts into a modular scanning architecture, the framework simplifies system inspection tasks and produces structured reports that help administrators evaluate system security.

This project highlights the importance of automation in Linux administration and cybersecurity operations and illustrates how simple scripts can evolve into powerful auditing tools.