NVC_TAG=21.08
NERSC_TAG="ngc-${NVC_TAG}-v2"

docker build --build-arg nvc_tag=$NVC_TAG-py3 -t nersc/pytorch:$NERSC_TAG -f Dockerfile .
