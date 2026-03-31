# navigation_management.md — Linux Navigation and File Management

## What Navigation Means in Linux

Navigation in Linux is the process of moving through the filesystem, locating files, and managing directories using the command line.

Unlike graphical systems, Linux relies heavily on terminal-based navigation for efficiency and control.

---

## Core Concept

Linux uses a hierarchical filesystem starting from the root directory:

/

All navigation happens relative to:
- Absolute paths (starting from /)
- Relative paths (based on current location)

---

## Understanding Paths

### Absolute Path

Full path from root:

/home/ace/Documents

### Relative Path

Path from current directory:

Documents  
../Documents  

---

## Key Navigation Commands

### 1. pwd — Print Working Directory

Shows your current location in the filesystem.

pwd

Example output:

/home/ace/Documents

---

### 2. ls — List Directory Contents

Displays files and directories.

Basic:

ls

Detailed view:

ls -la

Key options:
- -l → long format
- -a → include hidden files
- -h → human-readable sizes

---

### 3. cd — Change Directory

Move between directories.

Go to home:

cd ~

Go up one level:

cd ..

Go to specific path:

cd /etc

Go to previous directory:

cd -

---

## File and Directory Operations

### 1. mkdir — Create Directory

mkdir testdir

Create nested directories:

mkdir -p dir1/dir2/dir3

---

### 2. touch — Create File

touch file.txt

Used for:
- Creating empty files
- Updating timestamps

---

### 3. cp — Copy Files

Copy file:

cp file.txt backup.txt

Copy directory:

cp -r dir1 dir2

---

### 4. mv — Move or Rename

Rename:

mv old.txt new.txt

Move file:

mv file.txt /tmp/

---

### 5. rm — Remove Files

Delete file:

rm file.txt

Delete directory:

rm -r dir/

Force delete:

rm -rf dir/

---

## Viewing File Contents

### cat

Display entire file:

cat file.txt

---

### less

View file page by page:

less file.txt

---

### head / tail

View first lines:

head file.txt

View last lines:

tail file.txt

Monitor live logs:

tail -f /var/log/syslog

---

## Hidden Files

Files starting with . are hidden.

Example:

.bashrc

View them:

ls -la

---

## Tab Completion

Use TAB key to:
- Auto-complete commands
- Reduce typing errors
- Speed up navigation

---

## Attack Use

Attackers rely heavily on navigation commands to explore systems.

### 1. System Enumeration

ls -la /home  
ls -la /var  
ls -la /etc  

---

### 2. Finding Sensitive Files

cat /etc/passwd  
cat /etc/shadow  

---

### 3. Locating Writable Directories

find / -writable -type d 2>/dev/null  

---

### 4. Deleting Evidence

rm /var/log/auth.log  

---

## Defense

### 1. Restrict Permissions

Limit access to sensitive directories.

---

### 2. Monitor Commands

Use logging tools to track:
- File access
- Command execution

---

### 3. Audit File Changes

Track modifications in:
- /etc
- /var
- /home

---

## Practical Exercises

### Exercise 1

Navigate to /etc and list contents:

cd /etc  
ls -la  

---

### Exercise 2

Create a directory and file:

mkdir test  
cd test  
touch file.txt  

---

### Exercise 3

Copy and move file:

cp file.txt file_copy.txt  
mv file_copy.txt /tmp  

---

### Exercise 4

Delete directory:

cd ..  
rm -r test  

---

## Mental Model

Navigation commands allow you to:
- Move through the system
- Discover structure
- Interact with files

---

## Final Insight

If you cannot navigate confidently:
- You cannot administer systems
- You cannot investigate incidents
- You cannot perform security assessments

Navigation is the foundation of all Linux operations.