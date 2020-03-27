ARG nvc_tag
FROM nvcr.io/nvidia/pytorch:$nvc_tag

#install other python stuff necessary
RUN pip install h5py ruamel.yaml pyyaml \
    setuptools cmake cffi typing \
    ipympl ipython ipykernel jupyter-server-proxy \
    numpy matplotlib scipy scikit-learn pandas pillow \
    tensorboard

# NERSC TensorBoard Jupyter helper
COPY nersc-tensorboard-helper/nersc_tensorboard_helper.py /opt/conda/lib/python3.6/site-packages
