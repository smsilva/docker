FROM silviosilva/ubuntu:22.04 AS base

ARG MONGOSH_VERSION=2.0.2

RUN mkdir --parents /tmp/mongodb/install && \
    wget "https://downloads.mongodb.com/compass/mongodb-mongosh_${MONGOSH_VERSION?}_amd64.deb" \
      --output-document /tmp/mongodb/install/mongodb-mongosh.deb && \
    dpkg -i /tmp/mongodb/install/mongodb-mongosh.deb && \
    rm -rf /tmp/mongodb/install/

FROM base

ADD entrypoint /opt/scripts/entrypoint
ADD tcpping /opt/scripts/tcpping

ENV PATH=${PATH}:/opt/scripts

ENTRYPOINT ["/opt/scripts/entrypoint"]

WORKDIR /opt/scripts/
