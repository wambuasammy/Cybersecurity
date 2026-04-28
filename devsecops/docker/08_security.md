# Docker Security

---

## Overview

Docker security focuses on protecting containerized applications across the entire lifecycle:

* Image build
* Distribution
* Runtime
* Infrastructure

Because containers share the host kernel, they introduce unique security risks that must be actively managed.

---

## Core Concepts

### Shared Kernel Risk

Containers:

* Share the host OS kernel
* Are isolated, but not fully separated like virtual machines

Implication:

* A compromised container can potentially affect the host

---

### Attack Surface

Docker introduces multiple attack surfaces:

* Vulnerable base images
* Misconfigured containers
* Exposed ports
* Insecure registries
* Privileged containers

---

### Defense in Depth

Security should be applied at multiple layers:

1. Image security
2. Runtime security
3. Host security
4. Network security
5. Supply chain security

---

## Image Security

### Use Minimal Base Images

* Prefer Alpine or distroless images
* Reduce unnecessary packages

---

### Scan Images for Vulnerabilities

Example tools:

* Trivy
* Clair
* Docker Scout

Example:

```bash
trivy image nginx
```

---

### Avoid Hardcoded Secrets

Do not include:

* API keys
* Passwords
* Tokens

Use environment variables or secret management systems instead.

---

### Pin Image Versions

Avoid:

```bash
nginx:latest
```

Use:

```bash
nginx:1.25.3
```

---

## Runtime Security

### Avoid Running as Root

By default, containers run as root.

Mitigation:

```dockerfile
RUN adduser -D appuser
USER appuser
```

---

### Limit Container Capabilities

Remove unnecessary Linux capabilities:

```bash
docker run --cap-drop ALL nginx
```

---

### Read-Only Filesystem

```bash
docker run --read-only nginx
```

---

### Resource Limits

Prevent resource exhaustion:

```bash
docker run --memory="512m" --cpus="1" nginx
```

---

### Seccomp Profiles

Restrict system calls:

* Docker uses a default seccomp profile
* Can define custom profiles

---

## Network Security

* Avoid exposing unnecessary ports
* Use custom networks for isolation
* Restrict communication between containers
* Use firewalls and network policies

---

## Secrets Management

### Do NOT store secrets in:

* Dockerfiles
* Images
* Source code

---

### Use Secure Alternatives

* Environment variables (limited use)
* Docker secrets (Swarm)
* External secret managers (Vault, AWS Secrets Manager)

---

## Host Security

* Keep Docker and OS updated
* Restrict access to Docker daemon
* Use rootless Docker where possible
* Monitor system activity

---

## Registry Security

* Use private registries for sensitive images
* Enable authentication and authorization
* Scan images before pushing
* Use signed images (Docker Content Trust)

---

## Supply Chain Security

### Image Provenance

* Use trusted sources
* Avoid unverified public images

---

### Image Signing

* Verify image integrity
* Prevent tampering

---

### SBOM (Software Bill of Materials)

* Track dependencies
* Identify vulnerabilities

---

## Practical Example

Secure container execution:

```bash
docker run -d \
  --read-only \
  --cap-drop ALL \
  --memory="512m" \
  --cpus="1" \
  nginx
```

---

## Common Mistakes

* Running containers as root
* Using `latest` images
* Ignoring vulnerability scans
* Exposing too many ports
* Storing secrets in images
* Using overly privileged containers

---

## DevSecOps Integration

Security should be integrated into pipelines:

1. Build image
2. Scan for vulnerabilities
3. Enforce policies
4. Push to registry
5. Deploy securely

---

## Advanced Concepts

### Rootless Containers

* Run Docker without root privileges
* Reduces risk of host compromise

---

### Policy Enforcement

* Use tools like Open Policy Agent (OPA)
* Enforce security rules in CI/CD

---

### Runtime Monitoring

* Detect suspicious behavior
* Tools: Falco, Sysdig

---

### Container Hardening

* Minimize attack surface
* Remove unnecessary binaries
* Apply least privilege

---

## Related Topics

* [Images](02_images.md) → Secure image creation
* [Containers](03_containers.md) → Runtime hardening
* [Networking](04_networking.md) → Secure communication
* [Registries](06_registries.md) → Secure distribution
* [Workflow](07_workflow.md) → Pipeline integration

---

## Key Takeaway

Docker security is not a single step but a continuous process across the container lifecycle.

Effective security requires:

* Minimizing attack surface
* Enforcing least privilege
* Scanning and monitoring continuously
* Integrating security into DevOps workflows

Security is a core responsibility in DevSecOps, not an optional enhancement.
