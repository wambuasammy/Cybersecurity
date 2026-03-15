Overview

The Linux Security Audit Framework is a modular Bash-based automation tool designed to perform security auditing and system enumeration on Linux systems.

The tool automates multiple Linux administrative and security inspection tasks, including:

system information collection

user enumeration

process inspection

network analysis

connectivity testing

security configuration checks

login activity analysis

threat detection

The framework generates structured reports that allow administrators and security professionals to quickly assess system health and potential security risks.

This lab demonstrates how Linux administration knowledge can be combined with Bash scripting to build a practical security automation tool.

Features

The framework provides the following capabilities:

modular security scanning architecture

automated Linux system enumeration

command-line module selection

colored terminal output

human-readable reports

CSV report generation

dependency verification

security scoring

scan duration tracking

Each audit task is implemented as an independent module, allowing flexible execution of individual scans.

Clone the Repository

Clone the repository from GitHub:

git clone https://github.com/wambuasammy/Cybersecurity.git
Navigate to the Automation Tool

Navigate to the automation lab directory:

cd Cybersecurity/linux/labs/lab5-linux-automation

You can also view the tool directly in the repository:

Main script:

linux_audit.sh

Modules directory:

modules

Project Structure

The automation framework is organized as follows:

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

Before running the tool, make the script executable:

chmod +x linux_audit.sh
Running the Tool

Run a full system audit:

./linux_audit.sh --scan

The tool will perform all available scans and generate security reports.

Running Individual Modules

The framework supports executing individual modules.

System Information
./linux_audit.sh --system
User Enumeration
./linux_audit.sh --users
Process Inspection
./linux_audit.sh --process
Network Enumeration
./linux_audit.sh --network
Connectivity Testing
./linux_audit.sh --connect
Security Configuration Checks
./linux_audit.sh --security
Login Analysis
./linux_audit.sh --logins
Threat Detection
./linux_audit.sh --threats
Example Tool Output

When the tool starts, it displays metadata including version, author, and scan start time.

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

After each scan, reports are generated inside the reports directory.

Human-readable report
reports/audit_DATE.txt

This file contains formatted scan results for easy review.

CSV report
reports/audit_DATE.csv

The CSV report can be used for:

spreadsheet analysis

importing into SIEM tools

automated log analysis

Security Summary

At the end of each scan, the framework calculates a system security score.

Example:

SYSTEM SECURITY SUMMARY

Warnings: 2
Critical Findings: 1
Security Score: 85 / 100
Risk Level: MEDIUM

This allows administrators to quickly understand the security posture of the system.

Purpose of the Lab

This lab demonstrates how Bash scripting can be used to automate Linux administration and security auditing tasks.

By integrating concepts learned across previous Linux topics such as:

users and groups

process management

networking

permissions

system monitoring

the tool automates routine inspection tasks and produces structured reports.

This type of automation improves efficiency, consistency, and scalability when performing security assessments.

Conclusion

The Linux Security Audit Framework demonstrates how Bash scripting can be used to build automated security auditing tools for Linux environments.

The framework integrates multiple system inspection techniques into a modular scanning architecture that simplifies system analysis and produces structured reports.

This project highlights the importance of automation in system administration and cybersecurity operations and illustrates how simple scripting techniques can evolve into powerful security assessment tools.