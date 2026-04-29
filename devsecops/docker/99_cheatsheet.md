# Docker Cheatsheet

---

## Container Management

```bash
# Run container
docker run nginx

# Run in detached mode
docker run -d nginx

# Run with port mapping
docker run -d -p 8080:80 nginx

# Run with name
docker run -d --name my_container nginx

# List running containers
docker ps

# List all containers
docker ps -a

# Stop container
docker stop <container_id>

# Start container
docker start <container_id>

# Restart container
docker restart <container_id>

# Remove container
docker rm <container_id>

# Remove all stopped containers
docker container prune
```

---

## Image Management

```bash
# List images
docker images

# Pull image
docker pull nginx

# Build image
docker build -t myapp .

# Tag image
docker tag myapp:latest myrepo/myapp:1.0

# Remove image
docker rmi myapp

# Remove unused images
docker image prune
```

---

## Container Interaction

```bash
# Execute command inside container
docker exec -it <container_id> bash

# View logs
docker logs <container_id>

# Follow logs
docker logs -f <container_id>

# Inspect container
docker inspect <container_id>

# View running processes
docker top <container_id>
```

---

## Networking

```bash
# List networks
docker network ls

# Inspect network
docker network inspect bridge

# Create network
docker network create my_network

# Run container in network
docker run -d --network my_network nginx

# Connect container to network
docker network connect my_network <container>

# Disconnect container
docker network disconnect my_network <container>

# Remove network
docker network rm my_network
```

---

## Port Mapping

```bash
# Map host port to container port
docker run -p 8080:80 nginx

# Map multiple ports
docker run -p 8080:80 -p 443:443 nginx
```

---

## Volumes and Storage

```bash
# Create volume
docker volume create my_volume

# List volumes
docker volume ls

# Inspect volume
docker volume inspect my_volume

# Remove volume
docker volume rm my_volume

# Mount volume
docker run -v my_volume:/data nginx

# Bind mount
docker run -v /host/path:/container/path nginx
```

---

## Docker Compose

```bash
# Start services
docker-compose up

# Run in background
docker-compose up -d

# Stop services
docker-compose down

# Rebuild services
docker-compose up --build

# View logs
docker-compose logs
```

---

## Registry Operations

```bash
# Login to registry
docker login

# Logout
docker logout

# Push image
docker push myrepo/myapp:1.0

# Pull image
docker pull myrepo/myapp:1.0
```

---

## System Cleanup

```bash
# Remove unused containers, networks, images
docker system prune

# Remove everything including volumes
docker system prune -a --volumes
```

---

## Resource Monitoring

```bash
# View container resource usage
docker stats

# View disk usage
docker system df
```

---

## Useful Flags

```bash
-d        # Detached mode
-p        # Port mapping
--name    # Assign container name
-v        # Volume mount
-e        # Environment variable
--rm      # Auto-remove container after exit
--network # Specify network
```

---

## Debugging Tips

```bash
# Enter container shell
docker exec -it <container_id> sh

# Check logs
docker logs <container_id>

# Inspect configuration
docker inspect <container_id>

# Check open ports
docker port <container_id>
```

---

## Security Quick Checks

* Avoid using `latest` tag
* Do not run containers as root
* Limit exposed ports
* Scan images before deployment
* Use minimal base images

---

## Quick Workflow Reference

```bash
# Build image
docker build -t myapp .

# Run container
docker run -d -p 8080:80 myapp

# Tag image
docker tag myapp user/myapp:1.0

# Push image
docker push user/myapp:1.0
```

---

## Key Commands Summary

```bash
docker run        # Run container
docker build      # Build image
docker ps         # List containers
docker images     # List images
docker logs       # View logs
docker exec       # Execute command in container
docker network    # Manage networks
docker volume     # Manage volumes
docker system     # System cleanup and info
```

---

## Key Takeaway

This cheatsheet provides quick access to the most commonly used Docker commands and patterns.

Use it for:

* Daily development
* Debugging issues
* CI/CD workflows
* Production troubleshooting
