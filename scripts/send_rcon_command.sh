#!/bin/bash

# Check if a command is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <minecraft_command>"
    exit 1
fi

# Function to extract a property value from server.properties
function get_property {
    grep -E "^$1\s*=" /data/server/server.properties | cut -d'=' -f2- | tr -d '\r'
}

# Read RCON settings from server.properties
RCON_PASSWORD=$(get_property "rcon.password")
RCON_PORT=$(get_property "rcon.port")
RCON_IP=$(get_property "rcon.ip")

# Set default values if variables are empty
[ -z "$RCON_PORT" ] && RCON_PORT=25575
[ -z "$RCON_IP" ] && RCON_IP="127.0.0.1"

# Check if RCON is available (ensure netcat is installed)
if ! nc -z "$RCON_IP" "$RCON_PORT"; then
    echo "Error: RCON is not available on $RCON_IP:$RCON_PORT"
    exit 1
fi

/data/scripts/rcon -a "$RCON_IP:$RCON_PORT" -p "$RCON_PASSWORD" "$@"

