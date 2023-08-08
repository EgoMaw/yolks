FROM        --platform=$TARGETOS/$TARGETARCH ghcr.io/egomaw/yolks:debian

LABEL       author="EgoMaw" maintainer="egomaw@dedicatedmc.io"

ENV         DEBIAN_FRONTEND noninteractive

RUN        apt-get update -y \
            && apt-get upgrade -y \
            && apt-get install -y libgdiplus gettext-base \
            && curl -sSL https://dot.net/v1/dotnet-install.sh | bash -s -- -c 7.0 --runtime aspnetcore --install-dir /usr/share/dotnet

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY       --chown=container --chmod=500 ./../entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]
