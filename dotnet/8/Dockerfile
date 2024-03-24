FROM        --platform=$TARGETOS/$TARGETARCH ghcr.io/egomaw/yolks:debian

LABEL       author="EgoMaw" maintainer="egomaw@dedicatedmc.io"

ENV         DEBIAN_FRONTEND noninteractive

RUN        apt-get update -y \
            && apt-get upgrade -y \
            && apt-get install -y --no-install-recommends apt-transport-https curl iproute2 libgdiplus gettext-base \
            && curl -sSL https://dot.net/v1/dotnet-install.sh | bash -s -- -c 8.0 --runtime aspnetcore --install-dir /usr/share \
            && ln -s /usr/share/dotnet /usr/bin/dotnet

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY       --chown=container --chmod=555 ./../entrypoint.sh /entrypoint.sh
ENTRYPOINT    ["/usr/bin/tini", "-g", "--"]
CMD         ["/entrypoint.sh"]
