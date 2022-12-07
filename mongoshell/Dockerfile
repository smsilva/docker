FROM ubuntu:22.04 AS base

RUN apt-get update && \
    apt-get upgrade --yes

RUN apt-get install --yes \
      curl \
      dnsutils \
      jq \
      tcpdump \
      wget

RUN mkdir --parents /tmp/mongodb/install && \
    wget --output-document /tmp/mongodb/install/mongodb-mongosh.deb "https://downloads.mongodb.com/compass/mongodb-mongosh_1.6.0_amd64.deb" && \
    dpkg -i /tmp/mongodb/install/mongodb-mongosh.deb && \
    rm -rf /tmp/mongodb/install/

FROM base

ADD entrypoint /opt/mongodb/entrypoint

ENTRYPOINT ["/opt/mongodb/entrypoint"]
