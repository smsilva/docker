FROM ubuntu:22.04

RUN apt-get update && \
    apt-get upgrade --yes

RUN apt-get install --yes \
      apt-transport-https \
      bridge-utils \
      curl \
      dnsutils \
      gpg \
      jq \
      mtr \
      netcat \
      tcpdump \
      telnet \
      traceroute \
      wget

RUN groupadd \
      --gid 1003 docker && \
    useradd \
      --uid 1001 \
      --gid docker \
      --shell /bin/bash \
      --create-home agent && \
    echo "agent:agent" | chpasswd && \
    usermod agent \
      --append \
      --groups docker

RUN apt-get install --yes \
      docker.io

USER agent

ADD .bash_aliases /home/agent/.bash_aliases
ADD .bash_config /home/agent/.bash_config

RUN cat <<EOF >> /home/agent/.bashrc
if [ -f ~/.bash_config ]; then
    . ~/.bash_config
fi
EOF

WORKDIR /home/agent
