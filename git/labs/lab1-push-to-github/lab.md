# Lab 1 — Push Local Repository to GitHub

## Objective

The goal of this lab is to initialize a Git repository locally and publish it to GitHub.

---

## Step 1 — Verify Project Structure

Before initializing Git, we verify the current project directory structure.

Command:

tree ~/Documents/Cybersecurity

Explanation:

This command displays the directory hierarchy of the project. It confirms that the repository contains the Linux notes, Git documentation, scripts, and supporting directories.

![Project Structure](screenshots/01_project_structure.png)


---

## Step 2 — Initialize the Git Repository

Command:

Explanation:

The `git init` command initializes a new Git repository in the project directory.

Git creates a hidden directory called `.git` which contains the repository metadata, commit history, and configuration.

The `ls -a` command is used to verify that the `.git` directory has been created. The `-a` option displays hidden files and directories.

![Git Repository Initialization](screenshots/02_git_init.png)


---

## Step 3 — Check Repository Status

Command:

```
git status
```

Explanation:

The `git status` command displays the current state of the Git repository.

It shows which files are untracked, staged, or modified. At this stage, the repository has not yet tracked any files, so Git reports the project files as untracked.

![Git Status](screenshots/03_git_status.png)