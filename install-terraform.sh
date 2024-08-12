#!/bin/bash

# Definieer de versie van Terraform die je wilt installeren
TERRAFORM_VERSION="1.9.4"

# Download de Terraform-binary
echo "Downloading Terraform version ${TERRAFORM_VERSION}..."
wget "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip" -O /tmp/terraform.zip

# Controleer of de download succesvol was
if [ $? -ne 0 ]; then
    echo "Failed to download Terraform. Exiting."
    exit 1
fi

# Installeer unzip als het nog niet geïnstalleerd is
if ! command -v unzip &> /dev/null; then
    echo "unzip not found. Installing unzip..."
    sudo apt-get update && sudo apt-get install -y unzip
fi

# Pak het gedownloade bestand uit
echo "Unzipping Terraform..."
unzip /tmp/terraform.zip -d /tmp/

# Verplaats de Terraform-binary naar /usr/local/bin
echo "Installing Terraform..."
sudo mv /tmp/terraform /usr/local/bin/

# Verwijder het tijdelijke bestand
rm /tmp/terraform.zip

# Controleer of Terraform succesvol is geïnstalleerd
echo "Verifying Terraform installation..."
terraform version

# Controleer of de installatie succesvol was
if [ $? -ne 0 ]; then
    echo "Terraform installation failed. Exiting."
    exit 1
fi

echo "Terraform installed successfully."