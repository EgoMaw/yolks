FROM        --platform=$TARGETOS/$TARGETARCH debian:stable-slim
LABEL       author="EgoMaw" maintainer="egomaw@dedicatedmc.io"

ENV         DEBIAN_FRONTEND=noninteractive

RUN         apt-get update \
            && apt-get -y --no-install-recommends install gettext-base ffmpeg iproute2 git sqlite3 libsqlite3-dev python3 python3-dev ca-certificates dnsutils tzdata zip tar curl build-essential libtool jq tini \
			&& apt-get clean && rm -rf /var/lib/apt/lists/* \
            && useradd -m -d /home/container container

## install syncthing
RUN         syncthing_link=$(curl -sSL https://api.github.com/repos/syncthing/syncthing/releases/latest | jq -r '.assets | map(select(.name | contains("linux-amd64"))) | .[] | .browser_download_url') \
            && curl -sSL "$syncthing_link" -o /tmp/syncthing.tar.gz \
            && tar xvf /tmp/syncthing.tar.gz --strip-components 1 -C /usr/local/bin/ --no-anchored 'syncthing' --exclude "etc/*" && rm /tmp/syncthing.tar.gz

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY       --chown=container --chmod=555 ./entrypoint.sh /entrypoint.sh
ENTRYPOINT    ["/usr/bin/tini", "-g", "--"]
CMD         ["/entrypoint.sh"]
