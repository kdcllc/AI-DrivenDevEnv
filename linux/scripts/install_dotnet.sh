#!/bin/bash

# chmod +x ./install_dotnet.sh
#
# This script installs a specific version of .NET Core SDK on Linux.
#
# Usage: ./install_dotnet-install.sh <dotnet-version> <clean-install>
#
# Example: ./install_dotnet.sh 8.0.303 clean-install
#
# This script will download the specified version of .NET Core SDK and install it in the $HOME/dotnet folder.
# If the $CLEAN_INSTALL parameter is provided, the existing $HOME/dotnet folder will be deleted before installing the new version.
#
# Note: This script assumes that wget is installed on your system. If wget is not installed, you can install it using your package manager.
#

# Check if a version parameter is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <dotnet-version>"
  exit 1
fi

# Set the version parameter
DOTNET_VERSION=$1
CLEAN_INSTALL=$2

# Download and install the specified version of .NET Core SDK
wget https://dotnetcli.azureedge.net/dotnet/Sdk/${DOTNET_VERSION}/dotnet-sdk-${DOTNET_VERSION}-linux-x64.tar.gz

# Check if the $HOME/dotnet folder exists and delete it if it does
if [ -n "${CLEAN_INSTALL}" ] && [ -d "$HOME/dotnet" ]; then
    echo "Deleting the $HOME/dotnet folder..."
    rm -rf "$HOME/dotnet"
fi

# Create the $HOME/dotnet folder and extract the .NET Core SDK to it
if [ -n "${CLEAN_INSTALL}" ]; then
    echo "Creating the $HOME/dotnet folder..."
    mkdir -p $HOME/dotnet
fi

# Extract the .NET Core SDK to the $HOME/dotnet folder
echo "Extracting the .NET Core SDK to the $HOME/dotnet folder..."
tar zxf dotnet-sdk-${DOTNET_VERSION}-linux-x64.tar.gz -C $HOME/dotnet

# Delete the downloaded .tar.gz file
echo "Deleting the downloaded .tar.gz file..."
rm dotnet-sdk-${DOTNET_VERSION}-linux-x64.tar.gz

# current username to use in the symbolic link creation
USERNAME=$(whoami)

# Add the following values to ~/.bashrc file if they don't already exist
echo "Adding the following values to ~/.bashrc file if they don't already exist..."

if ! grep -q "# dotnetcore installed by kdcllc" ~/.bashrc; then
  echo "# dotnetcore installed by kdcllc" >> ~/.bashrc
fi

if ! grep -q "export DOTNET_ROOT=$HOME/dotnet" ~/.bashrc; then
  echo "export DOTNET_ROOT=$HOME/dotnet" >> ~/.bashrc
fi

if ! grep -q "export PATH=\$PATH:\$HOME/dotnet" ~/.bashrc; then
  echo "export PATH=\$PATH:\$HOME/dotnet" >> ~/.bashrc
fi

if ! grep -q "export PATH=\$PATH:\$DOTNET_ROOT:\$DOTNET_ROOT/tools" ~/.bashrc; then
  echo "export PATH=\$PATH:\$DOTNET_ROOT:\$DOTNET_ROOT/tools" >> ~/.bashrc
fi

if ! grep -q "export SSL_CERT_DIR=$HOME/.aspnet/dev-certs/trust:/usr/lib/ssl/certs" ~/.bashrc; then
  echo "export SSL_CERT_DIR=$HOME/.aspnet/dev-certs/trust:/usr/lib/ssl/certs" >> ~/.bashrc
fi

if ! grep -q "export DOTNET_CLI_TELEMETRY_OPTOUT=1" ~/.bashrc; then
  echo "export DOTNET_CLI_TELEMETRY_OPTOUT=1" >> ~/.bashrc
fi

# Reload the .bashrc file to apply changes
source ~/.bashrc

# Check if the symbolic link for dotnet already exists
if [ ! -L "/usr/local/bin/dotnet" ]; then
  echo "Creating symbolic link for dotnet..."
  sudo ln -s "$HOME"/dotnet/dotnet "/usr/local/bin/dotnet"
else
  echo "Symbolic link for dotnet already exists."
fi

# Print a success message and exit
echo "Script completed successfully."

# Verify the installation
dotnet --list-sdks
dotnet --version