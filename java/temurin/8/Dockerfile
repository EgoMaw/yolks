FROM        --platform=$TARGETOS/$TARGETARCH eclipse-temurin:8-focal

LABEL       author="EgoMaw" maintainer="egomaw@dedicatedmc.io"

LABEL       org.opencontainers.image.source="https://github.com/egomaw/yolks"
LABEL       org.opencontainers.image.licenses=MIT

RUN         apt-get update -y \
			&& apt-get install --no-install-recommends -y gettext-base jq iputils-ping curl ca-certificates openssl git tar sqlite3 fontconfig tzdata iproute2 libfreetype6 \
			&& useradd -d /home/container -m container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY       --chown=container --chmod=555 ./../../entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]
