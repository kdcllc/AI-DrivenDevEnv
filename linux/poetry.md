# `poetry` dependency manager

Poetry is a tool for dependency management and packaging in Python. It allows you to declare the libraries your project depends on and it will manage (install/update) them for you. Poetry offers a lockfile to ensure repeatable installs, and can build your project for distribution.

[`poetry` installation](https://python-poetry.org/docs/#installation)
[`poetry` usage](https://python-poetry.org/docs/basic-usage/)

```bash

    pipx install poetry

    poetry completions bash >> ~/.bash_completion
    poetry new poetry-demo

```

In order for vscode to see the types and installed deps, to set the virtual enviroment to be placed within the project.

```bash
    # enable env to be inside of the project
    poetry config virtualenvs.in-project true
    echo 'poetry config virtualenvs.in-project true' >> ~/.bashrc
```


```bash
poetry env list  # shows the name of the current environment
poetry env remove <current environment>
poetry install  # will create a new environment using your updated configuration
```
