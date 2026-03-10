# Git Fundamentals

Git is a distributed version control system used to track changes in files and coordinate work between multiple people.

It is widely used in software development, cybersecurity projects, and open-source collaboration.

---

## Key Concepts

### Repository

A repository (repo) is a directory that Git tracks.

It contains:

- project files
- change history
- commit records

Example:

git init

This command initializes a Git repository in the current directory.

---

### Working Directory

The working directory is the folder where you edit and create files.

Example:

Cybersecurity/
├── linux
├── scripts
└── README.md

Git monitors this directory for changes.

---

### Staging Area

Before changes are committed, they are added to a staging area.

Example:

git add .

This stages all modified files.

---

### Commit

A commit is a snapshot of the project at a specific point in time.

Example:

git commit -m "Initial project structure"

Each commit includes:

- changes made
- commit message
- timestamp
- author

---

### Branch

Branches allow multiple development paths.

Default branch:

main

Example command:

git branch

Lists available branches.

---

### Remote Repository

A remote repository is a copy of your project hosted on a server such as GitHub.

Example:

git remote add origin https://github.com/user/repository.git

---

### Push

Push uploads local commits to a remote repository.

Example:

git push origin main

---

### Pull

Pull retrieves changes from a remote repository.

Example:

git pull origin main

---

## Basic Git Workflow

Typical workflow when working with Git:

1. Edit files
2. Stage changes

git add .

3. Commit changes

git commit -m "Describe the changes"

4. Push to GitHub

git push origin main

---

## Why Git is Important

Git allows developers and engineers to:

- track project history
- collaborate safely
- revert mistakes
- manage multiple versions of a project