FROM        --platform=$TARGETOS/$TARGETARCH python:3.10-slim

LABEL       author="EgoMaw" maintainer="egomaw@dedicatedmc.io"

RUN         apt-get update \
            && apt-get install -y --no-install-recommends gettext-base git gcc g++ ca-certificates dnsutils curl iproute2 ffmpeg procps\
            gconf-service chromium=112.0.5615.138-1~deb11u1 chromium-common=112.0.5615.138-1~deb11u1 chromium-driver=112.0.5615.138-1~deb11u1 wget\
            && useradd -m -d /home/container container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./../entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]
