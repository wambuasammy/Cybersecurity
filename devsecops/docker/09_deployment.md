# Docker Deployment

---

## Overview

Docker deployment refers to running containerized applications in production environments in a reliable, scalable, and maintainable way.

It involves:

* Configuring containers for production
* Managing environments
* Scaling services
* Ensuring availability and resilience

---

## Core Concepts

### Development vs Production

Development:

* Fast iteration
* Debugging enabled
* Bind mounts and hot reload

Production:

* Stable and optimized
* Immutable images
* No direct code changes inside containers

---

### Immutable Deployment

* Containers are not modified after deployment
* New versions are deployed as new images
* Old containers are replaced

This ensures consistency and rollback capability.

---

### Configuration Management

Applications should not hardcode environment-specific values.

Use:

* Environment variables
* Configuration files
* Secret management systems

---

## Key Components / Internals

### Environment Variables

```bash
docker run -e APP_ENV=production myapp
```

Used for:

* Database URLs
* API keys
* Feature flags

---

### Restart Policies

Control container behavior on failure:

```bash
docker run --restart always nginx
```

Options:

* `no` → do not restart
* `on-failure` → restart on failure
* `always` → always restart
* `unless-stopped` → restart unless manually stopped

---

### Health Checks

Define container health:

```dockerfile
HEALTHCHECK CMD curl --fail http://localhost || exit 1
```

Used by orchestration systems to:

* Detect failures
* Restart unhealthy containers

---

## Commands / Syntax

```bash
# Run container in production mode
docker run -d -p 80:80 --restart unless-stopped nginx

# Set environment variables
docker run -d -e ENV=prod myapp

# View logs
docker logs <container_id>

# Monitor resource usage
docker stats
```

---

## Deployment Strategies

### Recreate Deployment

* Stop old container
* Start new container

Simple but causes downtime.

---

### Rolling Deployment

* Replace containers gradually
* No downtime
* Used in orchestration systems

---

### Blue-Green Deployment

* Two environments (blue and green)
* Switch traffic between them
* Enables instant rollback

---

### Canary Deployment

* Deploy to a subset of users
* Monitor behavior
* Gradually increase traffic

---

## Practical Example

Deploy a web application:

```bash
docker build -t myapp:1.0 .

docker run -d \
  -p 80:80 \
  --restart unless-stopped \
  -e ENV=production \
  myapp:1.0
```

---

## Scaling Containers

Basic scaling:

```bash
docker run -d -p 8081:80 nginx
docker run -d -p 8082:80 nginx
```

Load balancing required for production setups.

---

## Logging and Monitoring

### Logs

```bash
docker logs <container_id>
```

---

### Monitoring

```bash
docker stats
```

Track:

* CPU usage
* Memory usage
* Network I/O

---

## Common Mistakes

* Using development configurations in production
* Not setting restart policies
* Ignoring logging and monitoring
* Hardcoding configuration values
* Not planning for scaling
* Using `latest` tag

---

## Security Considerations

* Do not expose unnecessary ports
* Use secure environment variable handling
* Avoid running containers as root
* Scan images before deployment
* Restrict network access

---

## DevOps / Real-World Use

Deployment is used for:

* Running production services
* Scaling microservices
* Continuous delivery pipelines
* Infrastructure automation

---

## Advanced Concepts

### Orchestration

Tools like Kubernetes handle:

* Scaling
* Load balancing
* Self-healing
* Service discovery

---

### Infrastructure as Code

* Define deployments using code
* Version control infrastructure
* Automate provisioning

---

### Zero Downtime Deployment

* Rolling updates
* Traffic shifting
* Health-based routing

---

## Related Topics

* [Workflow](07_workflow.md) → CI/CD integration
* [Networking](04_networking.md) → Service communication
* [Storage](05_storage.md) → Persistent data
* [Security](08_security.md) → Secure deployments

---

## Key Takeaway

Docker deployment is about running containers reliably in production environments.

Effective deployment requires:

* Proper configuration management
* Scalable architecture
* Monitoring and logging
* Secure practices

Mastering deployment bridges the gap between development and real-world DevSecOps operations.
