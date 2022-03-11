NVC_TAG=22.02
NERSC_TAG="ngc-${NVC_TAG}-v0"

docker build --build-arg nvc_tag=$NVC_TAG-py3 -t nersc/pytorch:$NERSC_TAG -f Dockerfile .
