# permissions_ownership.md — Linux Permissions and Ownership

## What Permissions Mean in Linux

Permissions control who can:
- Read files
- Modify files
- Execute files

Every file and directory in Linux has:
- An owner (user)
- A group
- Permissions

---

## Core Concept

Each file has three permission sets:

1. User (owner)
2. Group
3. Others

Displayed using:

ls -l

Example:

-rwxr-xr-- 1 ace dev 123 file.sh

Breakdown:

- rwx → user permissions
- r-x → group permissions
- r-- → others permissions

---

## Permission Types

| Symbol | Meaning |
|--------|--------|
| r | Read |
| w | Write |
| x | Execute |

---

## Permission Structure

Example:

rwxr-xr--

- User: read, write, execute
- Group: read, execute
- Others: read only

---

# Numeric Representation (Very Important)

Permissions can be written in numbers:

| Permission | Value |
|----------|------|
| r | 4 |
| w | 2 |
| x | 1 |

---

## Examples

| Symbolic | Numeric |
|---------|--------|
| rwx | 7 |
| rw- | 6 |
| r-- | 4 |
| --- | 0 |

---

## Example

rwxr-xr-- = 754

---

# chmod — Changing Permissions

## Syntax

chmod [permissions] file

---

## Numeric Mode

chmod 755 script.sh

---

## Symbolic Mode

chmod u+x file.sh  
chmod g-w file.sh  
chmod o+r file.sh  

---

# Ownership

## What Ownership Means

Each file belongs to:
- A user
- A group

---

## View Ownership

ls -l

Example:

-rw-r--r-- 1 ace dev file.txt

- ace → owner
- dev → group

---

# chown — Change Owner

## Syntax

chown user file

Example:

chown root file.txt

---

## Change Owner and Group

chown user:group file.txt

---

# chgrp — Change Group

chgrp dev file.txt

---

# Special Permissions (CRITICAL)

These are heavily used in privilege escalation.

---

## 1. SUID (Set User ID)

When set on a file:
- File runs with owner's privileges

---

## Example

chmod u+s file

---

## Real Example

/bin/passwd

Even normal users can change passwords because:
- It runs as root

---

## Security Risk

If attacker finds SUID binary:
- They may escalate privileges

---

## Find SUID Files

find / -perm -4000 2>/dev/null

---

# 2. SGID (Set Group ID)

When set:
- File runs with group privileges

---

## Example

chmod g+s file

---

## On Directories

- New files inherit group

---

# 3. Sticky Bit

Used on directories:

chmod +t /tmp

---

## Effect

- Only file owner can delete files

---

## Example

/tmp directory

---

## Without Sticky Bit

Anyone could delete others' files

---

# Directory Permissions (Very Important)

Permissions behave differently on directories.

---

## Read (r)

- List files

---

## Write (w)

- Create/delete files

---

## Execute (x)

- Enter directory (cd)

---

## Example

If no execute permission:
- Cannot enter directory

---

# Attack Use

Permissions are a primary attack surface.

---

## 1. Writable Files

If attacker finds:

-rw-rw-rw-

They can:
- Modify file
- Inject malicious code

---

## 2. SUID Exploitation

If SUID binary exists:
- Run it for privilege escalation

---

## 3. Weak Directory Permissions

Writable directories allow:
- Dropping payloads
- Replacing files

---

## 4. Ownership Abuse

If attacker controls ownership:
- They control file behavior

---

# Defense

## 1. Least Privilege

- Only give necessary permissions

---

## 2. Audit Permissions

Check:

find / -type f -perm -777

---

## 3. Monitor SUID Files

find / -perm -4000

---

## 4. Secure Sensitive Files

/etc/shadow must be restricted

---

# Practical Exercises

## Exercise 1

Check permissions:

ls -l

---

## Exercise 2

Change permissions:

chmod 755 test.sh

---

## Exercise 3

Change ownership:

chown ace test.sh

---

## Exercise 4

Find SUID files:

find / -perm -4000 2>/dev/null

---

# Mental Model

Permissions define:
- Who can access
- What actions are allowed
- How secure the system is

---

# Final Insight

If permissions are weak:
- System is compromised

If permissions are strong:
- System is controlled

Permissions are the foundation of Linux security.