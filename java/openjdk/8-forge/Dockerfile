# Hard coded specific Java version to fix issue with manifest constructor class in
# newer Java versions breaking all modpacks and versions that are not using the
# latest Forge release. This should be removed when the manifest constructor class
# issue is backported or if Forge decides to abandon old versions and we need
# newer Java versions. Old Quay images were updated like once a year, so it's ok.
#
# @see https://github.com/McModLauncher/modlauncher/issues/91

FROM        --platform=$TARGETOS/$TARGETARCH openjdk:8u312-slim-bullseye

LABEL       author="EgoMaw" maintainer="egomaw@dedicatedmc.io"

LABEL       org.opencontainers.image.source="https://github.com/egomaw/yolks"
LABEL       org.opencontainers.image.licenses=MIT

RUN         apt-get update -y \
						&& apt-get install --no-install-recommends -y gettext-base jq curl ca-certificates openssl git tar sqlite3 fontconfig tzdata iproute2 libfreetype6 tini \
						&& useradd -d /home/container -m container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY       --chown=container --chmod=555 ./../../entrypoint.sh /entrypoint.sh
ENTRYPOINT    ["/usr/bin/tini", "-g", "--"]
CMD         ["/entrypoint.sh"]
