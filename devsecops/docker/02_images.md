# Docker Images

---

## Overview

Docker images are immutable templates used to create containers. They package application code, dependencies, system libraries, and configuration into a portable unit.

An image serves as the blueprint from which containers are instantiated.

---

## Core Concepts

### What is an Image?

An image is a read-only artifact that contains everything needed to run an application:

* Application code
* Runtime
* Libraries
* Environment configuration

---

### Image vs Container

| Aspect     | Image     | Container           |
| ---------- | --------- | ------------------- |
| Nature     | Static    | Runtime instance    |
| Mutability | Immutable | Mutable (ephemeral) |
| Purpose    | Blueprint | Execution           |

---

### Image Layers

Docker images are built in layers:

* Each instruction in a Dockerfile creates a new layer
* Layers are cached and reused
* Only changed layers are rebuilt

Benefits:

* Faster builds
* Reduced storage usage
* Efficient image distribution

---

## Key Components / Internals

### Union File System

Docker uses a layered filesystem:

* Base layer (e.g., Ubuntu, Alpine)
* Application layers
* Top writable container layer

This allows multiple containers to share the same base image efficiently.

---

### Image Identification

Images are identified by:

```id="e5tq8y"
<repository>:<tag>
```

Examples:

```id="j30z2t"
nginx:latest
python:3.11
```

---

## Commands / Syntax

```bash id="w6d4lx"
# Pull an image from registry
docker pull nginx

# List images
docker images

# Remove an image
docker rmi nginx

# Build an image from Dockerfile
docker build -t myapp:1.0 .

# Inspect image details
docker inspect nginx
```

---

## Building Images (Dockerfile)

### Basic Example

```dockerfile id="3q9i8w"
FROM python:3.11-slim

WORKDIR /app

COPY . .

RUN pip install -r requirements.txt

CMD ["python", "app.py"]
```

---

### Common Instructions

* `FROM` → Base image
* `WORKDIR` → Working directory
* `COPY` / `ADD` → Add files
* `RUN` → Execute commands during build
* `CMD` → Default execution command

---

## Optimization Techniques

### Layer Optimization

* Combine commands to reduce layers
* Use `.dockerignore` to exclude unnecessary files

---

### Multi-Stage Builds

Used to reduce final image size:

```dockerfile id="t1ehw1"
# Build stage
FROM node:18 AS builder
WORKDIR /app
COPY . .
RUN npm install && npm run build

# Production stage
FROM nginx:alpine
COPY --from=builder /app/dist /usr/share/nginx/html
```

Benefits:

* Smaller images
* Reduced attack surface
* Faster deployments

---

## Practical Example

Build and run an image:

```bash id="q3q5lg"
docker build -t myapp .
docker run -p 8080:80 myapp
```

---

## Common Mistakes

* Using large base images unnecessarily
* Not leveraging layer caching
* Including sensitive data in images
* Using `latest` tag in production

---

## Security Considerations

* Use minimal base images (e.g., Alpine, distroless)
* Scan images for vulnerabilities (e.g., Trivy)
* Avoid embedding secrets in images
* Pin image versions instead of using `latest`

---

## DevOps / Real-World Use

Images are used for:

* Packaging applications for deployment
* CI/CD pipelines (build once, deploy anywhere)
* Versioning application releases
* Standardizing runtime environments

---

## Related Topics

* [Fundamentals](01_fundamentals.md) → Core Docker concepts
* [Containers](03_containers.md) → Runtime execution
* [Registries](06_registries.md) → Image storage and distribution
* [Security](08_security.md) → Image hardening

---

## Key Takeaway

Docker images are the foundation of containerization. Understanding how they are built, optimized, and secured is critical for efficient and secure DevSecOps workflows.

Mastery of images enables:

* Reproducible builds
* Faster deployments
* Reduced vulnerabilities
