FROM        --platform=$TARGETOS/$TARGETARCH debian:stable-slim

LABEL       author="EgoMaw" maintainer="egomaw@dedicatedmc.io"

LABEL       org.opencontainers.image.source="https://github.com/egomaw/yolks"
LABEL       org.opencontainers.image.licenses=MIT

ENV LANG=C.UTF-8

RUN         apt-get update -y \
				&& apt-get install --no-install-recommends -y gettext-base jq curl ca-certificates openssl git tar sqlite3 fontconfig tzdata iproute2 libfreetype6 iputils-ping tini \
				&& useradd -m -d /home/container -s /bin/bash container

RUN         curl -sSL https://download.oracle.com/java/17/archive/jdk-17_linux-x64_bin.tar.gz -o java.tar.gz \
				&& mkdir -p /usr/local/graalvm && tar -vxzf java.tar.gz -C /usr/local/graalvm --strip-components 1 \
				&& rm java.tar.gz

USER        container
WORKDIR     /home/container
ENV         JAVA_HOME=/usr/local/graalvm
ENV         PATH=$PATH:$JAVA_HOME/bin
ENV         USER=container HOME=/home/container


COPY       --chown=container --chmod=555 ./../../entrypoint.sh /entrypoint.sh
ENTRYPOINT    ["/usr/bin/tini", "-g", "--"]
CMD         ["/entrypoint.sh"]
