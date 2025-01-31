# `open-webui` and `stable-diffusion-webui`for local gpt

[open-webui](https://github.com/open-webui/open-webui)

[stable-diffusion-webui](https://github.com/AUTOMATIC1111/stable-diffusion-webui)
[Install on Linux](https://github.com/openvinotoolkit/stable-diffusion-webui/wiki/Installation-on-Intel-Silicon#linux)

```bash

    # python version 3.10.16

    # installed for torch support
    sudo apt install --no-install-recommends google-perftools
    sudo apt install nvidia-cuda-toolkit

    export PYTORCH_TRACING_MODE=TORCHFX
    export COMMANDLINE_ARGS="--skip-torch-cuda-test --precision full --no-half --api" 
    export 'PYTORCH_CUDA_ALLOC_CONF=max_split_size_mb:512'
   
    # Launch the WebUI
    ./webui.sh 
```

CUDA

```bash
    nvcc -V

    # display the GPU memory usage
    nvidia-smi 

    # to kill memory leaks
    sudo kill -9 <process_id>
```

I had issuew with Ollama not being able to communicate with Nvidia

[CUDA must be restarted after PC went into suspense](https://discuss.pytorch.org/t/userwarning-cuda-initialization-cuda-unknown-error-this-may-be-due-to-an-incorrectly-set-up-environment-e-g-changing-env-variable-cuda-visible-devices-after-program-start-setting-the-available-devices-to-be-zero/129335/3)
You could try to execute:

```bash
    sudo rmmod nvidia_uvm
    sudo modprobe nvidia_uvm
```

which helps on my Ubuntu system after it was suspended.

* [deepseek-coder-v2](https://ollama.com/library/deepseek-coder-v2)
* [qwen2.5-coder:32b](https://ollama.com/library/qwen2.5-coder:32b)
* [nomic-embed-text:latest](https://ollama.com/library/nomic-embed-text:latest)
* [mxbai-embed-large:latest](https://ollama.com/library/mxbai-embed-large:latest)
* [qwen2.5-coder:latest](https://ollama.com/library/qwen2.5-coder:latest)
* [llama3.1:latest](https://ollama.com/library/llama3.1:latest)
* [qwen2.5-coder:14b](https://ollama.com/library/qwen2.5-coder:14b)
* [qwen2.5-coder:3b](https://ollama.com/library/qwen2.5-coder:3b)
* [qwen2.5-coder:1.5b](https://ollama.com/library/qwen2.5-coder:1.5b)
* [qwen2.5-coder:0.5b](https://ollama.com/library/qwen2.5-coder:0.5b)
* [llama3.2:latest](https://ollama.com/library/llama3.2:latest)
* [llama3.2-vision:latest](https://ollama.com/library/llama3.2-vision:latest)

## Running docker container

```bash

## never worked for me
docker run -d -p 3000:8080 --add-host=host.docker.internal:host-gateway -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:main


## worked
docker run -d --network=host -v open-webui:/app/backend/data -e OLLAMA_BASE_URL=http://127.0.0.1:11434 --name open-webui --restart always ghcr.io/open-webui/open-webui:main

```
