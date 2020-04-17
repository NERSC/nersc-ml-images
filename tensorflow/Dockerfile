ARG nvc_tag
FROM nvcr.io/nvidia/tensorflow:$nvc_tag

#install other python stuff necessary
RUN apt-get update && apt-get install -y rsync && \
    pip install h5py ruamel.yaml pyyaml \
    setuptools cmake cffi typing \
    ipympl ipython ipykernel jupyter-server-proxy \
    numpy matplotlib scipy scikit-learn pandas pillow \
    tensorboard requests tabulate ray ray[tune] ray[rllib] tensorboardX

# NERSC TensorBoard Jupyter helper
COPY nersc-tensorboard-helper/nersc_tensorboard_helper.py /opt/conda/lib/python3.6/site-packages
