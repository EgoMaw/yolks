FROM        --platform=$TARGETOS/$TARGETARCH node:19-slim
LABEL       author="EgoMaw" maintainer="egomaw@dedicatedmc.io"

RUN         apt update \
            && apt -y install gettext-base ffmpeg iproute2 git sqlite3 libsqlite3-dev python3 python3-dev ca-certificates dnsutils tzdata zip tar curl build-essential libtool \
            && useradd -m -d /home/container container

RUN         npm install npm@latest -g && corepack prepare --all

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./../entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]
