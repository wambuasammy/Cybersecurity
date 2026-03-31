# 📁 boot.md — The `/boot` Directory 

## 🧠 What `/boot` REALLY is

`/boot` contains the files required to **start (boot) the Linux system**

👉 This includes:

* The Linux kernel
* Bootloader files (GRUB)
* Initial RAM filesystem (initramfs)

---

## 🧠 What Happens When You Power On (FULL FLOW)

Understanding `/boot` requires understanding **boot sequence**

---

### Step 1: Power On

* BIOS/UEFI starts
* Looks for bootable device

---

### Step 2: Bootloader Loads (GRUB)

From `/boot`:

```id="p4z8k1"
/boot/grub/
```

👉 GRUB = program that decides which OS/kernel to load

---

### Step 3: Kernel Loads

From `/boot`:

```id="j9f3t6"
/boot/vmlinuz-*
```

👉 This is the **Linux kernel**

---

### Step 4: initramfs Loads

```id="m2q8xp"
/boot/initrd.img-*
```

👉 Temporary environment that prepares the system

---

### Step 5: System Starts

* Root filesystem mounts
* Services start

---

👉 `/boot` = **the starting point of everything**

---

# 🏗️ KEY FILES IN `/boot`

```id="x8m1rz"
/boot/vmlinuz-*        # Kernel
/boot/initrd.img-*     # Initial RAM filesystem
/boot/grub/            # Bootloader config
/boot/config-*         # Kernel configuration
```

---

# 🔐 WHY `/boot` IS EXTREMELY SENSITIVE

Because it runs:

👉 BEFORE security controls start

* No user authentication yet
* No logging yet
* No monitoring yet

---

👉 If attacker controls `/boot`:

* They control system from startup

---

# 🔐 ATTACK 1: KERNEL TAMPERING

## 🧠 Idea

Replace or modify kernel

---

## ⚙️ What attacker does

Replace:

```id="q6r1np"
/boot/vmlinuz-*
```

With malicious kernel

---

## 🔐 What happens next

* System boots using attacker’s kernel
* Kernel can:

  * Hide processes
  * Disable security
  * Grant root access

---

👉 This is **rootkit-level compromise**

---

## 🛡️ Defense

* Secure `/boot` permissions
* Use Secure Boot

---

# 🔐 ATTACK 2: GRUB CONFIG MANIPULATION

## 🧠 What is GRUB?

Bootloader config located in:

```id="8p4wzn"
/boot/grub/grub.cfg
```

---

## ⚙️ Attack: Boot into Single User Mode

Attacker modifies kernel parameters:

```id="k3m9zr"
init=/bin/bash
```

---

## 🔐 What happens

* System boots directly into root shell
* No password required

---

👉 Full system access

---

## 🛡️ Defense

* Set GRUB password
* Restrict physical access

---

# 🔐 ATTACK 3: DISABLING SECURITY CONTROLS

## ⚙️ Attacker modifies boot parameters:

```id="x2k7mz"
selinux=0
apparmor=0
```

---

## 🔐 What happens

* Security modules disabled
* System becomes easier to exploit

---

## 🛡️ Defense

* Lock bootloader
* Monitor boot configs

---

# 🔐 ATTACK 4: INITRAMFS BACKDOOR

## 🧠 What is initramfs?

Temporary system used before real OS loads

---

## ⚙️ Attack

Modify:

```id="7z5kqp"
/boot/initrd.img-*
```

---

## 🔐 What happens

* Malicious code runs before OS
* Can:

  * Steal credentials
  * Install rootkits
  * Modify system silently

---

👉 Extremely stealthy attack

---

## 🛡️ Defense

* Verify integrity of initramfs
* Use signed images

---

# 🔐 ATTACK 5: PHYSICAL ACCESS ATTACK

## ⚙️ Scenario

Attacker has physical access:

1. Reboots system
2. Enters GRUB menu
3. Edits boot parameters

---

## 🔐 Result

* Gains root shell
* No password required

---

👉 Physical access = full compromise (if not protected)

---

## 🛡️ Defense

* BIOS/UEFI password
* GRUB password
* Disable boot from USB

---

# ⚠️ WHY `/boot` IS UNIQUE

| Property         | Impact                |
| ---------------- | --------------------- |
| Runs before OS   | No protections active |
| Controls kernel  | Full system control   |
| Rarely monitored | Easy to overlook      |

---

👉 `/boot` is **pre-security attack surface**

---

# 🛡️ DEFENSE STRATEGY

---

## 1. Restrict Permissions

```bash id="g6n2pl"
chmod 700 /boot
```

---

## 2. Enable Secure Boot

* Only trusted kernels allowed
* Prevents tampering

---

## 3. Protect GRUB

* Set password
* Disable editing

---

## 4. Monitor Integrity

```bash id="t8p4xr"
sha256sum /boot/vmlinuz-*
```

---

## 5. Control Physical Access

* Lock system
* Secure BIOS

---

# 🧪 RECON COMMANDS

```bash id="r7y2mq"
ls -la /boot
cat /boot/grub/grub.cfg
ls /boot/vmlinuz*
ls /boot/initrd*
```

---

# 🧠 FINAL MENTAL MODEL

* `/boot` = system startup
* Kernel = system brain
* GRUB = decision maker

---

👉 If `/boot` is compromised:

* System is compromised before it even starts

---

# 📌 FINAL TRUTH

If attacker controls `/boot`:

* They bypass authentication
* They disable security
* They gain root access instantly
* They install invisible persistence

👉 `/boot` compromise = **pre-OS total control**
