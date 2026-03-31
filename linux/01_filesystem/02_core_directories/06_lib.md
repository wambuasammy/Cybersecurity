# 📁 lib.md — The `/lib` Directory 

## 🧠 What `/lib` REALLY is

`/lib` contains **shared libraries** required by binaries in `/bin` and `/sbin`.

👉 Think of it like this:

* `/bin` = programs
* `/lib` = code those programs depend on

---

## 🧠 What is a Library?

A library is **pre-written code** that programs reuse.

Instead of every program having its own code for everything:

👉 They load shared libraries from `/lib`

---

## 🧠 Real Example

When you run:

```bash id="r3k9xp"
ls
```

It does NOT work alone

---

### Check dependencies:

```bash id="t7q2mv"
ldd /bin/ls
```

---

Example output:

```id="z8n1kp"
libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6
```

---

👉 Meaning:

* `/bin/ls` depends on `libc.so.6`
* That library is in `/lib`

---

## 🧠 Key Concept

👉 Programs in `/bin` are **dynamically linked**

They load libraries at runtime from `/lib`

---

# 🔐 WHY `/lib` IS EXTREMELY POWERFUL

Because:

👉 If you control `/lib`, you control what programs DO internally

---

* `/bin` executes
* `/lib` defines behavior

---

👉 `/lib` = **hidden execution layer**

---

# 🏗️ COMMON FILES IN `/lib`

```id="w6k2qp"
/lib/libc.so.6
/lib/ld-linux.so
/lib/modules/
/lib/x86_64-linux-gnu/
```

---

## 🧠 Important Components

---

### 🔹 `libc.so.6`

* Core system library
* Used by almost every program

---

### 🔹 `ld-linux.so`

* Dynamic linker
* Loads libraries into programs

---

### 🔹 `/lib/modules/`

* Kernel modules (drivers)

---

# 🔐 ATTACK 1: LIBRARY HIJACKING (CRITICAL)

## 🧠 Idea

Replace a legitimate library with malicious one

---

## ⚙️ How it works

1. Program runs:

```bash id="a7m2xp"
ls
```

2. It loads:

```id="g3k9zn"
/lib/libc.so.6
```

---

3. Attacker replaces it with malicious version

---

## 🔐 Result

* Every program using that library is compromised
* Code runs silently inside trusted programs

---

👉 This is **stealth persistence**

---

## 🧠 Why it is powerful

* No new binaries needed
* Hard to detect
* Affects multiple programs

---

## 🛡️ Defense

* Verify library integrity
* Restrict write access to `/lib`

---

# 🔐 ATTACK 2: LD_PRELOAD INJECTION

## 🧠 What is LD_PRELOAD?

Environment variable that forces a program to load a specific library first

---

## ⚙️ Example

```bash id="z2p8mq"
LD_PRELOAD=/tmp/malicious.so ls
```

---

## 🧠 What happens

* System loads attacker’s library BEFORE real ones
* Attacker overrides functions

---

## 🔐 Example attack

Fake `open()` function:

* Logs files accessed
* Steals data

---

## 🔐 Result

* Program behaves normally
* But attacker code runs inside

---

👉 Very stealthy

---

## 🛡️ Defense

* Restrict LD_PRELOAD usage
* Monitor environment variables

---

# 🔐 ATTACK 3: DYNAMIC LINKER HIJACKING

## 🧠 What is `ld-linux.so`?

It loads libraries when a program starts

---

## ⚙️ Attack

Replace:

```id="x4n9zp"
/lib/ld-linux.so
```

---

## 🔐 Result

* Every dynamically linked program compromised
* System-wide control

---

👉 Extremely powerful attack

---

## 🛡️ Defense

* Monitor linker integrity
* Use secure boot mechanisms

---

# 🔐 ATTACK 4: KERNEL MODULE BACKDOOR

## 🧠 What are kernel modules?

Located in:

```id="n9t4xp"
/lib/modules/
```

---

👉 They extend kernel functionality

---

## ⚙️ Attack

Load malicious module:

```bash id="m7q2zp"
insmod rootkit.ko
```

---

## 🔐 What happens

* Runs in kernel space
* Can:

  * Hide processes
  * Hide files
  * Intercept system calls

---

👉 This is **rootkit-level attack**

---

## 🛡️ Defense

* Restrict module loading
* Use signed modules

---

# 🔐 ATTACK 5: LIBRARY PATH MANIPULATION

## 🧠 Idea

Control where system looks for libraries

---

## ⚙️ Variable:

```bash id="h3m9zw"
LD_LIBRARY_PATH
```

---

## ⚙️ Attack

```bash id="y8k2qn"
export LD_LIBRARY_PATH=/tmp
```

---

If attacker places fake library:

```id="f5k9wp"
/tmp/libc.so.6
```

---

👉 It gets loaded instead of real one

---

## 🔐 Result

* Code execution inside trusted programs

---

## 🛡️ Defense

* Avoid unsafe library paths
* Use secure execution environments

---

# ⚠️ WHY `/lib` IS DANGEROUS

Because it is:

* Invisible to most users
* Trusted by all programs
* Loaded automatically

---

👉 It is a **silent attack surface**

---

# 🛡️ DEFENSE STRATEGY

---

## 1. Restrict Permissions

```bash id="q8n3vl"
chmod 755 /lib
chown root:root /lib
```

---

## 2. Monitor Integrity

```bash id="z1p6xr"
sha256sum /lib/libc.so.6
```

---

## 3. Verify Packages

```bash id="t3k9qn"
dpkg -V
```

---

## 4. Monitor Environment Variables

Watch:

```id="v6m2xp"
LD_PRELOAD
LD_LIBRARY_PATH
```

---

## 5. Restrict Kernel Modules

* Disable unnecessary modules
* Use signed modules

---

# 🧪 RECON COMMANDS

```bash id="c7p4mz"
ls -la /lib
ldd /bin/ls
find /lib -type f
ls /lib/modules
```

---

# 🧠 FINAL MENTAL MODEL

* `/bin` = execution
* `/lib` = logic behind execution

---

👉 Programs run
👉 Libraries decide HOW they run

---

# 📌 FINAL TRUTH

If attacker controls `/lib`:

* They control program behavior
* They can inject stealth code
* They can persist invisibly
* They can compromise entire system

👉 `/lib` compromise = **silent system-wide control**
