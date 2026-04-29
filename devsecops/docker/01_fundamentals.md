# Docker Fundamentals

---

## Overview

Docker is a containerization platform that enables developers to package applications and their dependencies into portable, lightweight units called containers.

Containers ensure that applications run consistently across different environments:

* Local development
* Testing
* Production

---

## Core Concepts

### What is a Container?

A container is a lightweight, isolated runtime environment that includes:

* Application code
* Dependencies
* Runtime

Runs as a process on the host OS (not a full OS like virtual machines).

---

### Container vs Virtual Machine

| Feature      | Containers     | Virtual Machines |
| ------------ | -------------- | ---------------- |
| OS           | Shared host OS | Full OS per VM   |
| Startup Time | Seconds        | Minutes          |
| Size         | MBs            | GBs              |
| Performance  | Near-native    | Overhead present |

---

### Docker Components

* Docker Engine → Core runtime
* Docker Client (CLI) → User interface (`docker`)
* Docker Daemon → Manages containers and images
* Docker Registry → Stores images (e.g., Docker Hub)

---

## Key Internals (How Docker Works)

Docker uses Linux kernel features:

### Namespaces (Isolation)

* PID → process isolation
* NET → network isolation
* MNT → filesystem isolation

Makes containers appear independent.

---

### Cgroups (Resource Control)

* CPU limits
* Memory limits
* Disk I/O

Prevents one container from consuming all system resources.

---

### Union File System (Layering)

* Images are built in layers
* Each layer is cached
* Enables efficient storage and faster builds

---

## Commands / Syntax

```bash
# Check Docker version
docker --version

# Run test container
docker run hello-world

# List running containers
docker ps

# List all containers
docker ps -a

# List images
docker images
```

---

## Practical Example

Run a simple container:

```bash
docker run nginx
```

Run in detached mode with port mapping:

```bash
docker run -d -p 8080:80 nginx
```

Access via: http://localhost:8080

---

## Common Mistakes

* Confusing images and containers
* Running containers without understanding port mapping
* Ignoring container lifecycle (dangling containers)
* Assuming containers are virtual machines

---

## Security Considerations

* Containers share the host kernel and do not provide full isolation
* Avoid running containers as root
* Use trusted base images
* Regularly update images to patch vulnerabilities

---

## DevOps / Real-World Use

Docker is used for:

* Standardizing development environments
* Running CI/CD jobs in isolated containers
* Packaging microservices
* Creating reproducible builds

---

## Related Topics

* [Images](02_images.md) → Build container blueprints
* [Containers](03_containers.md) → Runtime execution
* [Security](08_security.md) → Hardening containers
* [Workflow](07_workflow.md) → Dev and CI/CD integration

---

## Key Takeaway

Docker is a standardized way to package and run software consistently across environments.

Mastering Docker fundamentals requires understanding:

* Isolation (namespaces)
* Resource control (cgroups)
* Layered builds (images)
