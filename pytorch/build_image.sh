export NVC_TAG=20.03-py3
export NERSC_TAG=1.5.0_v0

if [ ! -d nersc-tensorboard-helper ]; then
  git clone git@github.com:NERSC/nersc-tensorboard-helper.git
fi

docker build --build-arg nvc_tag=$NVC_TAG -t nersc/pytorch:$NERSC_TAG -f Dockerfile .
