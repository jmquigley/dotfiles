#
# https://github.com/devcontainers/cli
#
# A convenience script to build the current container within the docker
# environment. This script is intended to be run from the root of the
# repository.  It also requires the devcontainers/cli to be installed.
# This requires nodejs and npm to be installed.
#

devcontainer up --log-level trace  --workspace-folder ../base
