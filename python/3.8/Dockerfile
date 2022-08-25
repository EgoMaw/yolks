FROM        --platform=$TARGETOS/$TARGETARCH python:3.8-slim

LABEL       author="EgoMaw" maintainer="egomaw@dedicatedmc.io"

RUN         apt update \
            && apt install -y git gcc g++ ca-certificates dnsutils curl iproute2 ffmpeg procps \
            && useradd -m -d /home/container container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./../entrypoint.sh /entrypoint.sh
CMD         ["/bin/bash", "/entrypoint.sh"]
