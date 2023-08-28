FROM  mcr.microsoft.com/devcontainers/ubuntu:latest

RUN apt-get update && apt-get install -y software-properties-common
RUN apt-get update && apt-get install -y tmux curl wget git vim \
    python3 python3-pip dos2unix python3-virtualenv python3-dev \
    build-essential

# Change system to use alternative python 3
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 1
