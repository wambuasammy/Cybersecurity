# Docker Networking

---

## Overview

Docker networking enables communication:

* Between containers
* Between containers and the host
* Between containers and external systems

Each container runs in an isolated network namespace, and Docker provides multiple networking drivers to manage connectivity.

---

## Core Concepts

### Container Networking Basics

By default:

* Each container gets its own network namespace
* Containers can communicate over virtual networks
* Ports must be explicitly exposed to the host

---

### Network Drivers

Docker provides several built-in network drivers:

#### Bridge (default)

* Used for standalone containers
* Containers can communicate via IP
* Requires port mapping for external access

#### Host

* Shares host network stack
* No isolation
* High performance, but less secure

#### None

* No networking
* Fully isolated container

#### Overlay (advanced)

* Used in multi-host environments (Docker Swarm, Kubernetes)
* Enables communication across different hosts

---

## Key Components / Internals

### Network Namespace

Each container has:

* Its own IP address
* Its own network interfaces
* Its own routing table

---

### Virtual Ethernet (veth pair)

Docker connects containers to networks using:

* One end inside container
* One end on host bridge

---

### Docker Bridge (docker0)

Default bridge network:

* Created automatically
* Assigns IPs to containers
* Handles internal communication

---

### DNS Resolution

Docker provides internal DNS:

* Containers can resolve each other by name (in custom networks)
* Automatic service discovery

---

## Commands / Syntax

```bash
# List networks
docker network ls

# Inspect network
docker network inspect bridge

# Create custom network
docker network create my_network

# Run container in a network
docker run -d --name app --network my_network nginx

# Connect container to network
docker network connect my_network container_name

# Disconnect container
docker network disconnect my_network container_name

# Remove network
docker network rm my_network
```

---

## Port Mapping

Expose container services to host:

```bash
docker run -p 8080:80 nginx
```

Format:

```
<host_port>:<container_port>
```

Example:

* Host: localhost:8080
* Container: port 80

---

## Custom Bridge Networks (Recommended)

Create a user-defined network:

```bash
docker network create app_network
```

Run containers:

```bash
docker run -d --name app1 --network app_network nginx
docker run -d --name app2 --network app_network nginx
```

Now containers can communicate using names:

```bash
ping app2
```

---

## Practical Example

Run two containers in the same network:

```bash
docker network create demo_net

docker run -d --name web --network demo_net nginx
docker run -it --network demo_net busybox
```

Inside busybox:

```bash
ping web
```

---

## Common Mistakes

* Using default bridge instead of custom networks
* Forgetting port mapping
* Assuming containers can communicate without a shared network
* Hardcoding IP addresses instead of using container names

---

## Security Considerations

* Avoid exposing unnecessary ports
* Use custom networks to isolate services
* Restrict inter-container communication
* Avoid host network unless absolutely necessary
* Monitor network traffic between containers

---

## DevOps / Real-World Use

Docker networking is used for:

* Microservice communication
* Service discovery
* API-to-database connections
* Local development environments
* CI/CD test environments

---

## Advanced Topics (Important for DevSecOps)

### Network Isolation

* Separate frontend and backend networks
* Limit communication between services

---

### Network Policies (Conceptual)

* Control which containers can communicate
* Enforced more strictly in Kubernetes

---

### Overlay Networks

* Multi-host communication
* Used in orchestration systems

---

## Related Topics

* [Containers](03_containers.md) → Runtime environment
* [Storage](05_storage.md) → Data persistence
* [Security](08_security.md) → Network hardening
* Kubernetes → Advanced networking and policies

---

## Key Takeaway

Docker networking provides flexible mechanisms for container communication, but must be configured carefully.

Understanding:

* Network drivers
* Port mapping
* DNS-based communication
* Isolation strategies

is essential for building secure and scalable containerized systems.
