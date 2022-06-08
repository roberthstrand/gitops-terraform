FROM ghcr.io/weaveworks/tf-runner:v0.9.5

# RUN apk add --update --no-cache \
#     bash \
#     curl \
#     jq \
#     make \
#     openssl \
#     tar \
#     zip \
#     zlib \
#     && rm -rf /var/cache/apk/*

USER root

WORKDIR /sbin/

COPY entrypoint.sh entrypoint.sh
RUN chmod +x entrypoint.sh

RUN apk add --update --no-cache \
    python3 \
    py3-pip \
    gcc musl-dev python3-dev libffi-dev openssl-dev cargo make \
    && rm -rf /var/cache/apk/* \
    && pip install --upgrade pip && pip install azure-cli

USER controller

ENTRYPOINT [ "/sbin/tini", "--", "/sbin/entrypoint.sh" ]