# Hard coded specific Java version to fix issue with manifest constructor class in
# newer Java versions breaking all modpacks and versions that are not using the
# latest Forge release. This should be removed when the manifest constructor class
# issue is backported or if Forge decides to abandon old versions and we need
# newer Java versions. Old Quay images were updated like once a year, so it's ok.
#
# @see https://github.com/McModLauncher/modlauncher/issues/91

FROM        --platform=$TARGETOS/$TARGETARCH amazoncorretto:8u312

LABEL       author="EgoMaw" maintainer="egomaw@dedicatedmc.io"

LABEL       org.opencontainers.image.source="https://github.com/egomaw/yolks"
LABEL       org.opencontainers.image.licenses=MIT

RUN         yum check-update || true \
			&& yum install -y curl lsof ca-certificates iproute net-tools openssl git tar sqlite3 fontconfig tzdata freetype gettext jq \
			&& yum -y clean all && rm -rf /var/cache \
			&& useradd -d /home/container -m container

## install tini
RUN         tini_link=$(curl -s https://api.github.com/repos/krallin/tini/releases/latest | jq -r '.assets | map(select(.name == "tini")) | .[] | .browser_download_url') \
            && curl -sSLO --create-dirs --output-dir /usr/local/bin "$tini_link"

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY       --chown=container --chmod=555 ./../../entrypoint.sh /entrypoint.sh
ENTRYPOINT    ["/usr/bin/tini", "-g", "--"]
CMD         ["/entrypoint.sh"]
