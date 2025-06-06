FROM         --platform=$TARGETOS/$TARGETARCH debian:bullseye-slim

LABEL        author="EgoMaw" maintainer="egomaw@dedicatedmc.io"

LABEL        org.opencontainers.image.source="https://github.com/egomaw/yolks"
LABEL        org.opencontainers.image.licenses=MIT

ENV          DEBIAN_FRONTEND=noninteractive

RUN          useradd -m -d /home/container -s /bin/bash container

RUN          ln -s /home/container/ /nonexistent

ENV          USER=container HOME=/home/container

## Update base packages
RUN          apt-get update \
             && apt-get upgrade -y

## Install dependencies
RUN         apt-get install -y gcc g++ libgcc1 libc++-dev gdb libc-dev git wget curl tar zip unzip binutils xz-utils liblzo2-2 cabextract iproute2 net-tools netcat telnet libatomic1 libsdl1.2debian libsdl2-2.0-0 \
            libfontconfig libicu67 icu-devtools libunwind8 libssl-dev sqlite3 libsqlite3-dev libmariadbclient-dev-compat libduktape205 locales ffmpeg gnupg2 apt-transport-https software-properties-common ca-certificates \
            liblua5.3-0 libz-dev rapidjson-dev tzdata libevent-dev libzip4 libprotobuf23 libevent-dev libfluidsynth2 gettext-base procps tini \
            && apt-get clean && rm -rf /var/lib/apt/lists/*

## Configure locale
RUN          update-locale lang=en_US.UTF-8 && dpkg-reconfigure --frontend noninteractive locales


WORKDIR     /home/container

COPY       --chown=container --chmod=555 ./entrypoint.sh /entrypoint.sh
ENTRYPOINT    ["/usr/bin/tini", "-g", "--"]
CMD         ["/entrypoint.sh"]

