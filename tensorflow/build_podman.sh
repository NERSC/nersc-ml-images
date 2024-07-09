#!/bin/bash

set -ex

# Configuration
NVC_TAG=${NVC_TAG:-24.06}
NERSC_TAG_VERSION=${NERSC_TAG_VERSION:-00}
NERSC_IMAGE_NAME=${NERSC_IMAGE_NAME:-nersc/tensorflow}
NERSC_TAG=${NERSC_TAG:-${NVC_TAG}.${NERSC_TAG_VERSION}}
NERSC_IMAGE="${NERSC_IMAGE_NAME}:${NERSC_TAG}"
PUSH_DOCKER=${PUSH_DOCKER:-true}
PUSH_REGISTRY=${PUSH_REGISTRY:-false}
PULL_SHIFTER=${PULL_SHIFTER:-true}


# Build the image with podman-hpc
podman-hpc build --build-arg nvc_tag=$NVC_TAG-tf2-py3 -t $NERSC_IMAGE -f Dockerfile .

# Push image to DockerHub
if $PUSH_DOCKER; then
    podman-hpc tag localhost/$NERSC_IMAGE docker.io/$NERSC_IMAGE
    podman-hpc push docker.io/$NERSC_IMAGE
fi

# Push image to NERSC registry
if $PUSH_REGISTRY; then
    REGISTRY_NAME=registry.nersc.gov/library/$NERSC_IMAGE
    podman-hpc tag localhost/$NERSC_IMAGE $REGISTRY_NAME
    podman-hpc push $REGISTRY_NAME
fi

# Pull image back via shifter
if $PULL_SHIFTER; then
    shifterimg pull $NERSC_IMAGE
fi
