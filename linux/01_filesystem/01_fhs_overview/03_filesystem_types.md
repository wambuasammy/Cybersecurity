# Filesystem Types

## 1. Concept
A filesystem type defines how data is stored and managed on a disk.

## 2. Common Linux Filesystems
- ext4 (most common)
- xfs
- btrfs

## 3. Key Points
- Different filesystems have different performance and features
- Linux supports multiple filesystem types
- Filesystems are mounted to directories

## 4. Linux Perspective
Disks are mounted into the directory tree.

Example:
Mounting a disk to /mnt

## 5. Commands
df -h
mount
lsblk

## 6. Notes
Understanding filesystem types is important for:
- Storage management
- Performance tuning
- System recovery