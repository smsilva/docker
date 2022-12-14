FROM ubuntu:22.04 AS base

RUN apt-get update && \
    apt-get upgrade --yes

RUN apt-get install --yes \
      bridge-utils \
      curl \
      dnsutils \
      jq \
      mtr \
      tcpdump \
      traceroute \
      wget

RUN mkdir --parents /tmp/mongodb/install && \
    wget "https://downloads.mongodb.com/compass/mongodb-mongosh_1.6.0_amd64.deb" \
      --output-document /tmp/mongodb/install/mongodb-mongosh.deb && \
    dpkg -i /tmp/mongodb/install/mongodb-mongosh.deb && \
    rm -rf /tmp/mongodb/install/

FROM base

ADD entrypoint /opt/scripts/entrypoint
ADD tcpping /opt/scripts/tcpping

ENV PATH=${PATH}:/opt/scripts

ENTRYPOINT ["/opt/scripts/entrypoint"]

WORKDIR /opt/scripts/
