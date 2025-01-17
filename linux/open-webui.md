# `stable-diffusion-webui`

https://github.com/open-webui/open-webui


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
