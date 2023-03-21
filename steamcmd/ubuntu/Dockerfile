FROM        --platform=$TARGETOS/$TARGETARCH ubuntu:22.04

LABEL       author="EgoMaw" maintainer="egomaw@dedicatedmc.io"

LABEL       org.opencontainers.image.source="https://github.com/egomaw/yolks"
LABEL       org.opencontainers.image.licenses=MIT

ENV         DEBIAN_FRONTEND=noninteractive

RUN         dpkg --add-architecture i386 \
			&& apt update \
			&& apt upgrade -y \
			&& apt -y install tar curl jq gcc g++ lib32gcc-s1 libgcc1 libcurl4-gnutls-dev:i386 libssl-dev:i386 libssl-dev libcurl4:i386 lib32tinfo6 libtinfo6:i386 lib32z1 lib32stdc++6 libncurses5:i386 libcurl3-gnutls:i386 libsdl2-2.0-0:i386 iproute2 gdb libsdl1.2debian libfontconfig1 telnet net-tools netcat tzdata  libtinfo6:i386 libtbb2:i386 libtinfo5:i386 libcurl4-gnutls-dev:i386 libcurl4:i386 libncurses5:i386 libcurl3-gnutls:i386 faketime:i386 libtbb2:i386 \
			&& apt -y install lib32tinfo6 lib32stdc++6 lib32z1 libtbb2 libtinfo5 libstdc++6 readline-common libncursesw5 gettext-base libfontconfig1 libnss-wrapper gettext-base libc++-dev libc6-i386 libcurl4 libc6 libc6:i386 libssl3 libssl3:i386 libc6 libc6:i386 xvfb

RUN 		useradd -d /home/container -m container

## install rcon
RUN 		cd /tmp/ \
			&& version=$(curl -s https://api.github.com/repos/gorcon/rcon-cli/releases/latest | jq -r '.tag_name' | cut -c 2-)\
            && curl -sSL https://github.com/gorcon/rcon-cli/releases/download/v${version}/rcon-${version}-amd64_linux.tar.gz -o rcon.tar.gz \
			&& tar xvf rcon.tar.gz \
			&& mv rcon-${version}-amd64_linux/rcon /usr/local/bin/

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ../entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]
