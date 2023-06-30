FROM        --platform=$TARGETOS/$TARGETARCH debian:stable-slim

LABEL       author="EgoMaw" maintainer="egomaw@dedicatedmc.io"

LABEL       org.opencontainers.image.source="https://github.com/egomaw/yolks"
LABEL       org.opencontainers.image.licenses=MIT

RUN         apt-get update -y \
			&& apt-get install -y gettext-base jq curl ca-certificates openssl git tar sqlite3 fontconfig tzdata iproute2 libfreetype6 iputils-ping \
			&& useradd -d /home/container -m container

RUN          curl -sSL https://download.oracle.com/graalvm/20/latest/graalvm-jdk-20_linux-x64_bin.tar.gz -o java.tar.gz \
				&& mkdir -p /tmp/java && tar -vxzf java.tar.gz -C /tmp/java \
				&& mv /tmp/java/$(ls /tmp/java) /usr/local/graalvm

USER        container
ENV         JAVA_HOME=/usr/local/graalvm
ENV         PATH=$PATH:$JAVA_HOME/bin
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY       ./../../entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]
