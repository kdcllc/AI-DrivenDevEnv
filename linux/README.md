# AI Driven Developer Environment for Ubuntu Linux

## `aider-chat`

[`aider-chat` installation](https://aider.chat/docs/install.html)

There are many ways to install `aider-chat` but I prefer to use `pipx` to install into my version of python.

```bash
    pipx install aider-chat
```

## `pipx` isolated apps and environments manager

Install and Run Python Applications in Isolated Environments

[`pipx` installation](https://pipx.pypa.io/stable/installation/)

Install after the global version of python is set with `pyenv`

```bash
    sudo apt update
    sudo apt install pipx
    pipx ensurepath
```

## `poetry` dependency manager

Poetry is a tool for dependency management and packaging in Python. It allows you to declare the libraries your project depends on and it will manage (install/update) them for you. Poetry offers a lockfile to ensure repeatable installs, and can build your project for distribution.

[`poetry` installation](https://python-poetry.org/docs/#installation)
[`poetry` usage](https://python-poetry.org/docs/basic-usage/)

```bash
    pipx install poetry

    poetry completions bash >> ~/.bash_completion
    poetry new poetry-demo
```

## `pyenv` python version manager

[Github `pyenv`](https://github.com/pyenv/pyenv)
[`pyenv` command usage](https://github.com/pyenv/pyenv/blob/master/COMMANDS.md)

How to manage different version of python on the same machine.

1. Automatic installer:

```bash
     curl -fsSL https://pyenv.run | bash
```

2. Set up your shell environment for Pyenv and add the commands to ~/.bashrc by running the following in your terminal:

 ```bash
  echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
  echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
  echo 'eval "$(pyenv init - bash)"' >> ~/.bashrc
 ```

3. Restart your shell

 ```bash
  exec "$SHELL"
 ```

4. Install build dependence

 ```bash
      sudo apt update && sudo apt install build-essential libssl-dev zlib1g-dev \
        libbz2-dev libreadline-dev libsqlite3-dev curl git \
        libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
```

- https://github.com/open-webui/open-webu

```bash

## never worked for me
docker run -d -p 3000:8080 --add-host=host.docker.internal:host-gateway -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:main


## worked
docker run -d --network=host -v open-webui:/app/backend/data -e OLLAMA_BASE_URL=http://127.0.0.1:11434 --name open-webui --restart always ghcr.io/open-webui/open-webui:main

```

- [`gptme` llm local agent](https://github.com/ErikBjare/gptme)

```bash
    pipx install 'gptme[browser]'
    # We need to use the same version of Playwright as the one installed by gptme
    # when downloading the browser binaries. gptme will attempt this automatically
    PW_VERSION=$(pipx runpip gptme show playwright | grep Version | cut -d' ' -f2)
    pipx run playwright==$PW_VERSION install chromium-headless-shell
    
    # On Ubuntu
    sudo apt install lynx
    
    
    pipx install gptme-rag

    # run 
    gptme -m azure/gpt-4o

    OPENAI_BASE_URL="http://127.0.0.1:11434/v1" gptme 'hello' -m local/llama3.2:latest
```
