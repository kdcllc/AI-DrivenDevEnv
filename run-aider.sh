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

# Get the directory where the script is running
script_dir=$(dirname "$(realpath "$0")")

# Check if .aider.model.settings.yml file exists, if not create it
settings_file="$script_dir/.aider.model.settings.yml"
if [ ! -f "$settings_file" ]; then
    echo "Creating .aider.model.settings.yml file..."
    cat <<EOL > "$settings_file"
- name: ollama_chat/qwen2.5-coder:14b
  extra_params:
    num_ctx: 8192
- name: ollama_chat/qwen2.5-coder:0.5b
  extra_params:
    num_ctx: 8192
EOL
else
    echo ".aider.model.settings.yml file already exists."
fi

# Check if .aider.conf.yml file exists, if not create it
conf_file="$script_dir/.aider.conf.yml"
if [ ! -f "$conf_file" ]; then
    echo "Creating .aider.conf.yml file..."
    cat <<EOL > "$conf_file"
# https://aider.chat/docs/config/aider_conf.html
## Specify the model to use for the main chat
model: ollama_chat/qwen2.5-coder:14b 

## Specify the model to use for commit messages and chat history summarization (default depends on --model)
weak-model: ollama_chat/qwen2.5-coder:0.5b

## Specify the edit format for the editor model (default: depends on editor model)
#editor-edit-format: whole

## Suggested number of tokens to use for repo map, use 0 to disable
#map-tokens: 8192

## Control how often the repo map is refreshed. Options: auto, always, files, manual (default: auto)
map-refresh: auto
EOL
else
    echo ".aider.conf.yml file already exists."
fi

# Check if aider is installed
if ! command_exists aider; then
    echo "aider is not installed. Installing..."
    pipx install aider-chat
else
    echo "aider is already installed."
fi

export OLLAMA_API_BASE=http://127.0.0.1:11434
export AIDER_EDITOR="code --wait"

aider --model ollama_chat/qwen2.5-coder:14b --editor-edit-format whole