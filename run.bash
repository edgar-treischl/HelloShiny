#!/bin/bash

# Make script exit on any error
set -e

# Install Docker if not already installed
if ! command -v docker &> /dev/null
then
    echo "Docker not found. Installing Docker..."
    chmod +x install-docker.sh
    ./install-docker.sh
fi

# Pull Shiny App Docker images
echo "Pulling Docker images..."
docker pull ghcr.io/edgar-treischl/spectredash:latest
# Add more images as needed

# Start apps using Docker Compose
echo "Starting Shiny apps with Docker Compose..."
docker compose up -d


#chmod +x startup.sh