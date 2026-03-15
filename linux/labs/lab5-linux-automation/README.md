# Linux Security Automation Framework

The **Linux Security Automation Framework** is a modular Bash-based tool designed to automate system enumeration and security auditing on Linux systems.

The tool combines multiple Linux administration concepts into a single automated framework capable of collecting system information, performing security checks, and generating structured reports.

This project demonstrates how Bash scripting can be used to automate common Linux administrative and cybersecurity auditing tasks.

---

# Features

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

# Quick Start

The fastest way to run the Linux Security Automation Framework is to clone the repository and execute the scan.

Run the following commands:

```bash
git clone https://github.com/wambuasammy/Cybersecurity.git
cd Cybersecurity/linux/labs/lab5-linux-automation
chmod +x linux_audit.sh
./linux_audit.sh --scan


Locate the Automation Tool

Navigate to the automation lab directory.

cd Cybersecurity/linux/labs/lab5-linux-automation

Main script:

https://github.com/wambuasammy/Cybersecurity/blob/main/linux/labs/lab5-linux-automation/linux_audit.sh

Project Structure
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

Each module performs a specific auditing task and is executed by the main script.

Make the Script Executable

Before running the tool, make the script executable.

chmod +x linux_audit.sh
Run the Tool

Run a complete system audit:

./linux_audit.sh --scan

This command runs all available modules and generates security reports.

Built-in Help Command

The tool includes a built-in help command that displays usage instructions and available scanning options.

Run:

./linux_audit.sh --help

Example output:

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
Running Individual Modules

The framework allows individual modules to be executed separately.

System Information
./linux_audit.sh --system
User Enumeration
./linux_audit.sh --users
Process Analysis
./linux_audit.sh --process
Network Enumeration
./linux_audit.sh --network
Connectivity Testing
./linux_audit.sh --connect
Security Checks
./linux_audit.sh --security
Login Analysis
./linux_audit.sh --logins
Threat Detection
./linux_audit.sh --threats
Example Output

When the tool starts, it displays metadata about the scan session.

====================================================
Linux Security Audit Framework
Version: 1.0
Author: Sammy Wambua
====================================================

Scan started: Tue Mar 18 10:22:41

Example scan results:

[INFO] Hostname → kali
[INFO] Kernel Version → 6.6
[OK] Internet connectivity → Reachable
[WARNING] Writable PATH directory detected
Reports

After the scan completes, reports are generated inside the reports directory.

Human-Readable Report
reports/audit_DATE.txt

This file contains a formatted summary of all scan results.

CSV Report
reports/audit_DATE.csv

The CSV report contains structured data that can be used for:

spreadsheet analysis

importing into monitoring tools

automated data analysis

Security Summary

At the end of each scan the framework calculates a system security score.

Example:

SYSTEM SECURITY SUMMARY

Warnings: 2
Critical Findings: 1
Security Score: 85 / 100
Risk Level: MEDIUM

This provides a quick overview of the security posture of the system.

Purpose of the Lab

This lab demonstrates how Bash scripting can be used to automate Linux administration and security auditing tasks.

By combining concepts learned throughout multiple Linux topics such as:

user and group management

process monitoring

networking

permissions

system inspection

the framework automates common administrative and security inspection tasks.

The result is a modular auditing tool that simulates the behavior of professional Linux security auditing utilities.

Conclusion

The Linux Security Automation Framework demonstrates how Bash scripting can be used to build automated security auditing tools.

By integrating multiple Linux concepts into a modular scanning architecture, the framework simplifies system inspection tasks and produces structured reports that help administrators evaluate system security.

This project highlights the importance of automation in Linux administration and cybersecurity operations and illustrates how simple scripts can evolve into powerful auditing tools.