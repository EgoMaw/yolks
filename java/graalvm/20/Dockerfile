FROM        --platform=$TARGETOS/$TARGETARCH debian:stable-slim

LABEL       author="EgoMaw" maintainer="egomaw@dedicatedmc.io"

LABEL       org.opencontainers.image.source="https://github.com/egomaw/yolks"
LABEL       org.opencontainers.image.licenses=MIT

RUN         apt-get update -y \
				&& apt-get install --no-install-recommends -y gettext-base jq curl ca-certificates openssl git tar sqlite3 fontconfig tzdata iproute2 libfreetype6 iputils-ping locales \
				&& useradd -d /home/container -m container

RUN          curl -sSL https://download.oracle.com/graalvm/20/latest/graalvm-jdk-20_linux-x64_bin.tar.gz -o java.tar.gz \
				&& mkdir -p /usr/local/graalvm && tar -vxzf java.tar.gz -C /usr/local/graalvm --strip-components 1 \
				&& rm java.tar.gz

USER        container
ENV         JAVA_HOME=/usr/local/graalvm
ENV         PATH=$PATH:$JAVA_HOME/bin
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

RUN         update-locale lang=en_US.UTF-8 && dpkg-reconfigure --frontend noninteractive locales

COPY       --chown=container --chmod=555 ./../../entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]
