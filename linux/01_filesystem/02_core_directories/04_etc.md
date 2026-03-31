# 📁 etc.md — The `/etc` Directory 

## 🧠 What `/etc` REALLY is

`/etc` is the **central configuration authority of the entire system**.

Every major system decision comes from here:

* Who can log in
* How authentication works
* Which services run
* How networking behaves
* What gets mounted
* What is trusted

👉 If `/bin` is the "muscle", then `/etc` is the **brain**

---

## 🧠 How Linux Uses `/etc` (Mechanics)

When something happens in Linux:

1. A binary or service runs
2. It reads configuration from `/etc`
3. It behaves according to those rules

### Example (SSH)

1. `sshd` starts
2. Reads:

```
/etc/ssh/sshd_config
```

3. Applies rules inside that file

👉 `/etc` controls behavior — it does NOT execute

---

# 🔐 CRITICAL FILES

---

## 1. `/etc/passwd`

### Purpose:

Stores **user account information (not passwords)**

### Format:

```
username:x:UID:GID:comment:home:shell
```

### Example:

```
ace:x:1000:1000:Ace:/home/ace:/bin/bash
```

### Breakdown:

* username → login name
* x → password stored in `/etc/shadow`
* UID → user ID
* GID → group ID
* home → user directory
* shell → default shell

---

### 🔐 Security Implications

* World-readable
* Used for:

  * Username enumeration
  * Target selection
  * Shell discovery

---

## 2. `/etc/shadow`

### Purpose:

Stores **hashed passwords**

### Example:

```
ace:$6$randomhash:19000:0:99999:7:::
```

---

### Key Concept: Hashing

```
password123 → $6$abcxyz...
```

👉 Password is transformed, not stored directly

---

### 🔐 Security Risk

If exposed:

* Offline cracking possible
* Tools:

  * john
  * hashcat

---

## 3. `/etc/sudoers`

### Purpose:

Controls **who can become root**

---

### Example:

```
ace ALL=(ALL) ALL
```

👉 User can run any command as root

---

### Dangerous:

```
ace ALL=(ALL) NOPASSWD:ALL
```

👉 No password required → instant root

---

### Safe editing:

```
visudo
```

---

## 4. `/etc/ssh/sshd_config` (FULL UNDERSTANDING)

Controls **remote login behavior**

---

### When you run:

```
ssh user@server
```

Server:

1. Receives connection
2. Reads config
3. Applies rules

---

### PermitRootLogin

```
PermitRootLogin yes
```

* Root login allowed
* High-risk

```
PermitRootLogin no
```

* Root login blocked

---

### PasswordAuthentication

```
PasswordAuthentication yes
```

* Password login allowed
* Vulnerable to brute force

```
PasswordAuthentication no
```

* Only SSH keys allowed

---

### Secure setup:

```
PermitRootLogin no
PasswordAuthentication no
```

---

## 5. `/etc/fstab`

### Purpose:

Controls **mounting at boot**

---

### Example:

```
/dev/sda1 / ext4 defaults 0 1
```

---

### Security Risk:

Missing:

```
noexec,nosuid,nodev
```

👉 Allows:

* Malware execution
* Privilege escalation

---

## 6. `/etc/hosts`

### Purpose:

Local DNS override

---

### Example:

```
127.0.0.1 google.com
```

👉 Redirects traffic

---

### Attack Use:

* Phishing
* Traffic interception

---

# ⚠️ `/etc` AS AN ATTACK TARGET

Attackers modify `/etc` to:

* Add users
* Change configs
* Enable backdoors

---

# 🛡️ DEFENSE

* Restrict permissions
* Monitor changes
* Harden SSH
* Audit critical files

---

# 🧪 RECON

```
ls -la /etc
cat /etc/passwd
sudo cat /etc/shadow
sudo -l
cat /etc/ssh/sshd_config
```

---

# 📌 FINAL TRUTH

`/etc` controls:

* Authentication
* Access
* Behavior

👉 If `/etc` is compromised → attacker controls the system
