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
    # this value can be in the project root or in the current directory .env file
    export OLLAMA_API_BASE=http://127.0.0.1:11434
    aider --model ollama_chat/deepseek-coder-v2
    aider --model ollama_chat/qwen2.5-coder:14b
    aider --model ollama_chat/qwen2.5-coder:3b
    aider --model ollama_chat/qwen2.5-coder:1.5b
    aider --model ollama_chat/qwen2.5-coder:0.5b
```

`.aider.model.settings.yml`

```yml
- name: ollama_chat/qwen2.5-coder:14b 
  extra_params:
    num_ctx: 8192
```

`.aider.conf.yml`

```yml
# https://aider.chat/docs/config/aider_conf.html
## Specify the model to use for the main chat
model: ollama_chat/qwen2.5-coder:14b 

## Specify the model to use for commit messages and chat history summarization (default depends on --model)
weak-model: ollama_chat/qwen2.5-coder:0.5b

## Specify the edit format for the editor model (default: depends on editor model)
#editor-edit-format: whole
```
