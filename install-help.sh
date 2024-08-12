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
    echo "Usage: web-install help [option]"
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
    echo "  web-install ansible"
    echo ""
}

# Display the banner
display_banner

# If no arguments are provided, show the help menu
if [ $# -eq 0 ]; then
    display_help
fi
