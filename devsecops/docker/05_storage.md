# Docker Storage

---

## Overview

Docker containers are ephemeral by design, meaning any data stored inside a container is lost when the container is removed.

Docker provides mechanisms to persist data outside containers:

* Volumes
* Bind mounts
* tmpfs mounts

These enable stateful applications such as databases and file storage systems.

---

## Core Concepts

### Ephemeral Storage

By default:

* Data written inside a container is stored in its writable layer
* This data is lost when the container is deleted

Containers should not be used for persistent storage.

---

### Persistent Storage Options

#### Volumes (Recommended)

* Managed by Docker
* Stored in Docker’s internal directory
* Independent of container lifecycle

---

#### Bind Mounts

* Map host filesystem paths into containers
* Direct access to host files

---

#### tmpfs Mounts

* Stored in memory (RAM)
* Not persisted to disk
* Used for sensitive or temporary data

---

## Key Components / Internals

### Writable Layer

Each container has a writable layer:

* Stores runtime changes
* Deleted when container is removed
* Slower than volumes due to copy-on-write

---

### Volume Storage Location

On Linux:

```id="8l4t1r"
/var/lib/docker/volumes/
```

Managed entirely by Docker.

---

## Commands / Syntax

```bash id="d2x3qk"
# Create a volume
docker volume create my_volume

# List volumes
docker volume ls

# Inspect volume
docker volume inspect my_volume

# Remove volume
docker volume rm my_volume
```

---

## Using Volumes

```bash id="f4y8pw"
docker run -d \
  -v my_volume:/data \
  nginx
```

Format:

```id="nb4s3g"
<volume_name>:<container_path>
```

---

## Using Bind Mounts

```bash id="dczqk6"
docker run -d \
  -v /host/path:/container/path \
  nginx
```

Example:

```bash id="q8k6py"
docker run -v $(pwd):/app nginx
```

---

## Using tmpfs

```bash id="zq0g3f"
docker run --tmpfs /app nginx
```

---

## Practical Example

Run a container with persistent storage:

```bash id="7s0d5k"
docker volume create app_data

docker run -d \
  -v app_data:/var/lib/mysql \
  mysql
```

Even if the container is removed, data remains in the volume.

---

## Volume vs Bind Mount

| Feature           | Volume | Bind Mount      |
| ----------------- | ------ | --------------- |
| Managed by Docker | Yes    | No              |
| Portability       | High   | Low             |
| Performance       | Good   | Depends on host |
| Security          | Safer  | Riskier         |

---

## Common Mistakes

* Storing important data inside containers
* Using bind mounts without understanding host impact
* Deleting volumes unintentionally
* Not backing up volumes
* Incorrect file permissions

---

## Security Considerations

* Avoid exposing sensitive host directories
* Use read-only mounts where possible:

```bash id="w4wq1v"
docker run -v my_volume:/data:ro nginx
```

* Restrict access to volume paths
* Use tmpfs for sensitive data
* Validate file permissions

---

## DevOps / Real-World Use

Storage is used for:

* Databases (MySQL, PostgreSQL)
* Logs and monitoring data
* File uploads
* Shared data between containers

---

## Advanced Concepts

### Data Sharing Between Containers

```bash id="c7m2kb"
docker run -v shared_data:/data container1
docker run -v shared_data:/data container2
```

---

### Backup and Restore

Backup:

```bash id="5hv9fk"
docker run --rm \
  -v my_volume:/data \
  -v $(pwd):/backup \
  busybox tar czf /backup/backup.tar.gz /data
```

Restore:

```bash id="4b5k9m"
docker run --rm \
  -v my_volume:/data \
  -v $(pwd):/backup \
  busybox tar xzf /backup/backup.tar.gz -C /
```

---

### Volume Drivers

* Local (default)
* Cloud providers (AWS, Azure)
* Network storage (NFS)

---

## Related Topics

* [Containers](03_containers.md) → Runtime environment
* [Networking](04_networking.md) → Service communication
* [Security](08_security.md) → Data protection
* [Deployment](09_deployment.md) → Stateful applications

---

## Key Takeaway

Containers are ephemeral, but real-world applications require persistent data.

Understanding:

* Volumes vs bind mounts
* Data lifecycle
* Backup strategies
* Security implications

is essential for building reliable and secure containerized systems.
