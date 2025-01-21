# AI Driven Development Environment

![I stand with Israel](./images/IStandWithIsrael.png)

[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](https://raw.githubusercontent.com/kdcllc/AI-DrivenDevEnv/master/LICENSE) [![Awesome](https://awesome.re/badge.svg)](https://awesome.re)

## Description

This repository contains scripts and documentation for setting up various development environments and tools, particularly on Linux systems. It includes automation scripts for installing dependencies, configuring environment variables, and running specific tools.

## Features

- **Automation Scripts**: Predefined scripts to automate the setup of various tools and environments.
- **Documentation**: Detailed instructions for setting up different tools and technologies.
- **Models**: Integration with AI models such as `qwen2.5-coder`, `llama3.1`, etc.

## Getting Started

### Prerequisites

- Linux operating system (Ubuntu 18.04, 20.04, 22.04, 23.04, or 24.04)
- Python 3.x
- Git

### Installation

1. **Clone the Repository**

   ```bash
   git clone https://github.com/kdcllc/AI-DrivenDevEnv.git
   cd AI-DrivenDevEnv
   ```

2. **Run the Setup Script**

   ```bash
   chmod +x run-aider.sh
   ./run-aider.sh
   ```

3. **Configure Azure (Optional)**

   If you need to configure Azure-related settings, use the `aider-az-setup.sh` script:

   ```bash
   chmod +x linux/scripts/aider-az-setup.sh
   ./linux/scripts/aider-az-setup.sh <api_key> <api_version> <api_base>
   ```

4. **Install ODBC (Optional)**

   If you need to install the Microsoft ODBC driver for SQL Server, use the `install-odbc.sh` script:

   ```bash
   sudo chmod +x linux/scripts/install-odbc.sh
   sudo ./linux/scripts/install-odbc.sh
   ```

## Usage

### Running Aider

To run the main tool, simply execute:

```bash
./run-aider.sh
```

This will start the `aider` tool with the configured models and settings.

### Accessing Documentation

For detailed instructions on setting up specific tools, refer to the documentation files in the `linux/` directory:

- [open-webui.md](linux/open-webui.md)
- [dotnetcore.md](linux/dotnetcore.md)
- [pipx.md](linux/pipx.md)
- [poetry.md](linux/poetry.md)
- [pyenv.md](linux/pyenv.md)

## Contributing

We welcome contributions from the community! Please read our [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on how to contribute.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

## Hire Me

Please send [email](mailto:kingdavidconsulting@gmail.com) if you consider hiring me.

[![buymeacoffee](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://www.buymeacoffee.com/vyve0og)

## Give a Star! :star:

If you like or are using this project to learn or start your solution, please give it a star. Thanks!
