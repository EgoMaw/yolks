FROM        --platform=$BUILDPLATFORM ghcr.io/egomaw/yolks:debian

LABEL       author="EgoMaw" maintainer="egomaw@dedicatedmc.io"

ENV         DEBIAN_FRONTEND noninteractive

RUN        apt update -y \
            && apt upgrade -y \
            && apt install -y libgdiplus \
            && curl -sSL https://dot.net/v1/dotnet-install.sh | bash -s -- -c 5.0 --runtime aspnetcore --install-dir /usr/bin/

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./../entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]
