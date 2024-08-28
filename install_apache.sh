#!/bin/bash

# Update the package list
echo "Updating package lists..."
apt-get update -y

# Install Apache2 package
echo "Installing Apache web server..."
apt-get install -y apache2

# Enable Apache to start on boot
echo "Enabling Apache to start on boot..."
systemctl enable apache2

# Start the Apache service
echo "Starting Apache web server..."
systemctl start apache2

# Verify the installation
echo "Verifying Apache installation..."
apache2 -v

# Output the status of Apache
echo "Checking Apache status..."
systemctl status apache2
