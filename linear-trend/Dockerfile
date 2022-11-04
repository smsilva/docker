FROM ubuntu:22.04

RUN apt-get update -qqq && \
  apt-get install -qqq \
    apt-transport-https \
    curl=7.81.0-1ubuntu1.6 \
    python3=3.10.6-1~22.04 \
    python3-pip=22.0.2+dfsg-1 \
    --yes

RUN python3 -m pip install numpy

ENV DEBUG_LEVEL=2

ADD scripts/entrypoint /opt/scripts/entrypoint
ADD scripts/trend.py   /opt/scripts/trend.py

ENTRYPOINT ["/opt/scripts/entrypoint"]
