ARG nvc_tag
FROM nvcr.io/nvidia/tensorflow:$nvc_tag

RUN pip install ruamel.yaml pyyaml pillow \
    jupyter-server-proxy wandb \
    requests tabulate ray ray[tune] ray[rllib] tensorboardX \
    matplotlib

# NERSC TensorBoard Jupyter helper
COPY nersc-tensorboard-helper/nersc_tensorboard_helper.py /opt/conda/lib/python3.6/site-packages
