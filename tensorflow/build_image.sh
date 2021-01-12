NVC_TAG=20.08-tf1
NERSC_TAG="ngc-${NVC_TAG}-v0"

if [ ! -d nersc-tensorboard-helper ]; then
  git clone git@github.com:NERSC/nersc-tensorboard-helper.git
fi

docker build --build-arg nvc_tag=$NVC_TAG-py3 -t nersc/tensorflow:$NERSC_TAG -f Dockerfile .
