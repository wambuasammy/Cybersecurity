# var.md — The /var Directory

## What /var REALLY is

/var stands for variable data

It contains files that:
- Change frequently
- Grow over time
- Are written by services and the system

---

## Core Idea

Unlike /bin (static) and /etc (configuration):

/var = runtime activity of the system

---

## Key Subdirectories

/var/log  
/var/tmp  
/var/spool  
/var/lib  
/var/www  

Each one plays a role in security, logging, and persistence

---

# 1. /var/log — LOGGING (DETECTION GOLDMINE)

## What it is

Stores system and application logs

---

## Examples

/var/log/auth.log  
/var/log/syslog  
/var/log/kern.log  
/var/log/apache2/access.log  

---

## What logs contain

- Login attempts
- Failed passwords
- Service activity
- Errors
- System events

---

## Attack Use

Attackers target logs to:

### 1. Hide Tracks

rm /var/log/auth.log

Deletes evidence of intrusion

---

### 2. Modify Logs

- Remove failed login attempts
- Insert fake entries

---

### 3. Log Flooding (DoS)

yes "spam" >> /var/log/syslog

Fills disk and can crash the system

---

## Defense

- Restrict permissions
- Use remote logging
- Monitor log integrity

---

# 2. /var/tmp — TEMPORARY STORAGE (PERSISTENCE RISK)

## Difference from /tmp

/tmp     → Cleared on reboot  
/var/tmp → Persists after reboot  

---

## Why Attackers Use It

- Files survive reboot
- Often writable by all users

---

## Example Attack

cp /bin/bash /var/tmp/rootbash  
chmod +s /var/tmp/rootbash  

Creates a persistent SUID backdoor

---

## Defense

- Monitor for SUID files
- Restrict execution using mount options:

noexec,nosuid,nodev

---

# 3. /var/spool — QUEUED TASKS

## What it is

Stores queued jobs:
- Emails
- Print jobs
- Scheduled tasks

---

## Important Location

/var/spool/cron

---

## Attack Use

Attacker adds cron job:

* * * * * /tmp/malware.sh

Runs every minute for persistence

---

## Defense

- Monitor cron jobs
- Restrict access

---

# 4. /var/lib — APPLICATION STATE

## What it is

Stores persistent data for services

Examples:

/var/lib/mysql  
/var/lib/dpkg  
/var/lib/systemd  

---

## Attack Use

- Modify application data
- Inject malicious configs
- Corrupt package database

This can lead to:
- Hidden persistence
- Broken updates
- Service compromise

---

## Defense

- Restrict permissions
- Monitor integrity

---

# 5. /var/www — WEB ROOT

## What it is

Default location for web server files

---

## Example

/var/www/html/index.html

---

## Attack Use

Web shell example:

<?php system($_GET['cmd']); ?>

Saved as:

/var/www/html/shell.php

Accessed via:

http://target/shell.php?cmd=whoami

Leads to remote command execution

---

## Defense

- Restrict write access
- Monitor uploads
- Validate inputs

---

# ATTACK PATTERN: /var AS A WHOLE

Attackers use /var to:
- Store payloads
- Hide tools
- Maintain persistence
- Erase logs

---

## Why /var is Attractive

- Writable locations exist
- Large storage
- Often less monitored

---

# REAL ATTACK FLOW

1. Gain access  
2. Drop payload in /var/tmp  
3. Create cron job in /var/spool/cron  
4. Clear logs in /var/log  

Result: stealth persistence

---

# DEFENSE STRATEGY

## 1. Monitor Logs
- Detect anomalies
- Use SIEM tools

## 2. Protect /var/tmp
- Use mount restrictions
- Remove SUID files

## 3. Audit Cron Jobs
crontab -l  
ls -la /var/spool/cron  

## 4. Monitor Web Directory
ls -la /var/www  

## 5. File Integrity Monitoring
- AIDE
- Tripwire

---

# RECON COMMANDS

ls -la /var  
ls -la /var/log  
ls -la /var/tmp  
ls -la /var/spool  
ls -la /var/www  
find /var -type f -perm -4000 2>/dev/null  

---

# FINAL MENTAL MODEL

/etc  → rules  
/bin  → execution  
/sbin → system control  
/var  → activity and evidence  

---

# FINAL TRUTH

If an attacker controls /var:
- They can hide their actions
- They can maintain persistence
- They can erase evidence
- They can run payloads silently

/var compromise = stealth + persistence control