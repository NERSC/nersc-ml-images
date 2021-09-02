NVC_TAG=21.06-tf2
NERSC_TAG="ngc-${NVC_TAG}-v0"

docker build --build-arg nvc_tag=$NVC_TAG-py3 -t nersc/tensorflow:$NERSC_TAG -f Dockerfile .
