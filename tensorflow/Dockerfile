ARG nvc_tag
FROM nvcr.io/nvidia/tensorflow:$nvc_tag

RUN pip install ruamel.yaml pyyaml pillow \
    cmakeipympl jupyter-server-proxy \
    requests tabulate ray ray[tune] ray[rllib] tensorboardX

# NERSC TensorBoard Jupyter helper
COPY nersc-tensorboard-helper/nersc_tensorboard_helper.py /opt/conda/lib/python3.6/site-packages
