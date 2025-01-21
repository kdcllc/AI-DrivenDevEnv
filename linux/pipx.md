# `pipx` isolated apps and environments manager

Install and Run Python Applications in Isolated Environments

[`pipx` installation](https://pipx.pypa.io/stable/installation/)

Install after the global version of python is set with `pyenv`

```bash
    sudo apt update
    sudo apt install pipx
    pipx ensurepath


    # overide the default python version, replace with your preferred python version
    export PIPX_DEFAULT_PYTHON="$HOME/.pyenv/versions/3.8.5/bin/python"
```
