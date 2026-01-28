#!/bin/bash

CONTAINER_NAME="docker-lab-nginx"

# Ensure Docker service is running
if ! systemctl is-active --quiet docker; then
  echo "⚠️ Docker service is not running. Starting Docker..."
  sudo systemctl start docker

  if ! systemctl is-active --quiet docker; then
    echo "❌ Failed to start Docker service."
    exit 1
  fi
fi

# Check if container is running
if docker ps --format '{{.Names}}' | grep -q "^${CONTAINER_NAME}$"; then
  echo "✅ Container '${CONTAINER_NAME}' is already running."
else
  echo "🔄 Container '${CONTAINER_NAME}' is not running. Restarting..."
  docker restart "${CONTAINER_NAME}"

  if docker ps --format '{{.Names}}' | grep -q "^${CONTAINER_NAME}$"; then
    echo "✅ Container '${CONTAINER_NAME}' restarted successfully."
  else
    echo "❌ Failed to restart container '${CONTAINER_NAME}'."
    exit 1
  fi
fi