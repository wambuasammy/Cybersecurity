```bash
# =====================================================
# LINUX FILE PERMISSIONS — COMPLETE NOTES WITH EXAMPLES
# =====================================================


# -----------------------------------------------------
# BASIC FILE LISTING
# -----------------------------------------------------

ls
# Lists files in the current directory.

# Example
# file1.txt  script.sh  directory/


# -----------------------------------------------------
# LIST HIDDEN FILES
# -----------------------------------------------------

ls -a
# Lists ALL files including hidden files.
# Hidden files start with a dot (.)

# Example hidden files
# .git
# .bashrc
# .ssh


# -----------------------------------------------------
# VIEW FILE PERMISSIONS
# -----------------------------------------------------

ls -l
# Displays detailed information about files including:
# permissions, owner, group, size, and modification date.

# Example output
# -rwxr-xr--

# Permission breakdown
# -        → file type
# rwx      → owner permissions
# r-x      → group permissions
# r--      → others permissions


# -----------------------------------------------------
# VIEW PERMISSIONS INCLUDING HIDDEN FILES
# -----------------------------------------------------

ls -la
# Combines:
# -l → long listing format (permissions)
# -a → include hidden files

# Example output
# drwxr-xr-x  5 ace ace 4096 Mar 12 .
# drwxr-xr-x  8 ace ace 4096 Mar 12 ..
# drwxr-xr-x  8 ace ace 4096 Mar 12 .git
# -rw-r--r--  1 ace ace  120 Mar 12 README.md


# -----------------------------------------------------
# FILE TYPES
# -----------------------------------------------------

# First character indicates file type

# -  → regular file
# d  → directory
# l  → symbolic link
# c  → character device
# b  → block device
# s  → socket
# p  → named pipe

# Example
# drwxr-xr-x
# d means the item is a directory.


# -----------------------------------------------------
# PERMISSION SYMBOLS
# -----------------------------------------------------

# r → read permission
# w → write permission
# x → execute permission

# Example permission
# rwxr-xr--

# Meaning
# Owner  → read, write, execute
# Group  → read, execute
# Others → read only


# -----------------------------------------------------
# NUMERIC PERMISSIONS
# -----------------------------------------------------

# Permission values

# 7 → rwx
# 6 → rw-
# 5 → r-x
# 4 → r--
# 3 → -wx
# 2 → -w-
# 1 → --x
# 0 → ---


# -----------------------------------------------------
# CHANGING PERMISSIONS WITH chmod
# -----------------------------------------------------

chmod 755 script.sh
# Owner → rwx
# Group → r-x
# Others → r-x

# Result
# -rwxr-xr-x script.sh


chmod 644 file.txt
# Owner → read/write
# Group → read
# Others → read

# Result
# -rw-r--r-- file.txt


chmod 700 private.sh
# Owner → full access
# Group → no access
# Others → no access


# -----------------------------------------------------
# SYMBOLIC PERMISSION CHANGES
# -----------------------------------------------------

chmod u+x script.sh
# Adds execute permission to the owner.


chmod g+w file.txt
# Adds write permission to the group.


chmod o-r file.txt
# Removes read permission from others.


chmod a+x script.sh
# Adds execute permission to all users.


# Permission targets
# u → user (owner)
# g → group
# o → others
# a → all users


# -----------------------------------------------------
# RECURSIVE PERMISSION CHANGES
# -----------------------------------------------------

chmod -R 755 directory/
# Changes permissions for a directory and ALL files inside it.


# -----------------------------------------------------
# FILE OWNERSHIP
# -----------------------------------------------------

sudo chown user file.txt
# Changes the owner of file.txt to "user".

# Example result
# user now owns the file.


sudo chown user:group file.txt
# Changes both owner and group.


sudo chown -R user:group directory/
# Recursively changes ownership for all files inside directory.


# -----------------------------------------------------
# CHANGE GROUP OWNERSHIP
# -----------------------------------------------------

chgrp developers file.txt
# Changes the group ownership to "developers".


chgrp -R developers project/
# Recursively changes group ownership.


# -----------------------------------------------------
# DEFAULT PERMISSIONS (UMASK)
# -----------------------------------------------------

umask
# Displays the default permission mask.

# Example output
# 0022


umask 027
# Sets a stricter default permission mask.
# New files will not be accessible by others.


# -----------------------------------------------------
# SPECIAL PERMISSIONS
# -----------------------------------------------------

# SUID (Set User ID)

chmod u+s file
# Allows the file to run with the owner's privileges.

# Example output
# -rwsr-xr-x


# SGID (Set Group ID)

chmod g+s directory
# Files created in this directory inherit the group.

# Example output
# drwxr-sr-x


# STICKY BIT

chmod +t directory
# Prevents users from deleting files they do not own.

# Example output
# drwxrwxrwt


# Example directory using sticky bit
# /tmp


# -----------------------------------------------------
# VIEW SPECIAL PERMISSIONS
# -----------------------------------------------------

ls -l
# Displays special permissions such as SUID, SGID, or sticky bit.


# -----------------------------------------------------
# ACCESS CONTROL LISTS (ACL)
# -----------------------------------------------------

getfacl file.txt
# Displays ACL permissions for the file.


setfacl -m u:username:rwx file.txt
# Grants a specific user full permissions.


setfacl -x u:username file.txt
# Removes the ACL entry.


# -----------------------------------------------------
# SECURITY BEST PRACTICES
# -----------------------------------------------------

chmod 777 file
# Gives FULL permissions to everyone.
# This is insecure and should generally be avoided.

# Follow the principle of least privilege:
# Only grant the permissions required.
```