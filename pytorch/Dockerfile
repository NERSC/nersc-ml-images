ARG nvc_tag
FROM nvcr.io/nvidia/pytorch:$nvc_tag

RUN python -m pip install --no-cache-dir -U pip
RUN apt-get update && apt-get install -y rsync

# install other python stuff necessary
RUN pip install --no-cache-dir \
    ruamel.yaml pyyaml cmake ipympl pillow wandb torchsummary pandas \
    jupyter-server-proxy requests tabulate ray ray[tune] ray[rllib] h5py \
    opencv-python-headless scikit-image \
    git+https://github.com/NERSC/nersc-tensorboard-helper.git
