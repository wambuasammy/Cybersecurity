# Docker Registries

---

## Overview

Docker registries are systems used to store, manage, and distribute Docker images. They enable sharing images across environments such as development, testing, and production.

Registries are essential for CI/CD pipelines and reproducible deployments.

---

## Core Concepts

### What is a Registry?

A Docker registry is a centralized repository for storing images.

Types of registries:

* Public registries (e.g., Docker Hub)
* Private registries (self-hosted or cloud-based)

---

### Repository and Tags

An image is identified as:

```
<registry>/<repository>:<tag>
```

Examples:

```
docker.io/nginx:latest
myregistry.com/app:1.0
```

* Repository → logical grouping of images
* Tag → version identifier

---

### Image Versioning

Tags are used for version control:

* `latest` → default tag (not recommended for production)
* Semantic versioning → `v1.0.0`, `v2.1.3`
* Environment tags → `dev`, `staging`, `prod`

---

## Key Components / Internals

### Docker Hub

* Default public registry
* Hosts official and community images
* Requires authentication for pushing images

---

### Private Registries

Options:

* Self-hosted Docker Registry
* Cloud registries (AWS ECR, Azure ACR, GCP Artifact Registry)

Benefits:

* Better security
* Access control
* Internal image management

---

## Commands / Syntax

```bash
# Login to registry
docker login

# Pull image
docker pull nginx

# Tag image
docker tag myapp:latest myrepo/myapp:1.0

# Push image
docker push myrepo/myapp:1.0

# Logout
docker logout
```

---

## Working with Docker Hub

### Pull Image

```bash
docker pull nginx
```

---

### Push Image

```bash
docker tag myapp:latest username/myapp:1.0
docker push username/myapp:1.0
```

---

## Private Registry Example

Run a local registry:

```bash
docker run -d -p 5000:5000 --name registry registry:2
```

Tag and push:

```bash
docker tag myapp localhost:5000/myapp
docker push localhost:5000/myapp
```

---

## Practical Example

Build, tag, and push:

```bash
docker build -t myapp .
docker tag myapp:latest username/myapp:1.0
docker push username/myapp:1.0
```

---

## Common Mistakes

* Using `latest` tag in production
* Not versioning images properly
* Forgetting to authenticate before push
* Overwriting existing tags unintentionally
* Storing sensitive images in public repositories

---

## Security Considerations

* Use private registries for sensitive applications
* Enable authentication and access control
* Scan images for vulnerabilities before pushing
* Avoid storing secrets in images
* Use signed images where possible

---

## DevOps / Real-World Use

Registries are used for:

* CI/CD pipelines (build → push → deploy)
* Version-controlled application releases
* Artifact storage and distribution
* Multi-environment deployments

---

## Advanced Concepts

### Image Promotion

Workflow:

* Build image → tag as `dev`
* Test → retag as `staging`
* Release → retag as `prod`

---

### Immutable Tags

* Avoid modifying existing tags
* Treat images as immutable artifacts

---

### Registry Caching

* Use local mirrors to speed up pulls
* Reduce external dependency

---

### Content Trust (Docker Notary)

* Ensures image integrity and authenticity
* Prevents tampering

---

## Related Topics

* [Images](02_images.md) → Image creation
* [Containers](03_containers.md) → Runtime usage
* [Workflow](07_workflow.md) → CI/CD integration
* [Security](08_security.md) → Image scanning and hardening

---

## Key Takeaway

Docker registries are critical for distributing and managing container images across environments.

Mastery of registries enables:

* Reliable deployments
* Version control of artifacts
* Secure image distribution
* Scalable CI/CD workflows
