# 📁 var.md — The `/var` Directory 

## 🧠 What `/var` REALLY is

`/var` stands for **variable data**

👉 It contains files that:

* Change frequently
* Grow over time
* Are written by services and the system

---

## 🧠 Core Idea

Unlike `/bin` (static) and `/etc` (configuration):

👉 `/var` = **runtime activity of the system**

---

## 🏗️ Key Subdirectories

```id="e9b8c1"
/var/log
/var/tmp
/var/spool
/var/lib
/var/www
```

Each one plays a role in **security, logging, and persistence**

---

# 🔐 1. `/var/log` — LOGGING (DETECTION GOLDMINE)

## 🧠 What it is

Stores system and application logs

---

## ⚙️ Examples

```id="y2xv9f"
/var/log/auth.log
/var/log/syslog
/var/log/kern.log
/var/log/apache2/access.log
```

---

## 🧠 What logs contain

* Login attempts
* Failed passwords
* Service activity
* Errors
* System events

---

## 🔐 Attack Use

Attackers target logs to:

### 1. Hide Tracks

```bash id="z0r3eq"
rm /var/log/auth.log
```

👉 Deletes evidence of intrusion

---

### 2. Modify Logs

* Remove failed login attempts
* Insert fake entries

---

### 3. Log Flooding (DoS)

```bash id="0q3x9r"
yes "spam" >> /var/log/syslog
```

👉 Fills disk → system crashes

---

## 🛡️ Defense

* Restrict permissions
* Use remote logging
* Monitor log integrity

---

# 🔐 2. `/var/tmp` — TEMPORARY STORAGE (PERSISTENCE RISK)

## 🧠 Difference from `/tmp`

| Directory  | Behavior              |
| ---------- | --------------------- |
| `/tmp`     | Cleared on reboot     |
| `/var/tmp` | Persists after reboot |

---

## 🔐 Why Attackers Love It

* Files survive reboot
* Often writable by all users

---

## ⚙️ Example Attack

```bash id="k9c4wq"
cp /bin/bash /var/tmp/rootbash
chmod +s /var/tmp/rootbash
```

---

👉 Creates:

* Persistent SUID backdoor

---

## 🛡️ Defense

* Monitor for SUID files
* Restrict execution:

Mount options:

```id="d2m6zs"
noexec,nosuid,nodev
```

---

# 🔐 3. `/var/spool` — QUEUED TASKS

## 🧠 What it is

Stores queued jobs:

* Emails
* Print jobs
* Scheduled tasks

---

## ⚙️ Important:

```id="r0x7kp"
/var/spool/cron
```

---

## 🔐 Attack Use

Attacker adds cron job:

```bash id="0s9q1b"
* * * * * /tmp/malware.sh
```

---

👉 Runs every minute → persistence

---

## 🛡️ Defense

* Monitor cron jobs
* Restrict access

---

# 🔐 4. `/var/lib` — APPLICATION STATE

## 🧠 What it is

Stores persistent data for services

Examples:

```id="t8q7oz"
/var/lib/mysql
/var/lib/dpkg
/var/lib/systemd
```

---

## 🔐 Attack Use

* Modify application data
* Inject malicious configs
* Corrupt package database

---

👉 Can lead to:

* Hidden persistence
* Broken updates
* Service compromise

---

## 🛡️ Defense

* Restrict permissions
* Monitor integrity

---

# 🔐 5. `/var/www` — WEB ROOT

## 🧠 What it is

Default location for web server files

---

## ⚙️ Example

```id="a9y6jh"
/var/www/html/index.html
```

---

## 🔐 Attack Use

### Web Shell

```php id="d3r9ka"
<?php system($_GET['cmd']); ?>
```

---

Saved as:

```id="y3k0mp"
/var/www/html/shell.php
```

---

### Attacker executes:

```
http://target/shell.php?cmd=whoami
```

---

👉 Remote command execution

---

## 🛡️ Defense

* Restrict write access
* Monitor uploads
* Validate inputs

---

# 🔐 ATTACK PATTERN: `/var` AS A WHOLE

Attackers use `/var` to:

* Store payloads
* Hide tools
* Maintain persistence
* Erase logs

---

## 🧠 Why `/var` is Perfect for Attackers

* Writable locations exist
* Large storage
* Less monitored by beginners

---

# 🔐 REAL ATTACK FLOW

1. Gain access
2. Drop payload in:

```id="i8m4cl"
/var/tmp
```

3. Create cron job:

```id="s7p9kx"
/var/spool/cron
```

4. Clear logs:

```id="j5k3wt"
/var/log
```

---

👉 Full stealth persistence achieved

---

# 🛡️ DEFENSE STRATEGY

---

## 1. Monitor Logs

* Detect anomalies
* Use SIEM tools

---

## 2. Protect `/var/tmp`

* Use mount restrictions
* Remove SUID files

---

## 3. Audit Cron Jobs

```bash id="b6k8rv"
crontab -l
ls -la /var/spool/cron
```

---

## 4. Monitor Web Directory

```bash id="r3w9hf"
ls -la /var/www
```

---

## 5. File Integrity Monitoring

Tools:

* AIDE
* Tripwire

---

# 🧪 RECON COMMANDS

```bash id="x9z3ot"
ls -la /var
ls -la /var/log
ls -la /var/tmp
ls -la /var/spool
ls -la /var/www
find /var -type f -perm -4000 2>/dev/null
```

---

# 🧠 FINAL MENTAL MODEL

* `/etc` → rules
* `/bin` → execution
* `/sbin` → system control
* `/var` → activity + evidence

---

# 📌 FINAL TRUTH

If attacker controls `/var`:

* They can hide their actions
* They can maintain persistence
* They can erase evidence
* They can run payloads silently

👉 `/var` compromise = **stealth + persistence control**
