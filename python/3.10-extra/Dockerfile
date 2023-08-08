FROM        --platform=$TARGETOS/$TARGETARCH python:3.10-slim

LABEL       author="EgoMaw" maintainer="egomaw@dedicatedmc.io"

RUN         apt-get update \
            && apt-get install -y --no-install-recommends gettext-base git gcc g++ ca-certificates dnsutils curl iproute2 ffmpeg procps\
            gconf-service chromium chromium-driver wget\
            && useradd -m -d /home/container container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY       --chown=container --chmod=500 ./../entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]
