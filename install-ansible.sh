#!/bin/bash

# Ensure the script exits immediately if a command exits with a non-zero status
set -e

# Update the package list to ensure we're getting the latest packages
echo "Updating package list..."
sudo apt-get update -y

# Install prerequisites
echo "Installing prerequisites..."
sudo apt-get install -y software-properties-common

# Add Ansible's official PPA (Personal Package Archive)
echo "Adding Ansible PPA..."
sudo add-apt-repository --yes --update ppa:ansible/ansible

# Install Ansible
echo "Installing Ansible..."
sudo apt-get install -y ansible

# Verify installation
echo "Verifying Ansible installation..."
ansible --version

echo "Installation complete! You can now use Ansible."
