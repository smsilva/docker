FROM silviosilva/ubuntu:22.04

RUN groupadd \
      --gid 1003 docker && \
    apt-get install --yes \
      docker.io

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

WORKDIR /home/agent
