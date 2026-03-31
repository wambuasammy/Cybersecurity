# 📁 sbin.md — The `/sbin` Directory 

## 🧠 What `/sbin` REALLY is

`/sbin` contains **system administration binaries**.

👉 These are programs used to:

* Control the system
* Manage hardware
* Configure networking
* Maintain system state

---

## 🧠 Key Difference: `/bin` vs `/sbin`

| Directory | Purpose                            |
| --------- | ---------------------------------- |
| `/bin`    | General user commands              |
| `/sbin`   | System-level commands (admin only) |

---

👉 Most `/sbin` binaries are intended to be run by **root only**

---

## 🧠 What Makes `/sbin` Special

* Direct interaction with kernel/system
* Requires elevated privileges
* Can change system-wide behavior instantly

👉 `/sbin` = **control plane of the OS**

---

## 🏗️ Common `/sbin` Binaries

```id="b2y8l6"
/sbin/iptables
/sbin/reboot
/sbin/shutdown
/sbin/fsck
/sbin/mkfs
/sbin/ifconfig
```

---

## 🧠 What These Actually Do (Mechanics)

---

### 🔹 `/sbin/iptables`

Controls firewall rules

👉 It decides:

* What traffic is allowed
* What traffic is blocked

---

### 🔹 `/sbin/reboot`

Immediately restarts the system

👉 Requires root → affects entire OS

---

### 🔹 `/sbin/fsck`

Checks and repairs filesystem

👉 Can modify disk structures

---

### 🔹 `/sbin/mkfs`

Creates filesystems

👉 Can erase disks completely

---

### 🔹 `/sbin/ifconfig`

Configures network interfaces

👉 Can:

* Change IP
* Disconnect system
* Redirect traffic

---

# 🔐 WHY `/sbin` IS EXTREMELY SENSITIVE

Because it controls:

* Networking
* Filesystems
* Boot process
* Kernel-level interactions

👉 If attacker controls `/sbin` → they control **system infrastructure**

---

# 🔐 ATTACK 1: ABUSING SYSTEM BINARIES

## 🧠 Idea

If attacker gets root:

👉 `/sbin` tools become weapons

---

## ⚙️ Example: Firewall Manipulation

```bash id="y7y2p2"
iptables -F
```

---

### What this does:

* Flushes all firewall rules
* Opens system completely

---

### Impact:

* Exposes all ports
* Enables remote attacks

---

## ⚙️ Example: Persistence via Network

```bash id="6hrl3o"
ifconfig eth0 192.168.1.100
```

👉 Attacker can:

* Change IP
* Hide presence
* Redirect traffic

---

# 🔐 ATTACK 2: SUID IN `/sbin` (CRITICAL)

## 🧠 Reminder

SUID = runs as owner (root)

---

## ⚙️ Find SUID binaries:

```bash id="tw0x6f"
find /sbin -perm -4000 2>/dev/null
```

---

## 🧠 Why This Is Dangerous

If ANY `/sbin` binary has SUID:

👉 It may give:

* Direct root execution
* Privilege escalation path

---

## ⚙️ Example Attack Flow

1. Find SUID binary
2. Check if exploitable
3. Execute it
4. Gain root shell

---

👉 This is one of the **most common privilege escalation paths**

---

# 🔐 ATTACK 3: PATH HIJACKING (ROOT CONTEXT)

Same concept as `/bin`, but more dangerous

---

## ⚙️ Scenario

Root runs a command without full path:

```bash id="zj4q4g"
service apache2 restart
```

---

If PATH is compromised:

* Attacker places fake `service`
* Root executes malicious binary

---

👉 Result:

* Code execution as root

---

## 🔐 Why This Is Worse Than `/bin`

* Happens under root context
* Immediate full system compromise

---

# 🔐 ATTACK 4: LIVING OFF THE LAND (ADMIN LEVEL)

Attackers use `/sbin` tools to:

* Disable logging
* Modify network
* Control services

---

## ⚙️ Example

```bash id="k0k2jv"
shutdown -h now
```

👉 Denial of Service (DoS)

---

```bash id="t0a9rf"
iptables -A INPUT -j DROP
```

👉 Blocks all incoming traffic

---

## 🧠 Key Insight

No malware needed

👉 Just using built-in system tools

---

# 🔐 ATTACK 5: FILESYSTEM DESTRUCTION

## ⚙️ Example

```bash id="6s0r1k"
mkfs.ext4 /dev/sda
```

---

### What this does:

* Formats disk
* Erases all data

---

👉 This is **total data destruction**

---

# ⚠️ WHY `/sbin` IS HIGHER RISK THAN `/bin`

| Factor      | `/bin`        | `/sbin`      |
| ----------- | ------------- | ------------ |
| User access | Yes           | Mostly root  |
| Impact      | Command-level | System-level |
| Damage      | Local         | Global       |

---

👉 `/sbin` = **high-impact attack surface**

---

# 🛡️ DEFENSE STRATEGY

---

## 1. Restrict Access

* Only root should execute `/sbin` tools
* Limit sudo access

---

## 2. Audit Usage

Monitor:

```bash id="44y0p6"
/sbin/*
```

Use:

* auditd
* logs

---

## 3. Validate PATH for root

Ensure:

```id="5xv8ds"
/usr/sbin:/usr/bin:/sbin:/bin
```

👉 No writable directories

---

## 4. Monitor Critical Commands

Watch:

* `iptables`
* `mkfs`
* `shutdown`
* `reboot`

---

## 5. Remove Unnecessary SUID

```bash id="2x6c5k"
find / -perm -4000 2>/dev/null
```

---

# 🧪 RECON COMMANDS

```bash id="c8pmhr"
ls -la /sbin
ls -ld /sbin
find /sbin -perm -4000 2>/dev/null
strings /sbin/* 2>/dev/null | less
```

---

# 🧠 FINAL MENTAL MODEL

* `/bin` → user execution
* `/sbin` → system control

---

👉 `/sbin` tools are not just commands
👉 They are **system-level controls**

---

# 📌 FINAL TRUTH

If attacker gains access to `/sbin` tools:

* They can control networking
* They can destroy filesystems
* They can shut down or manipulate the system
* They can bypass defenses

👉 `/sbin` compromise = **system-level domination**
