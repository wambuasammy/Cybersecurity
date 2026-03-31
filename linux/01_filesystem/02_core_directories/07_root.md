# 📁 root.md — The Root Directory `/`

## 🧠 Definition

The root directory `/` is the **top-level namespace of the Linux filesystem**. Every file and directory—without exception—descends from `/`.

* Absolute paths start with `/`
* It is the **anchor point for all mounts**
* Managed primarily by the **root user (UID 0)**

---

## 🏗️ Structural Role

* Acts as the **single unified filesystem root**
* All storage devices (HDD, SSD, USB, network shares) are mounted somewhere under `/`
* Eliminates drive-letter fragmentation (unlike Windows)

### Example Paths

```
/etc/passwd
/home/ace
/var/log/auth.log
```

All of these are **paths rooted at `/`**

---

## 🔐 Permissions & Ownership

### Check permissions

```bash
ls -ld /
```

### Typical output

```bash
drwxr-xr-x  root root  /
```

### Breakdown

| Field       | Meaning |
| ----------- | ------- |
| Owner       | root    |
| Group       | root    |
| Permissions | 755     |

### Interpretation

* Root → full control (read, write, execute)
* Group → read + execute
* Others → read + execute

### 🔐 Security Implication

* Prevents non-privileged users from modifying system structure
* Allows traversal (needed for system usability)
* If `/` becomes writable → **total system compromise**

---

## 🔐 Cybersecurity Significance

### 1. Single Point of Trust

Everything depends on `/`.

If `/` is compromised:

* System binaries can be replaced
* Configuration files can be altered
* Logs can be erased or tampered with
* Backdoors can be installed for persistence

👉 `/` integrity = **Operating System integrity**

---

### 2. Root Privilege Boundary

Only privileged users/processes (root) can:

* Modify directories under `/`
* Mount or unmount filesystems
* Change ownership and permissions globally

👉 **Attack insight:**
If an attacker achieves **privilege escalation**, they gain control over `/` → full system takeover

---

### 3. Mount Injection Risks

All filesystems attach somewhere under `/`.

Example:

```bash
mount /dev/sdb1 /mnt
```

If an attacker controls the mounted device:

* They can introduce malicious binaries
* They can mimic legitimate directory structures
* They can trick users or processes into executing malicious files

### 🔐 Secure Mount Options

```bash
noexec,nosuid,nodev
```

| Option | Protection                         |
| ------ | ---------------------------------- |
| noexec | Prevents execution of binaries     |
| nosuid | Disables SUID privilege escalation |
| nodev  | Prevents device file usage         |

👉 These options are **critical when mounting untrusted media**

---

### 4. Path Traversal Attacks

All sensitive files exist under `/`.

Attack pattern:

```
../../../../etc/shadow
```

👉 Goal:
Escape restricted directory → access critical system files

### High-value targets:

* `/etc/shadow` → password hashes
* `/root/` → root user's private files
* `/var/log/` → logs (for hiding traces)

---

### 5. Filesystem Integrity Attacks

If `/` is writable or poorly protected:

* Replace `/bin/bash` → persistent backdoor shell
* Modify `/etc/passwd` → unauthorized account access
* Inject malicious libraries into `/lib` → hijack execution

👉 These are **post-exploitation persistence techniques**

---

## ⚠️ Common Misconfigurations

| Misconfiguration                       | Impact                           |
| -------------------------------------- | -------------------------------- |
| `/` writable by non-root users         | Immediate full system compromise |
| Weak mount restrictions                | Arbitrary code execution         |
| No file integrity monitoring           | Undetected persistence           |
| Disabled SELinux/AppArmor              | Reduced system containment       |
| Improper permissions on subdirectories | Privilege escalation             |

---

## 🛡️ Hardening Techniques

### 1. Read-Only Root Filesystem (Advanced)

* Mount `/` as read-only
* Used in:

  * Containers
  * Embedded systems
  * Immutable Linux distributions

👉 Prevents attackers from modifying system binaries even with elevated privileges

---

### 2. File Integrity Monitoring

Tools:

* AIDE (Advanced Intrusion Detection Environment)
* Tripwire

Purpose:

* Detect unauthorized modifications under `/`
* Alert on tampering with critical files

---

### 3. Mandatory Access Control (MAC)

Frameworks:

* SELinux
* AppArmor

Function:

* Enforces fine-grained policies
* Restricts what even root processes can do

---

### 4. Restrict Mount Capabilities

Control:

* Who can mount devices
* Access to loop devices
* Use of removable media

👉 Prevents malicious filesystem injection

---

### 5. Audit Logging

Monitor:

* Access to `/`
* Changes to system-critical paths
* Privileged operations

Tools:

* auditd
* journald

---

## 🧪 Practical Recon Commands

```bash
# Show root directory permissions
ls -ld /

# View mounted filesystems under root
mount | column -t

# Check disk usage and layout
df -h

# Find writable directories under /
find / -type d -writable 2>/dev/null

# Find SUID binaries (privilege escalation vectors)
find / -perm -4000 2>/dev/null
```

---

## 🧩 Mental Model (Security Perspective)

```
        /
   ┌────┼────┐
 /etc  /bin  /var ...
```

* `/` = **root of trust**
* Subdirectories = **attack surfaces**
* Permissions = **security boundaries**

---

## 🧠 Key Takeaways

* `/` is the **foundation of the Linux operating system**
* Every file access begins from `/`
* Every attack path eventually targets something under `/`
* Protecting `/` protects:

  * Execution layer (`/bin`)
  * Configuration (`/etc`)
  * User data (`/home`, `/root`)
  * Logs and services (`/var`)

---

## 📌 Final Summary

The root directory `/` is not just a directory—it is the **entire system's control plane**.

From a cybersecurity perspective:

* It is the **primary trust boundary**
* It is the **central attack surface**
* It is the **core of system integrity**

👉 If `/` is compromised, the entire system is compromised.
