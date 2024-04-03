FROM        --platform=$TARGETOS/$TARGETARCH amazoncorretto:22

LABEL       author="EgoMaw" maintainer="egomaw@dedicatedmc.io"

LABEL       org.opencontainers.image.source="https://github.com/egomaw/yolks"
LABEL       org.opencontainers.image.licenses=MIT

RUN         yum check-update || true \
			&& yum install -y curl lsof ca-certificates iproute net-tools openssl git tar sqlite-devel fontconfig tzdata freetype gettext jq \
			&& yum -y clean all && rm -rf /var/cache && useradd -d /home/container -m container

## install tini
RUN         tini_link=$(curl -s https://api.github.com/repos/krallin/tini/releases/latest | jq -r '.assets | map(select(.name == "tini")) | .[] | .browser_download_url') \
            && curl -sSLO --create-dirs --output-dir /usr/local/bin "$tini_link" && chmod +x /usr/local/bin/tini

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY       --chown=container --chmod=555 ./../../entrypoint.sh /entrypoint.sh
ENTRYPOINT    ["/usr/local/bin/tini", "-g", "--"]
CMD         ["/entrypoint.sh"]
