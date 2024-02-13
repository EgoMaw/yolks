FROM        --platform=$TARGETOS/$TARGETARCH debian:bullseye-slim

LABEL       author="EgoMaw" maintainer="egomaw@dedicatedmc.io"

LABEL       org.opencontainers.image.source="https://github.com/egomaw/yolks"
LABEL       org.opencontainers.image.licenses=MIT

ENV         DEBIAN_FRONTEND=noninteractive

RUN         dpkg --add-architecture i386 \
            && apt-get update \
            && apt-get upgrade -y \
            && apt-get install -y tar curl gcc g++ lib32gcc-s1 libgcc1 libcurl4-gnutls-dev:i386 libssl1.1:i386 libcurl4:i386 lib32tinfo6 libtinfo6:i386 lib32z1 lib32stdc++6 libncurses5:i386 libcurl3-gnutls:i386 libsdl2-2.0-0:i386 libsdl2-2.0-0 iproute2 gdb libsdl1.2debian libfontconfig1 telnet net-tools netcat tzdata numactl xvfb jq gettext-base tini \
            && useradd -m -d /home/container container

## install rcon
RUN         rcon_link=$(curl -sSL https://api.github.com/repos/gorcon/rcon-cli/releases/latest | jq -r '.assets | map(select(.browser_download_url | contains("amd64_linux.tar.gz"))) | .[] | .browser_download_url') \
            && wget "$rcon_link" -O /tmp/rcon.tar.gz \
            && tar xvf /tmp/rcon.tar.gz --strip-components 1 -C /usr/local/bin/ --wildcards --no-anchored '*rcon' && rm /tmp/rcon.tar.gz

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY       --chown=container --chmod=555 ./entrypoint.sh /entrypoint.sh
ENTRYPOINT    ["/usr/bin/tini", "-g", "--"]
CMD         ["/entrypoint.sh"]
