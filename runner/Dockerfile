FROM ubuntu:24.04

RUN apt-get update && \
    apt-get upgrade --yes && \
    apt-get install --yes --no-install-recommends \
      apt-transport-https \
    docker.io && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN groupadd \
      --gid 127 runner && \
    useradd \
      --uid 1001 \
      --gid runner \
      --shell /bin/bash \
      --create-home agent && \
    echo "agent:agent" | chpasswd && \
    usermod agent \
      --append \
      --groups docker

USER agent

ADD scripts /home/agent/scripts
ADD .bash_aliases /home/agent/.bash_aliases
ADD .bash_config /home/agent/.bash_config

RUN cat <<EOF >> /home/agent/.bashrc
if [ -f ~/.bash_config ]; then
    . ~/.bash_config
fi
EOF

ENV PATH="/home/agent/scripts:${PATH}"
ENV UMASK_VALUE=0002

WORKDIR /home/agent

ENTRYPOINT ["/home/agent/scripts/entrypoint"]
