# searching_filtering.md — Linux Searching and Filtering

## What Searching Means in Linux

Searching is the ability to locate:
- Files
- Content inside files
- System artifacts

Filtering is narrowing results to find exactly what you need.

---

## Core Concept

Linux provides powerful tools to:
- Search by name
- Search by permissions
- Search by ownership
- Search inside files

The two most important tools:

- find → search filesystem
- grep → search inside files

---

# 1. find — File Search Engine

## What it does

Searches for files and directories based on conditions.

---

## Basic Syntax

find [path] [condition]

---

## Examples

### Find by Name

find /home -name file.txt

---

### Case Insensitive

find /home -iname file.txt

---

### Find by Type

find / -type f     # files  
find / -type d     # directories  

---

### Find by Permission

find / -perm 777

---

### Find SUID Files

find / -perm -4000 2>/dev/null

---

### Find Writable Files

find / -writable 2>/dev/null

---

### Find by Owner

find / -user ace

---

### Find Recently Modified Files

find / -mtime -1

---

## Execute Commands on Results

find /tmp -name "*.sh" -exec ls -l {} \;

---

# 2. grep — Content Search

## What it does

Searches inside files for text patterns.

---

## Basic Syntax

grep "text" file

---

## Examples

### Search in File

grep "root" /etc/passwd

---

### Case Insensitive

grep -i "error" logfile.txt

---

### Recursive Search

grep -r "password" /etc

---

### Show Line Numbers

grep -n "root" /etc/passwd

---

### Invert Match

grep -v "false" /etc/passwd

---

# 3. Combining find and grep

## Powerful Combination

find / -type f -name "*.log" -exec grep "error" {} \; 2>/dev/null

---

## Meaning

- find all log files
- search for "error" inside them

---

# 4. locate — Fast Search

## What it does

Searches using a pre-built database.

---

## Example

locate passwd

---

## Update Database

updatedb

---

## Limitation

- May not show recent files

---

# 5. which and whereis

## which

Find command location:

which ls

---

## whereis

Find binary, source, manual:

whereis ls

---

# Attack Use

Attackers rely heavily on searching tools.

---

## 1. Find Sensitive Files

find / -name "*.key" 2>/dev/null  
find / -name "*.conf" 2>/dev/null  

---

## 2. Find Credentials

grep -r "password" /etc  
grep -r "secret" /home  

---

## 3. Find SUID Binaries

find / -perm -4000 2>/dev/null  

---

## 4. Find Writable Locations

find / -writable 2>/dev/null  

---

## 5. Find Logs

find /var/log -type f  

---

# Defense

## 1. Restrict Access

Limit read permissions on sensitive files.

---

## 2. Monitor Commands

Track usage of:
- find
- grep

---

## 3. Secure Credentials

Avoid storing passwords in plain text.

---

## 4. Audit System Regularly

Search for:
- world-writable files
- unexpected binaries

---

# Practical Exercises

## Exercise 1

Find all .sh files:

find /home -name "*.sh"

---

## Exercise 2

Search for root user:

grep "root" /etc/passwd

---

## Exercise 3

Find writable files:

find / -writable 2>/dev/null

---

## Exercise 4

Search logs for errors:

grep -r "error" /var/log

---

# Mental Model

Searching tools allow you to:
- Discover system structure
- Identify vulnerabilities
- Locate sensitive data

---

# Final Insight

If you master find and grep:
- You can navigate any system quickly
- You can discover hidden data
- You can detect misconfigurations

Searching is not just convenience — it is power.