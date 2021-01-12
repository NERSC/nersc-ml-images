ARG nvc_tag
FROM nvcr.io/nvidia/pytorch:$nvc_tag

#install other python stuff necessary
RUN apt-get update && apt-get install -y rsync && \
    pip install pyyaml PyYaml cmake \
    ipympl jupyter-server-proxy pillow wandb torchsummary\
    requests tabulate ray ray[tune] ray[rllib] tensorboardX && \
    pip install ruamel.yaml --ignore-installed

# NERSC TensorBoard Jupyter helper
COPY nersc-tensorboard-helper/nersc_tensorboard_helper.py /opt/conda/lib/python3.6/site-packages
