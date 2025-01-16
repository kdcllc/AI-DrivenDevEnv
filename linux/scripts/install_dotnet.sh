#!/bin/bash

# Get the current username to use in the symbolic link creation
USERNAME=$(whoami)

# Add the following values to ~/.bashrc file
echo "export DOTNET_ROOT=$HOME/dotnet" >> ~/.bashrc
echo "export PATH=$PATH:$HOME/dotnet" >> ~/.bashrc
echo "export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools" >> ~/.bashrc
echo "export SSL_CERT_DIR=$HOME/.aspnet/dev-certs/trust:/usr/lib/ssl/certs" >> ~/.bashrc

# Reload the .bashrc file to apply changes
source ~/.bashrc

# Create a symbolic link for dotnet in /usr/local/bin (requires sudo)
echo "Creating symbolic link for dotnet..."
sudo ln -s "$HOME"/dotnet/dotnet "/usr/local/bin/dotnet"

# Print a success message and exit
echo "Script completed successfully."