#!/usr/bin/env bash

# Check if the tdarr-node container is running
if podman ps --format '{{.Names}}' | grep -q '^tdarr-node$'; then
    echo "tdarr-node container is running. Stoping tdarr-node.service..."
    systemctl --user stop tdarr-node.service
else
    echo "tdarr-node container is not running. Starting tdarr-node.service..."
    systemctl --user start tdarr-node.service
fi