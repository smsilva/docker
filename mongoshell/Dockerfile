FROM ubuntu:22.04

RUN apt-get update && \
    apt-get upgrade --yes

RUN apt-get install --yes \
      curl \
      dnsutils \
      jq \
      tcpdump \
      wget

RUN mkdir -p /opt/mongodb/install && \
    wget \
      --output-document /opt/mongodb/install/mongodb-mongosh.deb \
      "https://downloads.mongodb.com/compass/mongodb-mongosh_1.6.0_amd64.deb"

RUN dpkg -i /opt/mongodb/install/mongodb-mongosh.deb

ADD entrypoint /opt/mongodb/entrypoint

CMD ["/opt/mongodb/entrypoint"]
