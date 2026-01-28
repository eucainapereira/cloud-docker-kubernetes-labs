#!/bin/bash

# Container name
CONTAINER_NAME="docker-lab-nginx"

# Check if the container is running
if docker ps --format '{{.Names}}' | grep -q "^${CONTAINER_NAME}$"; then
  echo "Container '${CONTAINER_NAME}' is running."
else
  echo "Container '${CONTAINER_NAME}' is NOT running."
  echo "Action required: investigate or restart the container."
fi