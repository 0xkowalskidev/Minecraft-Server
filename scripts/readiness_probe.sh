#!/bin/bash

LOG_FILE="/data/server/logs/latest.log"
READY_MESSAGE="[Server thread/INFO]: Done"

if grep -q "$READY_MESSAGE" "$LOG_FILE"; then
    echo "Server is ready."
    exit 0
else
    echo "Server is not ready."
    exit 1
fi

