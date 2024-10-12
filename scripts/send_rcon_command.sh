#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 <minecraft_command>"
    exit 1
fi

function get_property {
    grep -E "^$1\s*=" /data/server/server.properties | cut -d'=' -f2- | tr -d '\r'
}

RCON_PASSWORD=$(get_property "rcon.password")
RCON_PORT=$(get_property "rcon.port")
RCON_IP=$(get_property "rcon.ip")

[ -z "$RCON_PORT" ] && RCON_PORT=25575
[ -z "$RCON_IP" ] && RCON_IP="127.0.0.1"

/data/scripts/rcon -a "$RCON_IP:$RCON_PORT" -p "$RCON_PASSWORD" "$@"

