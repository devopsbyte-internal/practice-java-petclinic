#!/bin/bash

# Get current working directory and folder name
CURRENT_PATH=$(pwd)
DIR_NAME=$(basename "$CURRENT_PATH")

# Export working dir to .env
echo "HOST_PATH=$CURRENT_PATH" > .env
echo "WORKDIR_NAME=$DIR_NAME" >> .env
echo "Using working directory: /$DIR_NAME"
echo

# Stop any orphaned containers
docker compose down --remove-orphans

# Build the image (copies src/ into image)
docker compose build --no-cache --pull

# Run the container ephemeral
#docker compose run gradle-lab

# Long live:
# docker compose up -d --build
docker compose up -d