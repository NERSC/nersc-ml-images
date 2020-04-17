## NERSC Deep Learing GPU Images

This repo contains NERSC ML Dockerfiles and other related build scripts.

We images are currently based on NVidia's GPU Cloud Containers (NGC), which
typically have optimizations for best performance on NVidia GPUs. Note that
PyTorch and TensorFlow in these images are compiled from source master branch
and don't necessarily correspond to an official release. Please refer to the
relevant release docs
([PyTorch](https://docs.nvidia.com/deeplearning/frameworks/pytorch-release-notes/index.html),
[TensorFlow](https://docs.nvidia.com/deeplearning/frameworks/tensorflow-release-notes/index.html))
for other software versions.
