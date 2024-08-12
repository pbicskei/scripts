#!/bin/bash

# Ensure the script exits immediately if a command exits with a non-zero status
set -e

# Function to display a cool banner
display_banner() {
    echo "#############################################"
    echo "#                                           #"
    echo "#           WELCOME TO INSTALLER            #"
    echo "#                                           #"
    echo "#       Easily Install DevOps Tools         #"
    echo "#                                           #"
    echo "#############################################"
    echo ""
}

# Function to display help menu
display_help() {
    echo "Usage: ./help.sh [option]"
    echo ""
    echo "Options:"
    echo "  ansible            Install Ansible on your system."
    echo "  docker             Install Docker on your system."
    echo "  docker-rootless    Install Docker in rootless mode."
    echo "  terraform          Install Terraform on your system."
    echo "  terraform-docs     Install Terraform-Docs on your system."
    echo "  help               Display this help message."
    echo ""
    echo "Example:"
    echo "  ./help.sh ansible"
    echo ""
}

# Function to handle installation based on the argument provided
handle_installation() {
    case $1 in
        ansible)
            echo "Installing Ansible..."
            # Include the Ansible installation script content here
            # [Insert the Ansible installation script from earlier]
            ;;
        docker)
            echo "Installing Docker..."
            # Include the Docker installation script content here
            # [Insert the Docker installation script from earlier]
            ;;
        docker-rootless)
            echo "Installing Docker Rootless..."
            # Include the Docker Rootless installation script content here
            # [Insert the Docker Rootless installation script from earlier]
            ;;
        terraform)
            echo "Installing Terraform..."
            # Install Terraform
            sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
            curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
            echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
            sudo apt-get update && sudo apt-get install -y terraform
            terraform --version
            echo "Terraform installation complete!"
            ;;
        terraform-docs)
            echo "Installing Terraform-Docs..."
            # Include the Terraform-Docs installation script content here
            # [Insert the Terraform-Docs installati
