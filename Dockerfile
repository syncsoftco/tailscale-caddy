# Use the official Tailscale Docker container as a base
FROM tailscale/tailscale:latest

# Install Caddy
RUN apt-get update && apt-get install -y caddy

# Copy start script
COPY start-tailscale-and-caddy.sh /usr/local/bin/start-tailscale-and-caddy.sh
RUN chmod +x /usr/local/bin/start-tailscale-and-caddy.sh

ENTRYPOINT ["/usr/local/bin/start-tailscale-and-caddy.sh"]
