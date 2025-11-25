#!/bin/bash
# =============================================================
# start-dvwa.sh - Start Damn Vulnerable Web Application (DVWA)
# Comprehensive, Explanatory, Production-Ready Script
# =============================================================

# ---------------------------
# PURPOSE
# ---------------------------
# This script automates the deployment of DVWA using Docker.
# It ensures that the environment is clean, the container network
# is prepared, and DVWA starts reliably for testing security tools.

# ---------------------------
# CONFIGURATION
# ---------------------------
DVWA_CONTAINER="dvwa-app"
DVWA_IMAGE="vulnerables/web-dvwa"
DVWA_PORT=8080
NETWORK_NAME="dvwa-net"

# ---------------------------
# Helper Function: Print status messages
# ---------------------------
info() {
  echo -e "[INFO] $1"
}

error() {
  echo -e "[ERROR] $1" >&2
}

# ---------------------------
# Step 1: Create Docker network (if missing)
# ---------------------------
info "Checking Docker network..."
if ! docker network inspect "$NETWORK_NAME" >/dev/null 2>&1; then
  info "Creating Docker network: $NETWORK_NAME"
  docker network create "$NETWORK_NAME"
else
  info "Docker network already exists."
fi

# ---------------------------
# Step 2: Stop and remove existing DVWA container
# ---------------------------
if docker ps -a --format '{{.Names}}' | grep -q "^$DVWA_CONTAINER$"; then
  info "Stopping existing DVWA container..."
  docker stop "$DVWA_CONTAINER" >/dev/null 2>&1

  info "Removing old DVWA container..."
  docker rm "$DVWA_CONTAINER" >/dev/null 2>&1
fi

# ---------------------------
# Step 3: Pull the latest DVWA image
# ---------------------------
info "Pulling DVWA Docker image..."
docker pull "$DVWA_IMAGE"

# ---------------------------
# Step 4: Run DVWA container
# ---------------------------
info "Starting DVWA on port $DVWA_PORT..."
docker run -d \
  --name "$DVWA_CONTAINER" \
  --network "$NETWORK_NAME" \
  -p "$DVWA_PORT":80 \
  "$DVWA_IMAGE"

if [ $? -ne 0 ]; then
  error "Failed to start DVWA container."
  exit 1
fi

# ---------------------------
# Step 5: Final Status
# ---------------------------
info "DVWA is now running!"
info "Access it at: http://localhost:$DVWA_PORT"

exit 0
