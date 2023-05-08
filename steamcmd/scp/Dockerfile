FROM        --platform=$TARGETOS/$TARGETARCH debian:bullseye-slim

LABEL       author="EgoMaw" maintainer="egomaw@dedicatedmc.io"

LABEL       org.opencontainers.image.source="https://github.com/egomaw/yolks"
LABEL       org.opencontainers.image.licenses=MIT

ENV         DEBIAN_FRONTEND=noninteractive
ENV     DISPLAY=:0
ENV     DISPLAY_WIDTH=1024
ENV     DISPLAY_HEIGHT=768
ENV     DISPLAY_DEPTH=16
ENV     XVFB=1

RUN         dpkg --add-architecture i386 \
            && apt-get-get update \
            && apt-get-get upgrade -y \
            && apt-get-get install -y tar curl gcc g++ lib32gcc-s1 libgcc1 libcurl4-gnutls-dev:i386 libssl1.1:i386 libcurl4:i386 lib32tinfo6 libtinfo6:i386 lib32z1 lib32stdc++6 libncurses5:i386 libcurl3-gnutls:i386 libsdl2-2.0-0:i386 libsdl2-2.0-0 iproute2 gdb libsdl1.2debian libfontconfig1 telnet net-tools netcat tzdata numactl xvfb jq gettext-base \
            && useradd -m -d /home/container container

## install rcon
RUN         cd /tmp/ \
            && version=$(curl -s https://api.github.com/repos/gorcon/rcon-cli/releases/latest | jq -r '.tag_name' | cut -c 2-) \
            && curl -sSL https://github.com/gorcon/rcon-cli/releases/download/v${version}/rcon-${version}-amd64_linux.tar.gz -o rcon.tar.gz \
            && tar xvf rcon.tar.gz \
            && mv rcon-${version}-amd64_linux/rcon /usr/local/bin/

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ../entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]
