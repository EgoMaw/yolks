FROM        --platform=$TARGETOS/$TARGETARCH amazoncorretto:20

LABEL       author="EgoMaw" maintainer="egomaw@dedicatedmc.io"

LABEL       org.opencontainers.image.source="https://github.com/egomaw/yolks"
LABEL       org.opencontainers.image.licenses=MIT

RUN         yum check-update || true \
			&& yum install -y curl lsof ca-certificates iproute net-tools openssl git tar sqlite3 fontconfig tzdata freetype gettext jq \
			&& yum -y clean all && rm -rf /var/cache && useradd -d /home/container -m container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY       --chown=container --chmod=555 ./../../entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]
