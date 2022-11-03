FROM        --platform=$TARGETOS/$TARGETARCH ghcr.io/egomaw/yolks:debian

LABEL       author="EgoMaw" maintainer="egomaw@dedicatedmc.io"

ENV         DEBIAN_FRONTEND noninteractive

RUN        apt update -y \
            && wget https://packages.microsoft.com/config/debian/11/packages-microsoft-prod.deb -O packages-microsoft-prod.deb \
            && sudo dpkg -i packages-microsoft-prod.deb \
            && rm packages-microsoft-prod.deb \
            && apt update -y \
            && apt install -y aspnetcore-runtime-6.0

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./../entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]
