#!/bin/bash

CONTAINER_NAME="docker-lab-nginx"
LOG_FILE="/home/ec2-user/cloud-docker-kubernetes-labs/logs/container_restart.log"

log() {
  echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
}

log "===== Execução do script iniciada ====="

# Ensure Docker service is running
if ! systemctl is-active --quiet docker; then
  log "Docker service is not running. Starting Docker..."
  sudo systemctl start docker

  if ! systemctl is-active --quiet docker; then
    log "❌ Failed to start Docker service."
    exit 1
  fi
fi

# Check if container is running
if docker ps --format '{{.Names}}' | grep -q "^${CONTAINER_NAME}$"; then
  log "✅ Container '${CONTAINER_NAME}' is already running."
else
  log "🔄 Container '${CONTAINER_NAME}' is not running. Restarting..."
  docker restart "${CONTAINER_NAME}" >> "$LOG_FILE" 2>&1

  if docker ps --format '{{.Names}}' | grep -q "^${CONTAINER_NAME}$"; then
    log "✅ Container '${CONTAINER_NAME}' restarted successfully."
  else
    log "❌ Failed to restart container '${CONTAINER_NAME}'."
    exit 1
  fi
fi

log "===== Execução do script finalizada ====="