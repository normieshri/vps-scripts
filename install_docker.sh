#!/bin/bash

# Update the system
echo "Updating the system..."
apt-get update -y

# Install prerequisites
echo "Installing prerequisites..."
apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# Add Docker’s official GPG key
echo "Adding Docker's official GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

# Set up the Docker repository
echo "Setting up the Docker repository..."
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Update the package index
echo "Updating the package index..."
apt-get update -y

# Install Docker Engine
echo "Installing Docker..."
apt-get install -y docker-ce

# Start and enable Docker service
echo "Starting and enabling Docker service..."
systemctl start docker
systemctl enable docker

# Verify Docker installation
echo "Verifying Docker installation..."
docker --version
docker info

# Installation complete
echo "Docker installation is complete."
