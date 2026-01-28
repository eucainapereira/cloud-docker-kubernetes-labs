# Simple container monitoring script for AWS EC2 environments

#!/bin/bash

CONTAINER_NAME="docker-lab-nginx"

# Check if Docker service is running
if ! systemctl is-active --quiet docker; then
  echo "⚠️ Docker service is not running. Starting Docker..."
  sudo systemctl start docker

  if systemctl is-active --quiet docker; then
    echo "✅ Docker service started successfully."
  else
    echo "❌ Failed to start Docker service."
    exit 1
  fi
fi

# Check if the container is running
if docker ps --format '{{.Names}}' | grep -q "^${CONTAINER_NAME}$"; then
  echo "✅ Container '${CONTAINER_NAME}' is running."
else
  echo "❌ Container '${CONTAINER_NAME}' is NOT running."
  echo "ℹ️ Action required: investigate or restart the container."
fi