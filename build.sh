#!/bin/bash

docker run --rm repronim/neurodocker:0.7.0 generate docker \
    --pkg-manager apt \
    --base ubuntu:xenial \
    --ants version=2.3.1 \
    --fsl version=6.0.3 \
    --afni version=latest \
    | docker build -t adigherman/neurodocker:xenial -

docker build -t adigherman/neuro-base-xenial ./neuro-base-xenial
docker build -t adigherman/neuroconductor ./neuroconductor-release