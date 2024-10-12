#!/bin/bash

# Check if a command was passed 
if [ -z "$1" ]; then
  echo "Usage: $0 <command>"
  exit 1
fi

PIPE_PATH="/tmp/command-fifo"

echo "$1" > "$PIPE_PATH"

