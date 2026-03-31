# Linux Users and Groups

## Table of Contents

- [Objective](#objective)
- [Overview](#overview)
- [User Identification Commands](#user-identification-commands)
- [User Management](#user-management)
- [Group Management](#group-management)
- [Privilege Management](#privilege-management)
- [Important System Files](#important-system-files)
- [Security Relevance](#security-relevance)
- [Conclusion](#conclusion)

---

## Objective

The objective of these notes is to understand how Linux manages **users and groups**, how administrators create and modify accounts, and how permissions and privileges are controlled.  

Understanding user and group management is essential for **system administration, access control, and cybersecurity operations**, as many security issues involve misconfigured privileges or improper account management.

---

## Overview

Linux is a **multi-user operating system**, meaning multiple users can access and interact with the same system.

To manage access and permissions effectively, Linux organizes accounts using **users** and **groups**.

| Concept | Description |
|--------|-------------|
User | Represents an individual account on the system |
Group | A collection of users who share common permissions |

This structure allows administrators to control access to:

- files  
- directories  
- system resources  

---

## User Identification Commands

These commands help identify the current user and inspect user information.

### whoami

Displays the username of the currently logged-in user.

Example:

`whoami`

Example output:

`ace`

---

### id

Displays detailed information about a user including **User ID (UID)** and **Group ID (GID)**.

Example:

`id`

Example output:

`uid=1000(ace) gid=1000(ace) groups=1000(ace),27(sudo)`

| Field | Meaning |
|------|--------|
UID | Unique identifier for a user |
GID | Primary group identifier |
Groups | Additional groups the user belongs to |

---

### groups

Displays the groups that a user belongs to.

Example:

`groups`

Example output:

`ace sudo`

This means the user **ace** belongs to the **sudo group**.

---

### who

Displays users currently logged into the system.

Example:

`who`

---

### w

Displays logged-in users and what they are currently doing.

Example:

`w`

This command provides information such as:

- active users  
- running processes  
- system load  

---

## User Management

These commands allow administrators to create, modify, and remove user accounts.

### useradd

Creates a new user account.

Example:

`sudo useradd analyst`

To create the user with a home directory:

`sudo useradd -m analyst`

---

### passwd

Sets or changes a user's password.

Example:

`sudo passwd analyst`

---

### usermod

Modifies an existing user account.

Example: adding a user to the **sudo** group.

`sudo usermod -aG sudo analyst`

| Option | Meaning |
|------|--------|
-a | Append the user to a group |
-G | Specify the group |

---

### userdel

Deletes a user account.

Example:

`sudo userdel analyst`

To remove the user and their home directory:

`sudo userdel -r analyst`

---

## Group Management

Groups allow administrators to manage permissions for multiple users at once.

### groupadd

Creates a new group.

Example:

`sudo groupadd security`

---

### groupmod

Modifies group settings.

Example: rename a group.

`sudo groupmod -n cybersecurity security`

---

### groupdel

Deletes a group.

Example:

`sudo groupdel cybersecurity`

---

### gpasswd

Manages group membership.

Example:

`sudo gpasswd -a analyst security`

This command adds the user **analyst** to the **security group**.

---

## Privilege Management

These commands control administrative privileges.

### sudo

Allows a user to execute commands with elevated privileges.

Example:

`sudo apt update`

Users must be defined in the **sudoers configuration**.

---

### su

Switches to another user account.

Example:

`su analyst`

To switch to the root user:

`su -`

---

### visudo

Safely edits the **sudoers configuration file**.

Example:

`sudo visudo`

This command prevents syntax errors that could break administrative access.

---

## Important System Files

Linux stores user and group information in several critical system files located in the `/etc` directory.

These files are essential for authentication, privilege control, and user management.

---

### /etc/passwd

This file stores **basic user account information**.

Example entry:

`ace:x:1000:1000:Ace:/home/ace:/bin/bash`

| Field | Description |
|------|-------------|
Username | Login name of the user |
Password Placeholder | Usually `x`, meaning the password is stored in `/etc/shadow` |
UID | Unique user ID |
GID | Primary group ID |
Comment | Optional user description |
Home Directory | User home directory |
Shell | Default login shell |

Important note:  
This file is **world-readable**, meaning any user on the system can view it.

---

### /etc/shadow

This file stores **encrypted password hashes**.

Example entry:

`ace:$6$hashedpassword:19800:0:99999:7:::`

| Field | Description |
|------|-------------|
Username | User account name |
Password Hash | Encrypted password |
Last Change | Days since last password change |
Min Age | Minimum days before password change |
Max Age | Maximum password lifetime |
Warning | Days before password expiration warning |

This file is **restricted to root access**.

---

### /etc/group

This file defines **groups and group membership**.

Example entry:

`sudo:x:27:ace`

| Field | Description |
|------|-------------|
Group Name | Name of the group |
Password Placeholder | Usually unused |
GID | Group ID |
Members | Users belonging to the group |

---

### /etc/sudoers

Defines which users can execute commands with **administrative privileges**.

Example rule:

`%sudo ALL=(ALL:ALL) ALL`

Meaning:

- Members of the **sudo group**
- Can execute commands
- As any user
- On any host

This file should always be edited using:

`visudo`

---

## Security Relevance

Users and groups are fundamental to **Linux security**.

They control:

- file access permissions  
- administrative privileges  
- system resource access  

Misconfigured users or groups can lead to **privilege escalation vulnerabilities**, making this topic essential for both **system administration and cybersecurity professionals**.

---

## Conclusion

Linux user and group management provides the foundation for **access control and privilege management** within the operating system.

Administrators use tools such as `useradd`, `usermod`, and `groupadd` to manage accounts, while configuration files like `/etc/passwd`, `/etc/shadow`, and `/etc/group` store critical authentication data.

Understanding how these components interact is essential for maintaining **secure Linux environments**, preventing unauthorized access, and identifying potential privilege escalation vulnerabilities.