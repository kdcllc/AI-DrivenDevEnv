#!/bin/bash
# chmod +x install_pyenv.sh
# ./install_pyenv.sh

# Step 1: Automatic installer
echo "Installing Pyenv..."
curl -fsSL https://pyenv.run | bash

# Step 2: Set up shell environment for Pyenv
echo "Setting up shell environment..."
export PYENV_ROOT="$HOME/.pyenv"
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init - bash)"' >> ~/.bashrc

# Step 3: Restart your shell
echo "Restarting shell..."
exec "$SHELL"

# Step 4: Install build dependencies
# https://github.com/pyenv/pyenv/wiki#suggested-build-environment
echo "Installing build dependencies..."
sudo apt update && sudo apt install build-essential libssl-dev zlib1g-dev \
      libbz2-dev libreadline-dev libsqlite3-dev curl git \
      libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

# Step 5: Install a new Python version and set it as the global version
echo "Installing Python 3.12:latest and setting it as global version..."
pyenv install 3.12:latest
pyenv global 3.12.8
pyenv versions