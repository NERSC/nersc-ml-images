ARG nvc_tag
FROM nvcr.io/nvidia/pytorch:$nvc_tag

RUN python -m pip install --no-cache-dir -U pip
RUN apt-get update && apt-get install -y rsync strace

# Install parallel HDF5
RUN wget https://github.com/HDFGroup/hdf5/archive/refs/tags/hdf5-1_12_3.tar.gz && \
    tar -xvf hdf5-1_12_3.tar.gz && \
    cd hdf5-hdf5-1_12_3 && \
    ./configure --enable-parallel --enable-shared --prefix=/opt/bin/hdf5 && \
    make -j 8 && \
    make install && \
    rm -rf hdf5-hdf5-1_12_3

# use pip to install and build h5py on top of parallel hdf5
RUN HDF5_MPI=ON CC=mpicc HDF5_DIR=/opt/bin/hdf5 pip install --no-deps --no-binary=h5py h5py

# install other python stuff necessary
RUN pip install --no-cache-dir \
    ruamel.yaml pyyaml cmake ipympl pillow wandb torchsummary pandas \
    jupyter-server-proxy requests tabulate ray ray[tune] ray[rllib] \
    scikit-image mpi4py deepspeed einops lightning \
    git+https://github.com/NERSC/nersc-tensorboard-helper.git

# Install PyG
RUN FORCE_CUDA=1 \
    TORCH_CUDA_ARCH_LIST="8.0" \
    CPATH=/usr/local/cuda/include \
    pip install --no-cache-dir git+https://github.com/pyg-team/pyg-lib.git torch_scatter torch_sparse torch_cluster torch-geometric
