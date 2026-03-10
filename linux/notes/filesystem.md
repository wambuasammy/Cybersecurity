# Linux Filesystem Commands

The Linux filesystem organizes files and directories in a hierarchical structure that starts from the root directory `/`.

Understanding how to navigate and manipulate the filesystem is fundamental for system administration, security engineering, and penetration testing.

---

## 1. pwd — Print Working Directory

Displays the current directory you are working in.

Example:

pwd

Example output:

/home/ace/Documents/Cybersecurity/linux/notes

Explanation:
- `pwd` prints the absolute path of your current location in the filesystem.

---

## 2. ls — List Directory Contents

Lists files and directories inside the current directory.

Example:

ls

Example output:

filesystem.md  networking.md  permissions.md  processes.md

Useful options:

ls -l

Shows detailed information such as permissions, owner, size, and modification date.

ls -a

Displays hidden files (files starting with `.`).

ls -la

Shows both hidden files and detailed information.

---

## 3. cd — Change Directory

Used to move between directories.

Example:

cd ..

Moves one level up in the directory tree.

Example:

cd /home/ace/Documents

Moves directly to a specific path.

Example:

cd ~

Moves to the user's home directory.

---

## 4. mkdir — Make Directory

Creates a new directory.

Example:

mkdir test_directory

This creates a new folder called `test_directory`.

Example:

mkdir -p labs/filesystem

The `-p` option creates parent directories if they do not exist.

---

## 5. touch — Create File

Creates an empty file.

Example:

touch example.txt

This creates a file named `example.txt`.

---

## 6. cp — Copy Files or Directories

Copies files from one location to another.

Example:

cp file.txt backup.txt

This creates a copy of `file.txt` named `backup.txt`.

Example:

cp -r folder1 folder2

The `-r` option allows copying directories recursively.

---

## 7. mv — Move or Rename Files

Moves files or renames them.

Example (rename file):

mv oldname.txt newname.txt

Example (move file):

mv file.txt ../labs/

This moves `file.txt` to the labs directory.

---

## 8. rm — Remove Files

Deletes files.

Example:

rm file.txt

Deletes `file.txt`.

Example:

rm -r directory_name

The `-r` option removes directories recursively.

⚠️ Warning:
`rm` permanently deletes files. There is no recycle bin in Linux.



---

---

## 9. tree — Display Directory Structure

Displays directories and files in a tree-like format.

Example:

tree

Example output:

Cybersecurity
└── linux
    ├── labs
    ├── notes
    │   ├── filesystem.md
    │   ├── networking.md
    │   ├── permissions.md
    │   └── processes.md
    └── tools

Explanation:
- Useful for visualizing project structures.
- Often used when documenting repositories.

If the command is not installed:

sudo apt install tree

---

## 10. find — Search for Files

The `find` command searches for files and directories in a filesystem.

Example:

find . -name "filesystem.md"

Explanation:

- `.` → search from the current directory
- `-name` → search by filename
- `"filesystem.md"` → target file

Example result:

./linux/notes/filesystem.md

Example: find all markdown files

find . -name "*.md"

Example: search entire system

sudo find / -name "ssh_config"

---

## 11. locate — Fast File Search

The `locate` command searches a database of indexed files.

Example:

locate filesystem.md

This is faster than `find` because it uses a pre-built file database.

Update the database:

sudo updatedb

---

## 12. stat — File Metadata

Displays detailed information about a file.

Example:

stat filesystem.md

Example output:

File: filesystem.md
Size: 2048
Access: 2026-03-10
Modify: 2026-03-10
Owner: ace

Explanation:
- Shows file size
- Shows timestamps
- Shows ownership information

Useful in auditing and forensic analysis.

---

## 13. du — Disk Usage

The `du` command shows how much disk space files or directories use.

Example:

du -h

Explanation:

- `du` → disk usage
- `-h` → human readable format

Example output:

4.0K filesystem.md
4.0K networking.md

Example: check folder size

du -sh linux

---

## 14. df — Disk Free Space

Displays available disk space on mounted filesystems.

Example:

df -h

Example output:

Filesystem      Size  Used Avail Use%
/dev/sda1        40G   10G   28G  27%

Explanation:
- `df` → disk free
- `-h` → human readable sizes

Useful for monitoring storage usage.

---

## 15. ln — Create Links

The `ln` command creates links between files.

Example:

ln -s filesystem.md fs.md

Explanation:

- `ln` → link command
- `-s` → create symbolic link
- `filesystem.md` → original file
- `fs.md` → link name

This creates a symbolic reference to the original file.

Symbolic links are commonly used in Linux system configuration.

---

## 16. file — Identify File Type

The `file` command determines the actual type of a file.

Example:

file filesystem.md

Example output:

filesystem.md: ASCII text

This command examines the file contents instead of relying on file extensions.

Useful in security analysis and malware investigations.

---

## Summary

These commands form the core of Linux filesystem interaction and are used daily by engineers, administrators, and security professionals.
