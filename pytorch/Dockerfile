ARG nvc_tag
FROM nvcr.io/nvidia/pytorch:$nvc_tag

# install other python stuff necessary
RUN apt-get update && apt-get install -y rsync && \
    pip install --no-cache-dir \
    ruamel.yaml pyyaml cmake ipympl pillow wandb torchsummary \
    jupyter-server-proxy requests tabulate ray ray[tune] ray[rllib] \
    git+https://github.com/NERSC/nersc-tensorboard-helper.git
