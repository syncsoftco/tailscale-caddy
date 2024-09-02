#!/bin/bash
# Start the Tailscale daemon
/usr/local/bin/tailscaled &

# Wait for the Tailscale daemon to start
sleep 5

# Bring the Tailscale interface up
/usr/local/bin/tailscale up --authkey=${TAILSCALE_AUTH_KEY} --hostname=tailscale-gateway

# Dynamically generate the Caddyfile
cat <<EOF > /etc/caddy/Caddyfile
:8080 {
    reverse_proxy ${TARGET_SERVICE}:${TARGET_PORT}
}
EOF

# Start the Caddy server
exec caddy run --config /etc/caddy/Caddyfile --adapter caddyfile
