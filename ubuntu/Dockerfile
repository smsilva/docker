FROM ubuntu:24.04

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
      netcat-traditional \
      tcpdump \
      telnet \
      traceroute \
      wget

ENV UMASK_VALUE=0002
