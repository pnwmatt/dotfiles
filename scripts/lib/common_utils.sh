#!/bin/bash

# https://explainshell.com/explain?cmd=set+-euo+pipefail
set -euo pipefail


# Function to handle errors
error_handler() {
    local hostname="$1"
    local stderr_content="$2"
}

# Function to log messages to stdout
log_message() {
    DATE=$(date '+%Y-%m-%d %H:%M:%S')
    echo "${DATE} - $1"
}
