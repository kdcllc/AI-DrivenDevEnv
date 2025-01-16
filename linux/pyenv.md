# `pyenv`  python version manager

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
      sudo apt update && ssudo apt install build-essential libssl-dev zlib1g-dev \
        libbz2-dev libreadline-dev libsqlite3-dev curl git \
        libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
```
