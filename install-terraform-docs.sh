#!/bin/bash

# Ensure the script exits immediately if a command exits with a non-zero status
set -e

# Update the package list to ensure we're getting the latest packages
echo "Updating package list..."
sudo apt-get update -y

# Install prerequisites if not already installed
echo "Installing prerequisites..."
sudo apt-get install -y curl unzip

# Define the version of terraform-docs you want to install
TERRAFORM_DOCS_VERSION="v0.18.0"

# Set the temporary file and extraction directory
TEMP_DIR=$(mktemp -d)
TERRAFORM_DOCS_TAR="$TEMP_DIR/terraform-docs.tar.gz"
TERRAFORM_DOCS_BIN="$TEMP_DIR/terraform-docs"

# Download terraform-docs binary from GitHub releases
echo "Downloading terraform-docs..."
curl -Lo $TERRAFORM_DOCS_TAR https://github.com/terraform-docs/terraform-docs/releases/download/$TERRAFORM_DOCS_VERSION/terraform-docs-$TERRAFORM_DOCS_VERSION-linux-amd64.tar.gz

# Extract the downloaded tar.gz file
echo "Extracting terraform-docs..."
tar -xzf $TERRAFORM_DOCS_TAR -C $TEMP_DIR

# Move the binary to /usr/local/bin for system-wide use
echo "Installing terraform-docs..."
sudo mv $TERRAFORM_DOCS_BIN /usr/local/bin/terraform-docs

# Cleanup temporary files and directory
echo "Cleaning up..."
rm -rf $TEMP_DIR

# Verify installation
echo "Verifying terraform-docs installation..."
terraform-docs --version

echo "Installation complete! You can now use terraform-docs."
