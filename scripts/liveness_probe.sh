#!/bin/bash

if nc -z 127.0.0.1 25565; then
    echo "Minecraft server is alive."
    exit 0
else
    echo "Minecraft server is not responding."
    exit 1
fi
