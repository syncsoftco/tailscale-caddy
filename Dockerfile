# Use the official Tailscale Docker container as a base
FROM tailscale/tailscale:latest

# Install Caddy
RUN apk update && apk add --no-cache caddy

# Create a working directory
WORKDIR /app

# Copy start script
COPY start-tailscale-and-caddy.sh /app/start-tailscale-and-caddy.sh

# Ensure the script is executable
RUN chmod +x /app/start-tailscale-and-caddy.sh

# Set the script as the entry point
ENTRYPOINT ["/bin/sh", "/app/start-tailscale-and-caddy.sh"]
