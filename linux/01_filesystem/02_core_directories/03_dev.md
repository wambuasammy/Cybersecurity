# 📁 dev.md — The `/dev` Directory 

## 🧠 What `/dev` REALLY is

`/dev` contains **device files**

👉 In Linux:
**Everything is treated as a file—even hardware**

---

## 🧠 What is a Device File?

A device file is an interface that allows programs to interact with:

* Hard drives
* Memory
* Terminals
* Input devices

---

### Example:

```id="y7k2qp"
/dev/sda      # Hard disk
/dev/tty      # Terminal
/dev/null     # Discard data
/dev/random   # Random number generator
```

---

👉 These are NOT normal files
👉 They are **interfaces to the kernel**

---

## 🧠 How It Works (Mechanics)

Example:

```bash id="z4x9mt"
cat /dev/random
```

---

### What happens:

1. `cat` reads file
2. Kernel provides random data
3. Output appears

---

👉 So `/dev` = **bridge between user space and kernel/hardware**

---

# 🏗️ TYPES OF DEVICE FILES

---

## 1. Character Devices

* Stream data (one byte at a time)

Examples:

```id="k9x3mv"
/dev/null
/dev/random
/dev/tty
```

---

## 2. Block Devices

* Handle data in chunks (blocks)

Examples:

```id="n8q2zp"
/dev/sda
/dev/sda1
```

---

👉 These represent storage devices

---

# 🔐 WHY `/dev` IS VERY SENSITIVE

Because it gives:

* Direct access to hardware
* Direct access to kernel interfaces

---

👉 If abused:

* Can read raw data
* Can overwrite disks
* Can spy on input

---

# 🔐 ATTACK 1: READING RAW DISK DATA

## 🧠 Idea

Access disk directly via `/dev/sdX`

---

## ⚙️ Example

```bash id="t7k3wx"
cat /dev/sda
```

---

### What happens:

* Reads entire disk raw
* Outputs binary data

---

## 🔐 Real Attack

```bash id="p2w8mx"
dd if=/dev/sda of=/tmp/disk.img
```

---

### Meaning:

* `if` = input file (disk)
* `of` = output file

---

### Result:

* Full disk copy created

---

👉 Attacker can:

* Extract files
* Recover deleted data
* Steal sensitive info

---

## 🛡️ Defense

* Restrict access to block devices
* Only root should access `/dev/sdX`

---

# 🔐 ATTACK 2: DISK DESTRUCTION

## ⚙️ Example

```bash id="v8m2ql"
dd if=/dev/zero of=/dev/sda
```

---

### What happens:

* Writes zeros to disk
* Overwrites everything

---

👉 Result:

* Total data loss
* System destroyed

---

## 🛡️ Defense

* Restrict root access
* Monitor `dd` usage

---

# 🔐 ATTACK 3: KEYLOGGING VIA `/dev/input`

## 🧠 Idea

Keyboard input is exposed as a device

---

## ⚙️ Example

```bash id="j5n8pd"
cat /dev/input/event0
```

---

### What happens:

* Reads raw keyboard events

---

## 🔐 Attack Use

* Capture keystrokes
* Steal passwords

---

👉 This is a **low-level keylogger**

---

## 🛡️ Defense

* Restrict permissions on `/dev/input`
* Use secure user isolation

---

# 🔐 ATTACK 4: ABUSING `/dev/null`

## 🧠 What is `/dev/null`?

```id="c2q7vn"
/dev/null
```

👉 Discards all data written to it

---

## ⚙️ Example

```bash id="y3k9pq"
echo "data" > /dev/null
```

---

### Result:

* Data disappears

---

## 🔐 Attack Use

Hide output/errors:

```bash id="q8z2vm"
malware_command > /dev/null 2>&1
```

---

👉 Meaning:

* No logs
* No visible output

---

## 🛡️ Defense

* Monitor suspicious silent commands

---

# 🔐 ATTACK 5: ABUSING `/dev/shm` (SHARED MEMORY)

## 🧠 What is it?

```id="n6t4kx"
/dev/shm
```

* Temporary memory storage
* Faster than disk

---

## ⚙️ Attack

```bash id="w2p7lm"
cp malware /dev/shm/
chmod +x /dev/shm/malware
/dev/shm/malware
```

---

## 🔐 Why attackers use it

* Runs in memory
* Less likely to be detected
* Leaves fewer traces

---

## 🛡️ Defense

* Monitor `/dev/shm`
* Restrict execution

---

# 🔐 ATTACK 6: TERMINAL HIJACKING (`/dev/tty`)

## 🧠 What is `/dev/tty`?

Represents terminal

---

## ⚙️ Example

```bash id="p7n3qx"
echo "Hacked" > /dev/tty
```

---

## 🔐 Attack Use

* Inject commands
* Manipulate terminal output

---

## 🛡️ Defense

* Restrict access
* Use secure sessions

---

# ⚠️ WHY `/dev` IS UNIQUE

| Property               | Impact    |
| ---------------------- | --------- |
| Direct hardware access | High risk |
| Kernel interface       | Powerful  |
| Often overlooked       | Dangerous |

---

👉 `/dev` = **low-level control surface**

---

# 🛡️ DEFENSE STRATEGY

---

## 1. Restrict Permissions

* Only root accesses critical devices

---

## 2. Monitor Access

Watch:

* `/dev/sdX`
* `/dev/input`
* `/dev/shm`

---

## 3. Use Security Modules

* SELinux
* AppArmor

---

## 4. Limit Physical Access

* Prevent device abuse

---

# 🧪 RECON COMMANDS

```bash id="z8m3ql"
ls -la /dev
ls -l /dev/sd*
ls -l /dev/input
mount | grep shm
```

---

# 🧠 FINAL MENTAL MODEL

* `/dev` = hardware interface
* Files = devices
* Access = power

---

👉 `/dev` is not storage
👉 It is **control over the machine itself**

---

# 📌 FINAL TRUTH

If attacker controls `/dev`:

* They can read raw disk data
* They can destroy storage
* They can capture input
* They can bypass higher-level controls

👉 `/dev` compromise = **hardware-level control**
