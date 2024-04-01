FROM        --platform=$TARGETOS/$TARGETARCH node:20-slim
LABEL       author="EgoMaw" maintainer="egomaw@dedicatedmc.io"

RUN         apt-get update \
            && apt-get -y --no-install-recommends install gettext-base ffmpeg iproute2 git sqlite3 libsqlite3-dev python3 python3-dev ca-certificates dnsutils tzdata zip tar curl build-essential libtool tini \
            && useradd -m -d /home/container container && npm install -g --force npm@latest && npm install -g  --force yarn@latest && npm install -g --force pnpm@latest

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY       --chown=container --chmod=555 ./../entrypoint.sh /entrypoint.sh
ENTRYPOINT    ["/usr/bin/tini", "-g", "--"]
CMD         ["/entrypoint.sh"]
