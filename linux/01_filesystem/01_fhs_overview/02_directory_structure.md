# Linux Directory Structure

## 1. Concept
Linux follows the Filesystem Hierarchy Standard (FHS), which defines how directories are structured.

## 2. Key Points
- Root (`/`) is the base
- Each directory has a specific purpose
- System and user data are separated

## 3. Key Directories
| Directory | Purpose |
|----------|--------|
| / | Root directory |
| /home | User files |
| /etc | Configuration files |
| /var | Logs and variable data |
| /tmp | Temporary files |
| /usr | User applications |
| /bin | Essential commands |

## 4. Practical Examples
- `/etc/passwd` → user accounts
- `/var/log` → system logs
- `/home/user` → personal files

## 5. Commands
ls /
cd /etc
ls /var/log

## 6. Notes
Each directory will be explored in detail in the next section.