# `aider-chat`

[`aider-chat` installation](https://aider.chat/docs/install.html)

There are many ways to install `aider-chat` but I prefer to use `pipx` to install into my version of python.

```bash
    pipx install aider-chat

    # run
    aider --model azure/gpt-4o --dark-mode  --subtree-only
    
    aider --edit-format whole 

    # custom alias
    aider-az  --subtree-only

    # local modals

    export OLLAMA_API_BASE=http://127.0.0.1:11434
    aider --model ollama_chat/deepseek-coder-v2
    aider --model ollama_chat/qwen2.5-coder:14b
    aider --model ollama_chat/qwen2.5-coder:3b
    aider --model ollama_chat/qwen2.5-coder:1.5b
    aider --model ollama_chat/qwen2.5-coder:0.5b
```