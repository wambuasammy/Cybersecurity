# archiving_compression.md — Linux Archiving and Compression

## What Archiving and Compression Mean

Archiving combines multiple files into a single file.

Compression reduces file size to save space and improve transfer speed.

---

## Core Concept

- Archiving → groups files (tar)
- Compression → reduces size (gzip, bzip2, xz)

They are often used together.

---

# 1. tar — Archiving Tool

## What it does

Creates and extracts archive files.

---

## Basic Syntax

tar [options] archive_name files

---

## Common Options

| Option | Meaning |
|--------|--------|
| -c | Create archive |
| -x | Extract archive |
| -v | Verbose (show progress) |
| -f | Specify file |
| -t | List contents |

---

## Create Archive

tar -cvf archive.tar file1 file2

---

## Extract Archive

tar -xvf archive.tar

---

## List Contents

tar -tvf archive.tar

---

## Archive Directory

tar -cvf backup.tar /home/ace

---

# 2. gzip — Compression

## What it does

Compresses files using .gz format.

---

## Compress File

gzip file.txt

Result:
file.txt.gz

---

## Decompress

gunzip file.txt.gz

---

## Keep Original File

gzip -k file.txt

---

# 3. bzip2 — Stronger Compression

## What it does

Provides better compression than gzip (slower).

---

## Compress

bzip2 file.txt

---

## Decompress

bunzip2 file.txt.bz2

---

# 4. xz — High Compression

## What it does

Offers very high compression ratio.

---

## Compress

xz file.txt

---

## Decompress

unxz file.txt.xz

---

# 5. Combining tar and Compression

## Create Compressed Archive (gzip)

tar -czvf archive.tar.gz folder/

---

## Extract

tar -xzvf archive.tar.gz

---

## Using bzip2

tar -cjvf archive.tar.bz2 folder/

---

## Using xz

tar -cJvf archive.tar.xz folder/

---

# 6. Viewing Without Extracting

## View Contents

tar -tvf archive.tar

---

## Extract Single File

tar -xvf archive.tar file.txt

---

# Attack Use

Archiving tools are used by attackers for:

---

## 1. Data Exfiltration

Compress sensitive data:

tar -czvf data.tar.gz /etc /home

---

## 2. Stealth Transfer

Smaller files:
- Faster upload
- Harder to detect

---

## 3. Payload Packaging

Bundle malicious files into one archive.

---

## 4. Log Removal and Compression

Compress logs before exfiltration or deletion.

---

# Defense

## 1. Monitor File Creation

Watch for:
- Large archive files
- Sudden compression activity

---

## 2. Restrict Sensitive Data Access

Prevent attackers from accessing:
- /etc
- /home
- /var/log

---

## 3. Monitor Outbound Traffic

Detect unusual file transfers.

---

## 4. Audit System Activity

Check:
- Recent archives
- Large compressed files

---

# Practical Exercises

## Exercise 1

Create archive:

tar -cvf test.tar file1 file2

---

## Exercise 2

Extract archive:

tar -xvf test.tar

---

## Exercise 3

Compress file:

gzip file.txt

---

## Exercise 4

Create compressed archive:

tar -czvf backup.tar.gz /home/ace

---

# Mental Model

Archiving:
- Groups files

Compression:
- Reduces size

Together:
- Efficient storage and transfer

---

# Final Insight

If you understand archiving:
- You can manage backups
- You can move data efficiently
- You can detect suspicious activity

Archiving is not just storage — it is movement of data.