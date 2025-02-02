FROM ubuntu:22.04


RUN apt-get update && apt-get install -y software-properties-common tzdata && \
    ln -fs /usr/share/zoneinfo/America/Chicago /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata

RUN apt-get update && \
    apt-get install -y openssh-server tmux locales --no-install-recommends \
	    curl wget git vim python3 python3-pip dos2unix zsh \
        python3-virtualenv python3-dev build-essential \
        apt-transport-https software-properties-common man manpages-posix \
        ca-certificates gnupg less most net-tools

ENV TZ="America/Chicaog"

# Install node
ENV NODE_MAJOR=20
ENV NVM_VERSION=0.39.5
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v${NVM_VERSION}/install.sh | bash
RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
RUN echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_${NODE_MAJOR}.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list
RUN apt-get update
RUN apt-get install -y nodejs
RUN wget -qO- https://get.pnpm.io/install.sh | bash -

# Setup python
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 1
RUN git clone https://github.com/pyenv/pyenv.git ~/.pyenv

# Prepare the startup environment
RUN mkdir -p /root/.ssh
RUN mkdir -p /workspace
RUN ln -s /workspace /root/workspace
COPY dev.sh /tmp/dev.sh
COPY post-start.sh /tmp/post-start.sh
RUN chmod 755 /tmp/dev.sh /tmp/post-start.sh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Configure SSH server
RUN mkdir -p /var/run/sshd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
RUN sed -i 's/UsePAM yes/UsePAM no/' /etc/ssh/sshd_config
RUN ssh-keyscan github.com >> ~/.ssh/known_hosts

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

ENV TERM=xterm-256color

EXPOSE 22
EXPOSE 3000

CMD ["bash", "/tmp/dev.sh"]
