# file_types.md — Linux File Types

## What File Types Mean in Linux

In Linux, everything is treated as a file.

This includes:
- Regular files
- Directories
- Hardware devices
- Network sockets
- Processes (in some cases)

Understanding file types is essential for:
- System administration
- Security auditing
- Exploitation and defense

---

## Core Concept

Each file in Linux has a type.

You can identify the type using:

ls -l

Example output:

-rw-r--r-- 1 ace ace 123 file.txt
drwxr-xr-x 2 ace ace 4096 folder
lrwxrwxrwx 1 ace ace link -> target

The first character defines the file type.

---

## File Type Indicators

| Symbol | Type |
|------|------|
| - | Regular file |
| d | Directory |
| l | Symbolic link |
| c | Character device |
| b | Block device |
| s | Socket |
| p | Named pipe |

---

# 1. Regular Files (-)

## What they are

Standard files that store data.

Examples:
- Text files
- Scripts
- Binaries

---

## Examples

file.txt  
script.sh  
program  

---

## Commands

file file.txt  
cat file.txt  

---

## Security Relevance

- Can contain malicious scripts
- Can be executable
- May hide payloads

Attackers often:
- Upload scripts
- Replace binaries
- Modify configuration files

---

# 2. Directories (d)

## What they are

Containers that hold files and other directories.

---

## Examples

/home  
/etc  
/var  

---

## Commands

ls -ld /home  
cd /home  

---

## Security Relevance

- Control access to files
- Permission misconfiguration leads to privilege escalation

Writable directories are dangerous.

---

# 3. Symbolic Links (l)

## What they are

Pointers to another file or directory.

---

## Example

ln -s /etc/passwd mylink  

---

## Output

lrwxrwxrwx mylink -> /etc/passwd  

---

## Security Relevance

Used in attacks:

- Symlink attacks
- Redirecting programs to sensitive files

Example attack:
- Trick a program into writing to /etc/passwd

---

# 4. Character Devices (c)

## What they are

Devices that handle data as a stream.

---

## Examples

/dev/tty  
/dev/null  

---

## Commands

ls -l /dev  

---

## Security Relevance

- Can be abused for input/output manipulation
- /dev/null can hide output

---

# 5. Block Devices (b)

## What they are

Devices that handle data in blocks.

---

## Examples

/dev/sda  
/dev/sda1  

---

## Commands

lsblk  

---

## Security Relevance

- Direct disk access
- Can be used for data extraction or corruption

---

# 6. Sockets (s)

## What they are

Used for inter-process communication.

---

## Example

Services communicating locally

---

## Commands

ss -l  

---

## Security Relevance

- Used by services
- Can expose local communication channels

---

# 7. Named Pipes (p)

## What they are

Special files for communication between processes.

---

## Example

mkfifo mypipe  

---

## Security Relevance

- Can be used for data transfer between processes
- Potential for misuse in scripts

---

# How to Identify File Types

## Using ls -l

ls -l  

First character shows type.

---

## Using file command

file filename  

Shows detailed type information.

---

## Using stat

stat filename  

Shows metadata and type.

---

# Attack Use

Attackers use file types to:

- Hide payloads in regular files
- Abuse symbolic links
- Access devices
- Communicate via sockets

---

## Example Attack: Symlink Exploit

1. Create symlink:

ln -s /etc/passwd exploit  

2. Trick program into writing to it

Result:
- System file modified

---

# Defense

## 1. Monitor File Types

Look for:
- Unexpected symlinks
- Suspicious executables

---

## 2. Restrict Permissions

Especially for:
- /tmp
- /var/tmp

---

## 3. Validate File Usage

Programs should:
- Avoid following unsafe symlinks
- Validate file paths

---

## Practical Exercises

### Exercise 1

List file types:

ls -l  

---

### Exercise 2

Create symlink:

ln -s /etc/passwd testlink  

---

### Exercise 3

Identify file type:

file /bin/ls  

---

### Exercise 4

Check metadata:

stat file.txt  

---

# Mental Model

File types define:
- How data is stored
- How the system interacts with it
- How attackers can abuse it

---

# Final Insight

If you understand file types:
- You understand how Linux works internally
- You can detect abnormal behavior
- You can prevent common attack techniques

File types are not just structure — they are behavior.