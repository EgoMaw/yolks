FROM        --platform=$TARGETOS/$TARGETARCH node:21-slim
LABEL       author="EgoMaw" maintainer="egomaw@dedicatedmc.io"

RUN         apt-get update \
            && apt-get -y --no-install-recommends install gettext-base ffmpeg iproute2 git sqlite3 libsqlite3-dev python3 python3-dev ca-certificates dnsutils tzdata zip tar curl build-essential libtool \
            && useradd -m -d /home/container container && npm install -g corepack && corepack enable && corepack prepare pnpm@latest npm@latest yarn@stable --activate

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY       --chown=container --chmod=555 ./../entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]
