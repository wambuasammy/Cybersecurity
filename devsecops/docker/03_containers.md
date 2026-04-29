# Docker Containers

---

## Overview

A Docker container is a runtime instance of a Docker image. It represents a running application with its own isolated environment, including filesystem, processes, and networking.

Containers are lightweight and ephemeral, designed to be created, started, stopped, and removed quickly.

---

## Core Concepts

### What is a Container?

A container is:

* A running instance of an image
* An isolated process on the host system
* A temporary and replaceable execution environment

---

### Container Lifecycle

1. Create
2. Start
3. Run
4. Stop
5. Remove

Containers are typically short-lived and should not store persistent data internally.

---

### Ephemeral Nature

Containers are designed to be disposable:

* Any changes inside a container are lost when it is removed
* Persistent data should be stored outside (volumes)

---

## Key Components / Internals

### Namespaces

Containers use namespaces for isolation:

* PID → process isolation
* NET → network isolation
* MNT → filesystem isolation

---

### Writable Layer

Each container has a writable layer on top of the image:

* Changes occur here during runtime
* Deleted when the container is removed

---

## Commands / Syntax

```bash id="b0ff1q"
# Run a container
docker run nginx

# Run in detached mode
docker run -d nginx

# Run with port mapping
docker run -d -p 8080:80 nginx

# List running containers
docker ps

# List all containers
docker ps -a

# Stop a container
docker stop <container_id>

# Remove a container
docker rm <container_id>

# Execute command inside container
docker exec -it <container_id> bash

# View logs
docker logs <container_id>
```

---

## Practical Example

Run a web server container:

```bash id="uwntm9"
docker run -d -p 8080:80 nginx
```

Verify:

```bash id="i3d9kt"
docker ps
```

Access:
http://localhost:8080

---

## Common Mistakes

* Treating containers like virtual machines
* Storing important data inside containers
* Forgetting to remove stopped containers
* Running too many containers without monitoring resources

---

## Security Considerations

* Avoid running containers as root
* Limit exposed ports
* Use read-only filesystems when possible
* Apply resource limits (CPU, memory)
* Monitor container activity

---

## DevOps / Real-World Use

Containers are used for:

* Running microservices
* Isolated testing environments in CI/CD
* Blue-green and rolling deployments
* Scaling applications horizontally

---

## Related Topics

* [Images](02_images.md) → Defines container blueprint
* [Storage](05_storage.md) → Persistent data management
* [Networking](04_networking.md) → Communication between containers
* [Security](08_security.md) → Hardening runtime environments

---

## Key Takeaway

Containers are the execution layer of Docker. They provide isolated, repeatable environments for running applications, but should remain stateless and disposable.

Understanding container lifecycle, isolation, and runtime behavior is essential for effective DevOps and DevSecOps practices.
