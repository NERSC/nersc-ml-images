NVC_TAG=20.03
NERSC_TAG="ngc_${NVC_TAG}_v0"

if [ ! -d nersc-tensorboard-helper ]; then
  git clone git@github.com:NERSC/nersc-tensorboard-helper.git
fi

docker build --build-arg nvc_tag=$NVC_TAG-py3 -t nersc/pytorch:$NERSC_TAG -f Dockerfile .
