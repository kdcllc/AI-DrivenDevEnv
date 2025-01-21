#!/bin/bash

# chmod +x pull_models.sh

# qwen2:72b

# List of models to be pulled
models=(
  "deepseek-coder-v2"
  "qwen2.5-coder:32b"
  "nomic-embed-text:latest"
  "mxbai-embed-large:latest"
  "qwen2.5-coder:latest"
  "llama3.1:latest"
  "qwen2.5-coder:14b"
  "qwen2.5-coder:3b"
  "qwen2.5-coder:1.5b"
  "qwen2.5-coder:0.5b"
  "llama3.2:latest"
  "llama3.2-vision:latest"
)

# Function to pull a model
pull_model() {
  local model=$1
  echo "Pulling model: $model"
  # Replace the following line with the actual command to pull the model
  ollama pull $model
}

# Loop through the models and pull each one
for model in "${models[@]}"; do
  pull_model $model
done

echo "All models have been pulled successfully."