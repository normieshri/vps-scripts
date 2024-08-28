#!/bin/bash

# Prompt the user for the desired SSH port
echo "Please enter the new SSH port number:"
read NEW_SSH_PORT

# Validate the port number (must be a number)
if ! [[ "$NEW_SSH_PORT" =~ ^[0-9]+$ ]]; then
  echo "Invalid port number. Please enter a valid numeric port number."
  exit 1
fi

# Backup the current SSH configuration file
echo "Backing up the current SSH configuration..."
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak

# Change the SSH port in the configuration file
echo "Changing SSH port to $NEW_SSH_PORT..."
sed -i "s/^#Port [0-9]\+/Port $NEW_SSH_PORT/" /etc/ssh/sshd_config
sed -i "s/^Port [0-9]\+/Port $NEW_SSH_PORT/" /etc/ssh/sshd_config

# Allow the new port through the firewall if UFW is active
if systemctl is-active --quiet ufw; then
  echo "Allowing the new SSH port through the firewall..."
  ufw allow $NEW_SSH_PORT/tcp
fi

# Restart the SSH service to apply changes
echo "Restarting SSH service..."
systemctl restart sshd

# Verify that SSH is running on the new port
echo "Verifying that SSH is running on port $NEW_SSH_PORT..."
ss -tnlp | grep sshd

echo "SSH port has been changed to $NEW_SSH_PORT. Please remember to use 'ssh -p $NEW_SSH_PORT user@hostname' to connect."
