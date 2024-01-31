# ----------------------------------
# Generic Wine image
# ----------------------------------
FROM    ghcr.io/egomaw/yolks:debian

LABEL   author="EgoMaw" maintainer="egomaw@dedicatedmc.io"

## install required packages
RUN     dpkg --add-architecture i386 \
        && apt-get update -y \
        && apt-get install -y --no-install-recommends gnupg2 numactl tzdata software-properties-common libntlm0 winbind xvfb xauth python3 libncurses5:i386 libncurses6:i386 libsdl2-2.0-0 libsdl2-2.0-0:i386 gettext-base

# Install winehq-stable and with recommends
RUN     mkdir -pm755 /etc/apt/keyrings \
        && wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key \
        && wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/debian/dists/bullseye/winehq-bullseye.sources \
        && apt-get update \
		&& apt-get install -y --no-install-recommends winehq-stable cabextract

# Set up Winetricks
RUN	wget -q -O /usr/sbin/winetricks https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks \
        && chmod +x /usr/sbin/winetricks

ENV     HOME=/home/container
ENV     WINEPREFIX=/home/container/.wine
ENV     WINEDLLOVERRIDES="mscoree,mshtml="
ENV     DISPLAY=:0
ENV     DISPLAY_WIDTH=1024
ENV     DISPLAY_HEIGHT=768
ENV     DISPLAY_DEPTH=16
ENV     AUTO_UPDATE=1
ENV     XVFB=1

USER    container
WORKDIR	/home/container

COPY       --chown=container --chmod=555 ./../entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]
