#!/bin/bash

# Define the CWP installation URL for CentOS 8
CWP_INSTALLER_URL="http://centos-webpanel.com/cwp-el8-latest"

# Configure CentOS repositories
echo "Configuring CentOS repositories..."
cd /etc/yum.repos.d/
sudo sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
sudo sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
sudo yum update -y

# Update the system and install prerequisites
echo "Updating the system and installing prerequisites..."
yum -y install wget

# Download the CWP installer
echo "Downloading CWP installer..."
cd /usr/local/src
wget $CWP_INSTALLER_URL -O cwp-el8-latest

# Make the installer script executable
chmod +x cwp-el8-latest

# Run the CWP installer
echo "Starting CWP installation..."
sh cwp-el8-latest

# Clean up
echo "Cleaning up..."
rm -f cwp-el8-latest

# Installation complete
echo "CWP installation is complete. Please follow the instructions on the screen to finalize the setup."
