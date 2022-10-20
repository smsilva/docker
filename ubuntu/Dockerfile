FROM ubuntu:22.04

RUN apt-get update && \
  apt-get install \
    apt-transport-https \
    curl \
    bind9utils \
    dnsutils \
    --yes

ENV DEBUG_LEVEL=2
