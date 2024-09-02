# tailscale-caddy

A lightweight, secure gateway service that proxies requests to resources within a Tailscale network. This project integrates Tailscale with the Caddy web server, allowing you to forward HTTP requests to services only accessible within your Tailscale network.

## Overview

This repository provides a Docker container that combines Tailscale and Caddy. The service acts as a gateway, making it easier to expose internal services securely over the internet by leveraging the Tailscale network.

## Features

- **Tailscale Integration**: Seamlessly connect to your Tailscale network using the official Tailscale Docker container.
- **Caddy Web Server**: Lightweight and highly configurable reverse proxy for forwarding requests.
- **Secure Communication**: All traffic is securely routed through your Tailscale network, ensuring privacy and security.

## Usage

### 1. Prerequisites

- Docker installed locally for building the container.
- A Tailscale account and an authentication key with sufficient permissions to join the tailnet.

### 2. Clone the Repository

```bash
git clone https://github.com/your-username/tailscale-caddy.git
cd tailscale-caddy
```

### 3. Build the Docker Image

```bash
docker build -t your-dockerhub-username/tailscale-caddy:latest .
```

### 4. Run the Container

```bash
docker run -d \
  -e TAILSCALE_AUTH_KEY=your-tailscale-auth-key \
  -p 8080:8080 \
  your-dockerhub-username/tailscale-caddy:latest
```

### 5. Accessing Services

You can now access the services within your Tailscale network by sending HTTP requests to the running container. For example:

```bash
curl http://localhost:8080/api/resource
```

### 6. Customizing Caddy

To customize how requests are proxied, you can modify the `Caddyfile` to suit your specific requirements.

## Files and Structure

- **Dockerfile**: Builds the container with Tailscale and Caddy.
- **Caddyfile**: Configuration file for Caddy, defining how to proxy requests.
- **start-tailscale-and-caddy.sh**: Script to start Tailscale and Caddy when the container runs.
- **README.md**: This file, containing setup and usage instructions.

## Contributing

Contributions are welcome! Please submit a pull request or open an issue to discuss changes.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
```
