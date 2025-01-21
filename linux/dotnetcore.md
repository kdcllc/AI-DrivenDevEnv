# `dotnetcore` Installation Guide for Linux

[Download .NET SDK For Linux](https://dotnet.microsoft.com/en-us/download)

## Install .NET Core SDK

```bash

# https://download.visualstudio.microsoft.com/download/pr/0e717d01-aad7-475a-8b67-50c59cf043b1/6eaa1c636e15ec8e1b97b3438360c770/dotnet-sdk-9.0.102-linux-x64.tar.gz

    mkdir -p $HOME/dotnet && tar zxf dotnet-sdk-9.0.102-linux-x64.tar.gz -C $HOME/dotnet

    echo 'export DOTNET_ROOT=$HOME/dotnet' >> ~/.bashrc
    echo 'export PATH=$PATH:$HOME/dotnet' >> ~/.bashrc
    echo 'export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools' >> ~/.bashrc
    echo 'export SSL_CERT_DIR=$HOME/.aspnet/dev-certs/trust:/usr/lib/ssl/certs' >> ~/.bashrc

    export DOTNET_ROOT=$HOME/dotnet
    export PATH=$PATH:$HOME/dotnet
    export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools
    export SSL_CERT_DIR=$HOME/.aspnet/dev-certs/trust:/usr/lib/ssl/certs

```

## Issues

### Certificate issues

- [Linux certificate not trusted](https://learn.microsoft.com/en-us/aspnet/core/security/enforcing-ssl?view=aspnetcore-9.0&tabs=visual-studio%2Clinux-sles#linux-certificate-not-trusted)

```bash
    # check if the certificate is valid
    ls -la ~/.dotnet/corefx/cryptography/x509stores/my

    # The HTTPS developer Kestrel certificate file is the SHA1 thumbprint. When the file is deleted via dotnet dev-certs https --clean, it's regenerated when needed with a different thumbprint. Check the thumbprint of the exported certificate matches with the following command:
    openssl x509 -noout -fingerprint -sha1 -inform pem -in /usr/local/share/ca-certificates/aspnet/https.crt

```

- [Linux-specific considerations](https://learn.microsoft.com/en-us/aspnet/core/security/enforcing-ssl?view=aspnetcore-9.0&tabs=visual-studio%2Clinux-sles#linux-specific-considerations)

```bash
    # Trust HTTPS certificate on Linux with linux-dev-certs
    dotnet tool update -g linux-dev-certs
    dotnet linux-dev-certs install
```

- [Ubuntu trust the certificate for service-to-service communication](https://learn.microsoft.com/en-us/aspnet/core/security/enforcing-ssl?view=aspnetcore-6.0&tabs=visual-studio%2Clinux-ubuntu%2Clinux-sles#ubuntu-trust-the-certificate-for-service-to-service-communication)

```bash
    dotnet dev-certs https
    sudo -E dotnet dev-certs https -ep /usr/local/share/ca-certificates/aspnet/https.crt --format PEM
    sudo update-ca-certificates
```


### The configured user limit (128) on the number of inotify instances has been reached.

While running tests I can into the following error:

(System.IO.IOException: The configured user limit (128) on the number of inotify instances has been reached.)[https://github.com/dotnet/aspnetcore/issues/8449#issuecomment-512275929]

Solution:

```bash
    echo fs.inotify.max_user_instances=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
```
