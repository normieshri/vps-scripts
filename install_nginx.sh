#!/bin/bash

# Update package list
apt-get update

# Install prerequisites
apt-get install -y curl gnupg2 ca-certificates lsb-release ubuntu-keyring

# Install Nginx
apt-get install -y nginx

# Enable and start Nginx
systemctl enable nginx
systemctl start nginx

# Check Nginx version and status
nginx -v
systemctl status nginx
