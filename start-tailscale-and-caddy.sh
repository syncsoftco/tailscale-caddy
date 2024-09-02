#!/bin/bash
# start-tailscale-and-caddy.sh

# Start the Tailscale daemon in the background
/usr/local/bin/tailscaled &

# Wait for the Tailscale daemon to start
sleep 5

# Bring the Tailscale interface up using the provided auth key
/usr/local/bin/tailscale up --authkey=${TAILSCALE_AUTH_KEY} --hostname=tailscale-gateway

# Use the PORT environment variable provided by Cloud Run, default to 8080 if not set
PORT=${PORT:-8080}

# Dynamically generate the Caddyfile based on the environment variables
cat <<EOF > /etc/caddy/Caddyfile
:${PORT} {
    reverse_proxy ${TARGET_SERVICE}:${TARGET_PORT}
}
EOF

# Start the Caddy web server, which listens on the port expected by Cloud Run
exec caddy run --config /etc/caddy/Caddyfile --adapter caddyfile
