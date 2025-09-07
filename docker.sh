#!/bin/bash

set -e  # Exit on any error

echo "👉 Updating package index..."
sudo apt-get update -y

echo "👉 Installing dependencies..."
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
    gnupg \
    lsb-release

echo "👉 Adding Docker’s official GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "👉 Adding Docker repository..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] \
  https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
  | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "👉 Updating package index again..."
sudo apt-get update -y

echo "👉 Installing Docker Engine..."
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

echo "✅ Docker installed successfully."

echo "👉 Enabling Docker to start on boot..."
sudo systemctl enable docker

echo "👉 Starting Docker service..."
sudo systemctl start docker

echo "✅ Docker is running."

echo "👉 Adding current user to 'docker' group (you may need to logout/login)..."
sudo usermod -aG docker $USER

echo "✅ Done."
