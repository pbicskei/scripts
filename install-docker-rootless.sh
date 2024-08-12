#!/bin/bash

# Ensure the script exits immediately if a command exits with a non-zero status
set -e

# Update the package list to ensure we're getting the latest packages
echo "Updating package list..."
sudo apt-get update -y

# Install prerequisites
echo "Installing prerequisites..."
sudo apt-get install -y \
    uidmap \
    dbus-user-session \
    fuse-overlayfs \
    slirp4netns

# Install Docker Rootless
echo "Installing Docker Rootless..."
curl -fsSL https://get.docker.com/rootless | sh

# Setup environment variables for Docker Rootless (add these to ~/.bashrc or ~/.zshrc if needed)
echo "Setting up Docker Rootless environment..."
export PATH=/usr/bin:$PATH
export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock

# Verify installation
echo "Verifying Docker Rootless installation..."
docker --version

echo "Installation complete! You can now use Docker in rootless mode."
