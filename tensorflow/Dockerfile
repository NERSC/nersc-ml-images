ARG nvc_tag
FROM nvcr.io/nvidia/tensorflow:$nvc_tag

RUN pip install --no-cache-dir \
    ruamel.yaml pyyaml pillow matplotlib \
    jupyter-server-proxy wandb \
    requests tabulate ray ray[tune] ray[rllib] \
    git+https://github.com/NERSC/nersc-tensorboard-helper.git
