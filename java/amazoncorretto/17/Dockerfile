FROM        --platform=$TARGETOS/$TARGETARCH amazoncorretto:17

LABEL       author="EgoMaw" maintainer="egomaw@dedicatedmc.io"

LABEL       org.opencontainers.image.source="https://github.com/egomaw/yolks"
LABEL       org.opencontainers.image.licenses=MIT

RUN         yum check-update || true
RUN	        yum install -y curl lsof ca-certificates openssl git tar sqlite3 fontconfig tzdata iproute2 libfreetype6
RUN 		useradd -d /home/container -m container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY       ./../../entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]