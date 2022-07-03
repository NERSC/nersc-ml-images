NVC_TAG=22.05
NERSC_TAG="ngc-${NVC_TAG}-v1"

docker build --platform linux/amd64 --build-arg nvc_tag=$NVC_TAG-py3 -t nersc/pytorch:$NERSC_TAG -f Dockerfile .
