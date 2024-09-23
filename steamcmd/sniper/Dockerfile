# ---------------------------------------------
# Steam Sniper image (RT3)
# ---------------------------------------------
FROM         --platform=$TARGETOS/$TARGETARCH registry.gitlab.steamos.cloud/steamrt/sniper/platform:latest-container-runtime-depot

LABEL       author="Kimon EgoMaw" maintainer="egomaw@dedicatedmc.io"
LABEL       org.opencontainers.image.description="SteamRT3 Platform image for Pterodactyl Source engine servers."

## install required packages
RUN         dpkg --add-architecture i386 \
            && apt-get update \
            && apt-get upgrade -y \
            && apt-get install -y tar curl iproute2 tini gettext-base jq \
			&& apt-get clean && rm -rf /var/lib/apt/lists/* \
            && useradd -m -d /home/container container

## install rcon
RUN         rcon_link=$(curl -s https://api.github.com/repos/gorcon/rcon-cli/releases/latest | jq -r '.assets | map(select(.browser_download_url | contains("amd64_linux.tar.gz"))) | .[] | .browser_download_url') \
            && curl -sSL "$rcon_link" -o /tmp/rcon.tar.gz \
            && tar xvf /tmp/rcon.tar.gz --strip-components 1 -C /usr/local/bin/ --wildcards --no-anchored '*rcon' && rm /tmp/rcon.tar.gz

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

STOPSIGNAL SIGINT

COPY        --chown=container --chmod=555 ./../entrypoint.sh /entrypoint.sh
RUN         chmod +x /entrypoint.sh
ENTRYPOINT  ["/usr/bin/tini", "-g", "--"]
CMD         ["/entrypoint.sh"]
