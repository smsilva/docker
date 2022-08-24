FROM alpine:3.16.2

RUN apk --no-cache add \
  bash \
  curl \
  bind-tools

RUN mkdir -p /opt/kubernetes && \
  wget \
    --output-document /opt/kubernetes/kubectl \
    https://dl.k8s.io/release/v1.22.13/bin/linux/amd64/kubectl && \
  chmod +x /opt/kubernetes/kubectl

ENV PATH=${PATH?}:/opt/kubernetes/
