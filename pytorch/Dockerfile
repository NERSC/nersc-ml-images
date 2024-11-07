ARG nvc_tag
FROM nvcr.io/nvidia/pytorch:$nvc_tag

RUN python -m pip install --no-cache-dir -U pip
RUN apt-get update && apt-get install -y rsync strace

# Trying an option for build concurrency
ARG num_build_workers=32

# Install parallel HDF5
ARG hdf5_version=hdf5-1_12_3
RUN wget https://github.com/HDFGroup/hdf5/archive/refs/tags/${hdf5_version}.tar.gz && \
    tar -xvf ${hdf5_version}.tar.gz && \
    cd hdf5-${hdf5_version} && \
    ./configure --enable-parallel --enable-shared --prefix=/opt/bin/hdf5 && \
    make -j ${num_build_workers} && \
    make install && \
    rm -rf hdf5-${hdf5_version}

# Use pip to install and build h5py on top of parallel hdf5
RUN HDF5_MPI=ON CC=mpicc HDF5_DIR=/opt/bin/hdf5 \
    pip install --no-cache-dir --no-deps --no-binary=h5py h5py

# Install other python stuff necessary
RUN pip install --no-cache-dir \
    ruamel.yaml pyyaml cmake ipympl pillow wandb torchsummary pandas \
    jupyter-server-proxy requests tabulate ray ray[tune] ray[rllib] \
    scikit-image mpi4py deepspeed einops lightning \
    accelerate datasets evaluate transformers parameterized \
    git+https://github.com/NERSC/nersc-tensorboard-helper.git

# Install PyG
RUN FORCE_CUDA=1 \
    TORCH_CUDA_ARCH_LIST="8.0" \
    CPATH=/usr/local/cuda/include \
    MAKEFLAGS="-j${num_build_workers}" \
    pip install --no-cache-dir git+https://github.com/pyg-team/pyg-lib.git torch_scatter torch_sparse torch_cluster torch-geometric

# Install nccl-tests
RUN cd $(mktemp -d) && \
    git clone https://github.com/NVIDIA/nccl-tests.git && \
    cd nccl-tests && \
    make MPI=1 MPI_HOME=/usr/local/mpi && \
    mv build /opt/nccl-tests && \
    cd .. && rm -rf nccl-tests
