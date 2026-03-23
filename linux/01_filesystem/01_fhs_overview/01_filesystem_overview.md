# Filesystem Overview

## 1. Concept
A filesystem is the way an operating system organizes, stores, and retrieves data on disk.

In Linux, everything is treated as a file, including:
- Regular files
- Directories
- Devices
- Processes

## 2. Key Points
- Linux uses a hierarchical structure
- The root directory (`/`) is the starting point
- All files and directories branch from `/`

## 3. Linux Perspective
Unlike Windows (C:, D:), Linux has a single unified tree structure.

Example:
/
├── home
├── etc
├── var

## 4. Practical Examples
- User files are stored in `/home`
- System configs are in `/etc`
- Logs are in `/var/log`

## 5. Commands
pwd
ls /
tree /

## 6. Notes
Understanding filesystem structure is critical for:
- System administration
- Security auditing
- Troubleshooting