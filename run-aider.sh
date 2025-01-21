#!/bin/bash

# enable file permission
# chmod +x run-aider.sh
# This script installs ollama and aider if they are not already installed.
# It also checks and downloads the qwen2.5-coder:14b and qwen2.5-coder:0.5b models if they do not exist.

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check if ollama is installed
if ! command_exists ollama; then
    echo "ollama is not installed. Installing..."
    curl -fsSL https://ollama.com/install.sh | sh
else
    echo "ollama is already installed."
fi

# List of models to check and download
models=("qwen2.5-coder:14b" "qwen2.5-coder:0.5b")

# Check and download models if they do not exist
for model in "${models[@]}"; do
    if ! ollama list | grep -q "$model"; then
        echo "Model $model not found. Downloading..."
        ollama model pull "$model"
    else
        echo "Model $model already exists."
    fi
done

# Check if aider is installed
if ! command_exists aider; then
    echo "aider is not installed. Installing..."
    pipx install aider
else
    echo "aider is already installed."
fi