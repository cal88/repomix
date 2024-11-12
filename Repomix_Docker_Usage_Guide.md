
# Repomix Docker Usage Guide

This guide provides instructions on using Docker to run Repomix, a tool for consolidating repositories into a single, AI-friendly file.

Original repo:

https://github.com/yamadashy/repomix

---

## Step 1: Set Up the Dockerfile

Build the Docker image with the following command:

   ```bash
   docker build -t repomix-container .
   ```

   Here, `repomix-container` is the name given to the Docker image. You can replace it with any name you prefer.

---

## Step 2: Running Repomix Commands in Docker

### Running on a Local Repository

To consolidate a local repository, mount the current directory (`$(pwd)`) to `/app` in the container and run:

```bash
docker run --rm -v "$(pwd)":/app repomix-container
```

- `--rm`: Ensures the container is deleted after it finishes.
- `-v "$(pwd)":/app`: Mounts the current working directory to `/app` in the container.

### Running on a Remote Repository

To consolidate a remote repository, use the `--remote` option followed by the repository URL:

```bash
docker run --rm -v "$(pwd)":/app repomix-container repomix --remote https://github.com/frdel/agent-zero
```

---

## Step 3: Clean Up Containers

1. Use the `--rm` flag (as shown above) to automatically delete containers after they finish.
2. Manually remove all stopped containers:

   ```bash
   docker container prune
   ```

3. List and remove specific containers:

   ```bash
   docker rm <container_id>
   ```

---

## Summary of Commands

| Purpose                              | Command                                                      |
|--------------------------------------|--------------------------------------------------------------|
| Build Docker image                   | `docker build -t repomix-container .`                        |
| Run on local repo (auto-remove)      | `docker run --rm -v "$(pwd)":/app repomix-container`         |
| Run on remote repo (auto-remove)     | `docker run --rm -v "$(pwd)":/app repomix-container repomix --remote <repo_url>` |
| Prune all stopped containers         | `docker container prune`                                     |
| Remove specific container            | `docker rm <container_id>`                                   |

--- 

This guide should help you use Docker effectively with Repomix, from setup to running commands and cleanup.
