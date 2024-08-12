#!/bin/bash

# Update the package list to make sure we’re getting the freshest packages
echo "Updating package list..."
sudo apt-get update -y

# Install prerequisites
echo "Installing prerequisites..."
sudo apt-get install -y curl unzip

# Define the version of terraform-docs you want to install
TERRAFORM_DOCS_VERSION="v0.18.0"

# Download terraform-docs binary from GitHub releases
echo "Downloading terraform-docs..."
curl -Lo terraform-docs.tar.gz https://github.com/terraform-docs/terraform-docs/releases/download/$TERRAFORM_DOCS_VERSION/terraform-docs-$TERRAFORM_DOCS_VERSION-linux-amd64.tar.gz

# Extract the downloaded tar.gz file
echo "Extracting terraform-docs..."
tar -xzf terraform-docs.tar.gz

# Move the binary to /usr/local/bin for system-wide use
echo "Installing terraform-docs..."
sudo mv terraform-docs /usr/local/bin/

# Cleanup the tar.gz file
echo "Cleaning up..."
rm terraform-docs.tar.gz

# Verify installation
echo "Verifying terraform-docs installation..."
terraform-docs --version

echo "Installation complete! You can now use terraform-docs."
