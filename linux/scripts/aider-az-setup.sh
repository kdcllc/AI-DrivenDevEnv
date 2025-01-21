#!/bin/bash
# "Run chmod +x aider-az-setup.sh && ./aider-az-setup.sh"

echo "Creating Azure Aider setup"

# Function to append environment variables and alias to ~/.bashrc
append_to_bashrc() {
    echo '' >> ~/.bashrc
    echo '# AIDER_AUTO_COMMITS (default is 1)' >> ~/.bashrc
    echo 'export AIDER_AUTO_COMMITS=0' >> ~/.bashrc
    echo "export AZURE_API_KEY=$AZURE_API_KEY" >> ~/.bashrc
    echo "export AZURE_API_VERSION=$AZURE_API_VERSION" >> ~/.bashrc
    echo "export AZURE_API_BASE=$AZURE_API_BASE" >> ~/.bashrc

    # Append alias to ~/.bashrc
    echo "alias aider-az='aider --model azure/gpt-4o --dark-mode'" >> ~/.bashrc
}

# Check if parameters are provided
if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
    echo "Usage: $0 <api_key> <api_version> <api_base>"
    exit 1
fi

AZURE_API_KEY=$1
AZURE_API_VERSION=$2
AZURE_API_BASE=$3

append_to_bashrc

# Reload the ~/.bashrc file to apply changes
source ~/.bashrc

echo "Environment variables and alias have been updated and applied."

echo "Run chmod +x aider-az-setup.sh && ./aider-az-setup.sh <api_key> <api_version> <api_base>"
