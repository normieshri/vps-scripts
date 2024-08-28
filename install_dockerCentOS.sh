#!/bin/bash

# Update the system
echo "Updating the system..."
yum -y update

# Install prerequisites
echo "Installing prerequisites..."
yum -y install yum-utils

# Add Docker’s official GPG key
echo "Adding Docker's official GPG key..."
yum -y install https://download.docker.com/linux/centos/gpg

# Set up the Docker repository
echo "Setting up the Docker repository..."
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# Install Docker Engine
echo "Installing Docker..."
yum -y install docker-ce docker-ce-cli containerd.io

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
