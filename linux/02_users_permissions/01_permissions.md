# Linux Filesystem Commands

## Introduction

The Linux filesystem organizes files and directories in a hierarchical structure that begins at the **root directory (`/`)**. All files, directories, devices, and system resources are located somewhere within this structure.

Understanding how to navigate and manipulate the filesystem is fundamental for Linux administration, cybersecurity operations, penetration testing, and digital forensics.

Linux provides many commands that allow users to explore, create, move, copy, and manage files efficiently.

---

## Objective

The objective of these notes is to understand how to interact with the Linux filesystem using essential command-line tools.

By the end of these notes, you will understand how to:

- navigate directories
- list and inspect files
- create and remove files and directories
- search for files
- analyze disk usage
- examine file metadata
- create symbolic links

---

## Table of Contents

- [Working Directory Commands](#working-directory-commands)
- [Listing Files](#listing-files)
- [Directory Navigation](#directory-navigation)
- [Creating Files and Directories](#creating-files-and-directories)
- [Copying Files](#copying-files)
- [Moving and Renaming Files](#moving-and-renaming-files)
- [Removing Files](#removing-files)
- [Visualizing Directory Structure](#visualizing-directory-structure)
- [Searching for Files](#searching-for-files)
- [Fast File Search with locate](#fast-file-search-with-locate)
- [File Metadata](#file-metadata)
- [Disk Usage Analysis](#disk-usage-analysis)
- [Checking Disk Space](#checking-disk-space)
- [Creating Links](#creating-links)
- [Identifying File Types](#identifying-file-types)
- [Conclusion](#conclusion)

---

# Working Directory Commands

## pwd — Print Working Directory

Displays the current directory you are working in.

Command:

```
pwd
```

Example output:

```
/home/ace/Documents/Cybersecurity/linux/notes
```

Explanation:

- `pwd` prints the **absolute path** of your current location in the filesystem.

---

# Listing Files

## ls — List Directory Contents

Lists files and directories inside the current directory.

Command:

```
ls
```

Example output:

```
filesystem.md  networking.md  permissions.md  processes.md
```

### Useful Options

Detailed file listing:

```
ls -l
```

Shows:

- file permissions
- owner
- group
- file size
- modification date

List hidden files:

```
ls -a
```

Hidden files begin with `.` such as `.git` or `.bashrc`.

Combine both options:

```
ls -la
```

Displays hidden files with detailed information.

---

# Directory Navigation

## cd — Change Directory

Used to move between directories.

Move one directory up:

```
cd ..
```

Move to a specific directory:

```
cd /home/ace/Documents
```

Move to the home directory:

```
cd ~
```

---

# Creating Files and Directories

## mkdir — Make Directory

Creates a new directory.

Example:

```
mkdir test_directory
```

Creates a folder named `test_directory`.

Create nested directories:

```
mkdir -p labs/filesystem
```

The `-p` option automatically creates parent directories.

---

## touch — Create File

Creates an empty file.

Example:

```
touch example.txt
```

Creates a file named `example.txt`.

---

# Copying Files

## cp — Copy Files or Directories

Copies files from one location to another.

Example:

```
cp file.txt backup.txt
```

Creates a duplicate file.

Copy directories recursively:

```
cp -r folder1 folder2
```

The `-r` option enables recursive copying.

---

# Moving and Renaming Files

## mv — Move or Rename Files

Rename a file:

```
mv oldname.txt newname.txt
```

Move a file:

```
mv file.txt ../labs/
```

This moves `file.txt` to another directory.

---

# Removing Files

## rm — Remove Files

Deletes files permanently.

Example:

```
rm file.txt
```

Delete directories recursively:

```
rm -r directory_name
```

⚠️ Warning:

Linux does **not use a recycle bin** for the `rm` command. Deleted files are permanently removed.

---

# Visualizing Directory Structure

## tree — Display Directory Structure

Displays files and directories in a tree-like format.

Command:

```
tree
```

Example output:

```
Cybersecurity
└── linux
    ├── labs
    ├── notes
    │   ├── filesystem.md
    │   ├── networking.md
    │   ├── permissions.md
    │   └── processes.md
    └── tools
```

Explanation:

The `tree` command is useful for:

- visualizing project structures
- documenting repository layouts
- auditing directory structures

Install if missing:

```
sudo apt install tree
```

---

# Searching for Files

## find — Search for Files

The `find` command searches the filesystem.

Example:

```
find . -name "filesystem.md"
```

Explanation:

| Component | Meaning |
|------|------|
`.` | search from current directory |
`-name` | search by filename |
`filesystem.md` | target file |

Example result:

```
./linux/notes/filesystem.md
```

Search for all markdown files:

```
find . -name "*.md"
```

Search the entire system:

```
sudo find / -name "ssh_config"
```

---

# Fast File Search with locate

The `locate` command searches a **database of indexed files**, making it much faster than `find`.

Example:

```
locate filesystem.md
```

Update the database:

```
sudo updatedb
```

---

# File Metadata

## stat — File Information

Displays detailed information about a file.

Example:

```
stat filesystem.md
```

Example output:

```
File: filesystem.md
Size: 2048
Access: 2026-03-10
Modify: 2026-03-10
Owner: ace
```

Useful for:

- file auditing
- forensic analysis
- metadata inspection

---

# Disk Usage Analysis

## du — Disk Usage

Shows how much disk space files or directories use.

Example:

```
du -h
```

Options:

| Option | Meaning |
|------|------|
`du` | disk usage |
`-h` | human readable sizes |

Example output:

```
4.0K filesystem.md
4.0K networking.md
```

Check folder size:

```
du -sh linux
```

---

# Checking Disk Space

## df — Disk Free Space

Displays available disk space on mounted filesystems.

Example:

```
df -h
```

Example output:

```
Filesystem      Size  Used Avail Use%
/dev/sda1        40G   10G   28G  27%
```

Explanation:

| Option | Meaning |
|------|------|
`df` | disk free |
`-h` | human readable format |

Useful for monitoring storage capacity.

---

# Creating Links

## ln — Create Links

Creates links between files.

Example:

```
ln -s filesystem.md fs.md
```

Explanation:

| Component | Meaning |
|------|------|
`ln` | link command |
`-s` | symbolic link |
`filesystem.md` | original file |
`fs.md` | link name |

Symbolic links are widely used in system configuration and package management.

---

# Identifying File Types

## file — Determine File Type

Identifies the actual type of a file based on its contents.

Example:

```
file filesystem.md
```

Example output:

```
filesystem.md: ASCII text
```

This command does **not rely on file extensions**, making it useful in security investigations.

---

# Conclusion

Linux filesystem commands are essential tools for navigating, managing, and auditing system files.

In these notes we explored how to:

- navigate directories
- list files and inspect permissions
- create and manage files
- search for files
- analyze disk usage
- inspect file metadata
- create symbolic links

Mastering these commands is fundamental for Linux administration, security engineering, and penetration testing workflows.