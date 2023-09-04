#!/usr/bin/bash

pushd ${ENVIRONMENT}
conda env export > ./conf/conda-environment.yml
popd