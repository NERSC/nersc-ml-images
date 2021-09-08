ARG nvc_tag
FROM nvcr.io/nvidia/tensorflow:$nvc_tag

RUN python -m pip install --no-cache-dir -U pip
RUN apt-get update && apt-get install -y rsync

RUN pip install --no-cache-dir \
    ruamel.yaml pyyaml pillow matplotlib \
    jupyter-server-proxy wandb pandas h5py \
    requests tabulate ray ray[tune] ray[rllib] pytest \
    git+https://github.com/NERSC/nersc-tensorboard-helper.git
