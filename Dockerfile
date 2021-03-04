FROM alpine:3

ARG KUSTOMIZE_VERSION=3.9.4

RUN apk add --no-cache \
  curl \
  bash \
  git \
  && rm -rf /var/cache/apk/*

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN curl -sL https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE_VERSION}/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz \
  | tar xz -C /usr/local/bin 

COPY kustdiff /kustdiff

ENTRYPOINT ["/kustdiff"]
